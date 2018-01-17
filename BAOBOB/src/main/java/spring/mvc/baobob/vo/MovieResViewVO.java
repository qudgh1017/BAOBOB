package spring.mvc.baobob.vo;

import java.util.ArrayList;

public class MovieResViewVO {
	private int totalCol;
	private int totalRow;
	private ArrayList<Integer> state;
	
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
	
	
}
