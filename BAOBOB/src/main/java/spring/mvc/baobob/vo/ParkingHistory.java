package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class ParkingHistory {
	// park_history_tbl
	//p_history_index, history_index, p_history_in, p_history_out, p_history_price, p_history_space, p_history_date
	private int p_history_index;//테이블 인덱스
	private int history_index;	//내역 인덱스
	private Timestamp p_history_in; //입차시간
	private Timestamp p_history_out; //출차 시간
	private int p_history_price; //가격
	private String p_history_space; //일반
	private Timestamp p_history_date; //등록일
	private HistoryVO history;

	/*
	 * function spaceType(type) {
	switch(type) {
	case '4': 일반; break;
	case '3': 장애인; break;
	case '2': 임산부; break;
	case '1': 전기차; break;
	case '0': 빈공간; break;
	}
}
	 * */
	public int getP_history_index() {
		return p_history_index;
	}

	public void setP_history_index(int p_history_index) {
		this.p_history_index = p_history_index;
	}

	public int getHistory_index() {
		return history_index;
	}

	public void setHistory_index(int history_index) {
		this.history_index = history_index;
	}

	public Timestamp getP_history_in() {
		return p_history_in;
	}

	public void setP_history_in(Timestamp p_history_in) {
		this.p_history_in = p_history_in;
	}

	public Timestamp getP_history_out() {
		return p_history_out;
	}

	public void setP_history_out(Timestamp p_history_out) {
		this.p_history_out = p_history_out;
	}

	public int getP_history_price() {
		return p_history_price;
	}

	public void setP_history_price(int p_history_price) {
		this.p_history_price = p_history_price;
	}

	public String getP_history_space() {
		return p_history_space;
	}

	public void setP_history_space(String p_history_space) {
		this.p_history_space = p_history_space;
	}

	public Timestamp getP_history_date() {
		return p_history_date;
	}

	public void setP_history_date(Timestamp p_history_date) {
		this.p_history_date = p_history_date;
	}

	public HistoryVO getHistory() {
		return history;
	}

	public void setHistory(HistoryVO history) {
		this.history = history;
	}
	
}
