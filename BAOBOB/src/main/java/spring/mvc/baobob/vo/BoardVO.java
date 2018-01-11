package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class BoardVO {
	
	private int board_index;
	private String member_id;
	private String board_pwd;
	private int board_type;
	private String board_subject;
	private String board_content;
	private String board_img;
	private int board_readCnt;
	private int board_ref;
	private int board_ref_step;
	private int board_ref_level;
	private Timestamp board_reg_date;
	private String board_ip;

	public int getBoard_index() {
		return board_index;
	}
	public void setBoard_index(int board_index) {
		this.board_index = board_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getBoard_pwd() {
		return board_pwd;
	}
	public void setBoard_pwd(String board_pwd) {
		this.board_pwd = board_pwd;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_img() {
		return board_img;
	}
	public void setBoard_img(String board_img) {
		this.board_img = board_img;
	}
	public int getBoard_readCnt() {
		return board_readCnt;
	}
	public void setBoard_readCnt(int board_readCnt) {
		this.board_readCnt = board_readCnt;
	}
	public int getBoard_ref() {
		return board_ref;
	}
	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}
	public int getBoard_ref_step() {
		return board_ref_step;
	}
	public void setBoard_ref_step(int board_ref_step) {
		this.board_ref_step = board_ref_step;
	}
	public int getBoard_ref_level() {
		return board_ref_level;
	}
	public void setBoard_ref_level(int board_ref_level) {
		this.board_ref_level = board_ref_level;
	}
	public Timestamp getBoard_reg_date() {
		return board_reg_date;
	}
	public void setBoard_reg_date(Timestamp board_reg_date) {
		this.board_reg_date = board_reg_date;
	}
	public String getBoard_ip() {
		return board_ip;
	}
	public void setBoard_ip(String board_ip) {
		this.board_ip = board_ip;
	}
	

}
