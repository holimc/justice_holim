package project.justice.dictionary;

import java.sql.Timestamp;

public class BoardDTO {
	private int d_board_no;
	private int word_no;
	private String wname;
	private String prompt;
	private String meaning;
	private String detail_content;
	private String b_recommend_user;
	private int b_recommend;
	private String user_id;
	private Timestamp board_reg;
	public int getD_board_no() {
		return d_board_no;
	}
	public void setD_board_no(int d_board_no) {
		this.d_board_no = d_board_no;
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
	public String getPrompt() {
		return prompt;
	}
	public void setPrompt(String prompt) {
		this.prompt = prompt;
	}
	public String getMeaning() {
		return meaning;
	}
	public void setMeaning(String meaning) {
		this.meaning = meaning;
	}
	public String getDetail_content() {
		return detail_content;
	}
	public void setDetail_content(String detail_content) {
		this.detail_content = detail_content;
	}
	public String getB_recommend_user() {
		return b_recommend_user;
	}
	public void setB_recommend_user(String b_recommend_user) {
		this.b_recommend_user = b_recommend_user;
	}
	public int getB_recommend() {
		return b_recommend;
	}
	public void setB_recommend(int b_recommend) {
		this.b_recommend = b_recommend;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getBoard_reg() {
		return board_reg;
	}
	public void setBoard_reg(Timestamp board_reg) {
		this.board_reg = board_reg;
	}
	
	
}
