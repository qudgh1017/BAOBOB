package spring.mvc.baobob.vo;

public class TableVO {
	private int table_col;
	private int table_row;
	private String state;
	private int restaurant_table_index;

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
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getRestaurant_table_index() {
		return restaurant_table_index;
	}
	public void setRestaurant_table_index(int restaurant_table_index) {
		this.restaurant_table_index = restaurant_table_index;
	}
}
