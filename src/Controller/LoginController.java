package Controller;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Model.Staff;

@Controller
@Transactional
@SuppressWarnings("unchecked")
@RequestMapping("login")
public class LoginController {
	@Autowired
	SessionFactory factory;
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	@RequestMapping("formLogin")
	public String formLogin() {
		return "login";
	}
	@RequestMapping("login")
	public String login(@RequestParam("username") String username,@RequestParam("password") String password) {
		Session session=factory.getCurrentSession();
		String hql="From Staff s where s.Username=:username and s.Password=:password";
		Query query=session.createQuery(hql);
		query.setParameter("username", username);
		query.setParameter("password", password);
		List<Staff> ds=query.list();
		if(ds.size()>0){
			System.out.println("Success");
			return "index";
		}
		return "login";
	}
	
}

