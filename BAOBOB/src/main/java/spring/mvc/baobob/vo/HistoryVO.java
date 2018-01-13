package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class HistoryVO {
	private int history_index;
	private Timestamp history_date;
	private String member_id;

	public int getHistory_index() {
		return history_index;
	}

	public void setHistory_index(int history_index) {
		this.history_index = history_index;
	}

	public Timestamp getHistory_date() {
		return history_date;
	}

	public void setHistory_date(Timestamp history_date) {
		this.history_date = history_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

}
