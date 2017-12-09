package Model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Staff {
	@Id
	@GeneratedValue
	private Integer ID;
	private String Name;
	private Boolean Gender;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date Birthday;
	private String Photo;
	private String Email;
	private String Phone;
	private Integer Salary;
	private String Notes;
	private String Username;
	private String Password;
	private Integer Count;
	private Boolean Role;
	private String Avatar;
	private Boolean isRemove;

	@ManyToOne
	@JoinColumn(name = "Departid")
	private Depart dept;
	@OneToMany(mappedBy="st", fetch=FetchType.EAGER)
	private List<Record> r;
	public Staff() {
		// TODO Auto-generated constructor stub
	}

	public Staff(Integer iD, String name, Boolean gender, Date birthday, String photo, String email, String phone,
			Integer salary, String notes, String username, String password, Integer count, Boolean role, String avatar,
			Boolean isRemove, Depart dept) {
		super();
		ID = iD;
		Name = name;
		Gender = gender;
		Birthday = birthday;
		Photo = photo;
		Email = email;
		Phone = phone;
		Salary = salary;
		Notes = notes;
		Username = username;
		Password = password;
		Count = count;
		Role = role;
		Avatar = avatar;
		this.isRemove = isRemove;
		this.dept = dept;
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public Boolean getGender() {
		return Gender;
	}

	public void setGender(Boolean gender) {
		Gender = gender;
	}

	public Date getBirthday() {
		return Birthday;
	}

	public void setBirthday(Date birthday) {
		Birthday = birthday;
	}

	public String getPhoto() {
		return Photo;
	}

	public void setPhoto(String photo) {
		Photo = photo;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

	public Integer getSalary() {
		return Salary;
	}

	public void setSalary(Integer salary) {
		Salary = salary;
	}

	public String getNotes() {
		return Notes;
	}

	public void setNotes(String notes) {
		Notes = notes;
	}

	public String getUsername() {
		return Username;
	}

	public void setUsername(String username) {
		Username = username;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public Integer getCount() {
		return Count;
	}

	public void setCount(Integer count) {
		Count = count;
	}

	public Boolean getRole() {
		return Role;
	}

	public void setRole(Boolean role) {
		Role = role;
	}

	public String getAvatar() {
		return Avatar;
	}

	public void setAvatar(String avatar) {
		Avatar = avatar;
	}

	public Boolean getIsRemove() {
		return isRemove;
	}

	public void setIsRemove(Boolean isRemove) {
		this.isRemove = isRemove;
	}

	public Depart getDept() {
		return dept;
	}

	public void setDept(Depart dept) {
		this.dept = dept;
	}

}
