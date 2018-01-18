package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class Theater_scheduleVO {
	private int theater_schedule_index;
	private int movie_index;
	private int theater_index;
	private Timestamp schedule_startDate;
	private Timestamp schedule_startTime;
	private Timestamp schedule_endTime;
	private int schedule_MDNstate;
	private int schedule_empty_seat;
	private int schedule_seat;

	public int getTheater_schedule_index() {
		return theater_schedule_index;
	}

	public void setTheater_schedule_index(int theater_schedule_index) {
		this.theater_schedule_index = theater_schedule_index;
	}

	public int getMovie_index() {
		return movie_index;
	}

	public void setMovie_index(int movie_index) {
		this.movie_index = movie_index;
	}

	public int getTheater_index() {
		return theater_index;
	}

	public void setTheater_index(int theater_index) {
		this.theater_index = theater_index;
	}

	public Timestamp getSchedule_startDate() {
		return schedule_startDate;
	}

	public void setSchedule_startDate(Timestamp schedule_startDate) {
		this.schedule_startDate = schedule_startDate;
	}

	public Timestamp getSchedule_startTime() {
		return schedule_startTime;
	}

	public void setSchedule_startTime(Timestamp schedule_startTime) {
		this.schedule_startTime = schedule_startTime;
	}

	public Timestamp getSchedule_endTime() {
		return schedule_endTime;
	}

	public void setSchedule_endTime(Timestamp schedule_endTime) {
		this.schedule_endTime = schedule_endTime;
	}

	public int getSchedule_MDNstate() {
		return schedule_MDNstate;
	}

	public void setSchedule_MDNstate(int schedule_MDNstate) {
		this.schedule_MDNstate = schedule_MDNstate;
	}
	public int getSchedule_empty_seat() {
		return schedule_empty_seat;
	}
	public void setSchedule_empty_seat(int schedule_empty_seat) {
		this.schedule_empty_seat = schedule_empty_seat;
	}

	public int getSchedule_seat() {
		return schedule_seat;
	}

	public void setSchedule_seat(int schedule_seat) {
		this.schedule_seat = schedule_seat;
	}

	
}
