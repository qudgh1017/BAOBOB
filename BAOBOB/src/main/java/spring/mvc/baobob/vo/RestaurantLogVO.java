package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class RestaurantLogVO {

	private int restaurant_index; // 매장번호
	private String restaurant_tel; // 전화번호
	private String restaurant_name; // 매장명
	private int restaurant_schedule_index;
	private Timestamp schedule_starttime;
	private Timestamp schedule_endtime;
	private int history_index;
	private Timestamp history_date;
	private String member_id;
	private int restaurant_history_state;
	private int restaurant_table_index;
	private int table_col;
	private int table_row;
	private String table_state;

	public String getTable_state() {
		return table_state;
	}

	public void setTable_state(String table_state) {
		this.table_state = table_state;
	}

	public int getTable_col() {
		return table_col;
	}

	public void setTable_col(int table_col) {
		this.table_col = table_col;
	}

	public int getTable_row() {
		return table_row;
	}

	public void setTable_row(int table_row) {
		this.table_row = table_row;
	}

	public int getRestaurant_history_state() {
		return restaurant_history_state;
	}

	public void setRestaurant_history_state(int restaurant_history_state) {
		this.restaurant_history_state = restaurant_history_state;
	}

	public int getRestaurant_index() {
		return restaurant_index;
	}

	public void setRestaurant_index(int restaurant_index) {
		this.restaurant_index = restaurant_index;
	}

	public String getRestaurant_tel() {
		return restaurant_tel;
	}

	public void setRestaurant_tel(String restaurant_tel) {
		this.restaurant_tel = restaurant_tel;
	}

	public String getRestaurant_name() {
		return restaurant_name;
	}

	public void setRestaurant_name(String restaurant_name) {
		this.restaurant_name = restaurant_name;
	}

	public int getRestaurant_schedule_index() {
		return restaurant_schedule_index;
	}

	public void setRestaurant_schedule_index(int restaurant_schedule_index) {
		this.restaurant_schedule_index = restaurant_schedule_index;
	}

	public Timestamp getSchedule_starttime() {
		return schedule_starttime;
	}

	public void setSchedule_starttime(Timestamp schedule_starttime) {
		this.schedule_starttime = schedule_starttime;
	}

	public Timestamp getSchedule_endtime() {
		return schedule_endtime;
	}

	public void setSchedule_endtime(Timestamp schedule_endtime) {
		this.schedule_endtime = schedule_endtime;
	}

	public int getRestaurant_table_index() {
		return restaurant_table_index;
	}

	public void setRestaurant_table_index(int restaurant_table_index) {
		this.restaurant_table_index = restaurant_table_index;
	}

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
