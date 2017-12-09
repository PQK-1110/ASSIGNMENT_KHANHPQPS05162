package Model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Record {
	@Id
	@GeneratedValue
	private Integer ID;
	private Boolean Type;
	private String Reason;
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	private Date Date;
	
	@ManyToOne
	@JoinColumn(name = "Staffid")
	private Staff st;
	public Record() {
		// TODO Auto-generated constructor stub
	}

	public Integer getID() {
		return ID;
	}

	public void setID(Integer iD) {
		ID = iD;
	}

	public Boolean getType() {
		return Type;
	}

	public void setType(Boolean type) {
		Type = type;
	}

	public String getReason() {
		return Reason;
	}

	public void setReason(String reason) {
		Reason = reason;
	}

	public Date getDate() {
		return Date;
	}

	public void setDate(Date date) {
		Date = date;
	}

	public Staff getSt() {
		return st;
	}

	public void setSt(Staff st) {
		this.st = st;
	}
	

}
