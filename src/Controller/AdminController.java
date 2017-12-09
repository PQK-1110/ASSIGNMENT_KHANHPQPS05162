package Controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.Depart;
import Model.Staff;
@SuppressWarnings("unchecked")
@Transactional
@Controller
public class AdminController {
	@Autowired
	SessionFactory factory;

	@RequestMapping("showDepart")
	public String showDept(ModelMap model) {

		Session session = factory.getCurrentSession();
		String hql = "From Depart";
		Query query = session.createQuery(hql);
		List<Depart> ds = query.list();
		model.addAttribute("dept", ds);
		return "PhongBan";
	}
	
	@RequestMapping("showStaff")
	public String NhanVien(ModelMap model) {

		Session session = factory.getCurrentSession();
		String hql = "From Staff";
		Query query = session.createQuery(hql);
		List<Depart> ds = query.list();
		model.addAttribute("st", ds);
		return "NhanVien";
	}
	
	@RequestMapping("showRecord")
	public String ThanhTich(ModelMap model) {
	Session s = factory.getCurrentSession();
	String hql1 = "Select r.st.Name," + " Sum(case when r.Type=True then 1 else 0 end),"
			+ "Sum(case when r.Type=False then 1 else 0 end), r.st.dept.Name, r.st.dept.ID " + "From Record r"
			+ " Group By r.st.Name, r.st.dept.Name, r.st.dept.ID ";
	Query query1 = s.createQuery(hql1);
	List<Object[]> dsfull = query1.list();
	@SuppressWarnings("unused")
	String size = String.valueOf(dsfull.size());
	model.addAttribute("re", dsfull);
		return "ThanhTich";
	}
	
	@RequestMapping("showTop")
	public String showTop(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "From Staff";
		Query query = session.createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(10);
		List<Staff> ds = query.list();
		model.addAttribute("top10", ds);
		return "GuongMatTieuBieu";
	}
	
	@RequestMapping("ThemNV")
	public String addnv() {
		return "ThemNV";
	}
	
	@RequestMapping("XoaNV")
	public String delnv() {
		return "XoaNV";
	}
	
	@RequestMapping("SuaNV")
	public String editnv() {
		return "SuaNV";
	}
	
	@RequestMapping("ThemPB")
	public String addpb() {
		return "ThemPB";
	}

	@RequestMapping("XLThem")
	public String addpb(@RequestParam("IDPB") String idpb, @RequestParam("TPB") String tpb) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
		Depart dp = new Depart(idpb,tpb);
		session.save(dp);
		t.commit();
		}catch(Exception e){
			t.rollback();
			System.out.println(e);
		}finally {
			session.close();
		}
	return "redirect:showDepart.htm";
	}
	
	@RequestMapping("XoaPB")
	public String delpb(@RequestParam("id") String idpb) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
		Depart dp = new Depart(idpb);
		session.delete(dp);
		t.commit();
		}catch(Exception e){
			t.rollback();
			System.out.println(e);
		}finally {
			session.close();
		}
		return "redirect:showDepart.htm";
	}
	
	@RequestMapping("SuaPB")
	public String editpb(@RequestParam("id") String idpb, @RequestParam("name") String tpb, ModelMap model) {
		model.addAttribute("id", idpb);
		model.addAttribute("name", tpb);
		return "SuaPB";
	}
	
	@RequestMapping("XLSua")
	public String editpb(@RequestParam("IDPB") String idpb, @RequestParam("TPB") String tpb) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
		Depart dp = new Depart(idpb,tpb);
		session.update(dp);
		t.commit();
		}catch(Exception e){
			t.rollback();
			System.out.println(e);
		}finally {
			session.close();
		}
	return "redirect:showDepart.htm";
	}
}
