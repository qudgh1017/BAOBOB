package spring.mvc.baobob.vo;

import java.util.List;

public class ReviewVO {
	private int review_index;
	private String review_grade;
	private String review_content;
	private Member member;
	
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	
	
}
