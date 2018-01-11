package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class ParkingHistory {
	// park_history_tbl
	private int p_history_index;
	private int history_index;
	private Timestamp p_history_in;
	private Timestamp p_history_out;
	private int p_history_price;
	private String p_history_space;
	private Timestamp p_history_date;

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

}
