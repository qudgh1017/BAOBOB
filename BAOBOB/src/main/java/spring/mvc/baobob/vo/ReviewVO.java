package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class ReviewVO {
	private int review_index;
	private String review_grade;
	private String review_content;
	private String member_id;
	private int review_state;
	private Timestamp review_reg_date;
	
	public int getReview_index() {
		return review_index;
	}
	public void setReview_index(int review_index) {
		this.review_index = review_index;
	}
	public String getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getReview_state() {
		return review_state;
	}
	public void setReview_state(int review_state) {
		this.review_state = review_state;
	}
	public Timestamp getReview_reg_date() {
		return review_reg_date;
	}
	public void setReview_reg_date(Timestamp review_reg_date) {
		this.review_reg_date = review_reg_date;
	}
	
}
