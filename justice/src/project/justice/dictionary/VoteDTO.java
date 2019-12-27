package project.justice.dictionary;

import java.sql.Timestamp;

public class VoteDTO {
	private int vote_no;
	private int d_board_no;
	private String wname;
	private int agree;
	private int disagree;
	private String voter_id;
	private Timestamp vote_reg;
	private String vote_close;
	public int getVote_no() {
		return vote_no;
	}
	public void setVote_no(int vote_no) {
		this.vote_no = vote_no;
	}
	public int getD_board_no() {
		return d_board_no;
	}
	public void setD_board_no(int d_board_no) {
		this.d_board_no = d_board_no;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public int getDisagree() {
		return disagree;
	}
	public void setDisagree(int disagree) {
		this.disagree = disagree;
	}
	public String getVoter_id() {
		return voter_id;
	}
	public void setVoter_id(String voter_id) {
		this.voter_id = voter_id;
	}
	public Timestamp getVote_reg() {
		return vote_reg;
	}
	public void setVote_reg(Timestamp vote_reg) {
		this.vote_reg = vote_reg;
	}
	public String getVote_close() {
		return vote_close;
	}
	public void setVote_close(String vote_close) {
		this.vote_close = vote_close;
	}
	
}
