package Model;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Depart {
	@Id
	private String ID;
	@OneToMany(mappedBy="dept", fetch=FetchType.EAGER)
	private List<Staff> st;
	private String Name;
	
	public static List<Depart> ds=new ArrayList<>();
	public Depart() {
		// TODO Auto-generated constructor stub
	}
	public Depart(String iD, String name) {
		super();
		ID = iD;
		Name = name;
	}
	
	public Depart(String iD) {
		super();
		ID = iD;
	}
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public static List<Depart> getDs() {
		return ds;
	}
	public static void setDs(List<Depart> ds) {
		Depart.ds = ds;
	}
	
}
