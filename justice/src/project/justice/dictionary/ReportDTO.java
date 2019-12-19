package project.justice.dictionary;

public class ReportDTO {
	private int report_no;
	private int word_no;
	private String wname;
	private String user_id;
	private String report_reason;
	private int rpt_count;
	
	
	public int getRpt_count() {
		return rpt_count;
	}
	public void setRpt_count(int rpt_count) {
		this.rpt_count = rpt_count;
	}
	
	public int getReport_no() {
		return report_no;
	}
	public void setReport_no(int report_no) {
		this.report_no = report_no;
	}
	public int getWord_no() {
		return word_no;
	}
	public void setWord_no(int word_no) {
		this.word_no = word_no;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	
	

}
