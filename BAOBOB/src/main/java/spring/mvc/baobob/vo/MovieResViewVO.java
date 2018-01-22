package spring.mvc.baobob.vo;

import java.util.ArrayList;

public class MovieResViewVO {
	private int totalCol;
	private int totalRow;
	private ArrayList<Integer> state;
	private ArrayList<Integer> seat_index;
	
	public int getTotalCol() {
		return totalCol;
	}
	public void setTotalCol(int totalCol) {
		this.totalCol = totalCol;
	}
	public int getTotalRow() {
		return totalRow;
	}
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}
	public ArrayList<Integer> getState() {
		return state;
	}
	public void setState(ArrayList<Integer> state) {
		this.state = state;
	}
	public ArrayList<Integer> getSeat_index() {
		return seat_index;
	}
	public void setSeat_index(ArrayList<Integer> seat_index) {
		this.seat_index = seat_index;
	}
	
	
}
