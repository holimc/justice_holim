package project.justice.petition;

import java.sql.Timestamp;

public class AnswerDTO extends PetitionDTO{
	private String a_no;
	private Timestamp a_date;
	private String a_link;
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public Timestamp getA_date() {
		return a_date;
	}
	public void setA_date(Timestamp a_date) {
		this.a_date = a_date;
	}
	public String getA_link() {
		return a_link;
	}
	public void setA_link(String a_link) {
		this.a_link = a_link;
	}
	
	
	
	
	

}
