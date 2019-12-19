package project.justice.petition;

import java.sql.Timestamp;

public class PetitionDTO {
	private int p_no; 
    private String p_subject;
    private String p_title;
    private Timestamp p_date;
    private int p_person;
    private int p_check;
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public String getP_subject() {
		return p_subject;
	}
	public void setP_subject(String p_subject) {
		this.p_subject = p_subject;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public Timestamp getP_date() {
		return p_date;
	}
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	public int getP_person() {
		return p_person;
	}
	public void setP_person(int p_person) {
		this.p_person = p_person;
	}
	public int getP_check() {
		return p_check;
	}
	public void setP_check(int p_check) {
		this.p_check = p_check;
	}
    
    
    
}
