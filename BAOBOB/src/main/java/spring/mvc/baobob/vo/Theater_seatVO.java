package spring.mvc.baobob.vo;

public class Theater_seatVO {
	private int seat_index;
	private int theater_index;
	private int seat_row;
	private int seat_col;
	private int seat_state;
	private int seat_price;
	private int theater_schedule_index;

	public int getSeat_index() {
		return seat_index;
	}

	public void setSeat_index(int seat_index) {
		this.seat_index = seat_index;
	}

	public int getTheater_index() {
		return theater_index;
	}

	public void setTheater_index(int theater_index) {
		this.theater_index = theater_index;
	}

	public int getSeat_row() {
		return seat_row;
	}

	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}

	public int getSeat_col() {
		return seat_col;
	}

	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}

	public int getSeat_state() {
		return seat_state;
	}

	public void setSeat_state(int seat_state) {
		this.seat_state = seat_state;
	}

	public int getSeat_price() {
		return seat_price;
	}

	public void setSeat_price(int seat_price) {
		this.seat_price = seat_price;
	}
	public int getTheater_schedule_index() {
		return theater_schedule_index;
	}
	
	public void setTheater_schedule_index(int theater_schedule_index) {
		this.theater_schedule_index = theater_schedule_index;
	}

}
