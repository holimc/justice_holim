package project.justice.dictionary;

public class DictionaryDTO {
	
	private int word_no;
	private String wname;
	private String meaning;
	private String substitute;
	private String user_id;
	private String dic_recommend_user;
	private int dic_recommend;
	private int report_count;
	private String report_count_user;
	
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
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getSubstitute() {
		return substitute;
	}
	public void setSubstitute(String substitute) {
		this.substitute = substitute;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getReport_count() {
		return report_count;
	}
	public void setReport_count(int report_count) {
		this.report_count = report_count;
	}
	public String getDic_recommend_user() {
		return dic_recommend_user;
	}
	public void setDic_recommend_user(String dic_recommend_user) {
		this.dic_recommend_user = dic_recommend_user;
	}
	public int getDic_recommend() {
		return dic_recommend;
	}
	public void setDic_recommend(int dic_recommend) {
		this.dic_recommend = dic_recommend;
	}
	public String getReport_count_user() {
		return report_count_user;
	}
	public void setReport_count_user(String report_count_user) {
		this.report_count_user = report_count_user;
	}
	
}

