package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class ReplyVO {
	
	private int comment_index;
	private Timestamp reg_date;
	private String comment_content;
	private String member_id;
	private int board_index;
	
	public int getComment_index() {
		return comment_index;
	}
	public void setComment_index(int comment_index) {
		this.comment_index = comment_index;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getBoard_index() {
		return board_index;
	}
	public void setBoard_index(int board_index) {
		this.board_index = board_index;
	}

}
