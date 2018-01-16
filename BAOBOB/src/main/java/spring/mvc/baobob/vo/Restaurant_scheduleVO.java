package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class Restaurant_scheduleVO {
	public int restaurant_index;
	public int restaurant_schedule_index;
	public Timestamp schedule_startDate;
	public Timestamp schedule_startTime;
	public Timestamp schedule_endTime;

	public int getRestaurant_index() {
		return restaurant_index;
	}
	public void setRestaurant_index(int restaurant_index) {
		this.restaurant_index = restaurant_index;
	}
	public int getRestaurant_schedule_index() {
		return restaurant_schedule_index;
	}
	public void setRestaurant_schedule_index(int restaurant_schedule_index) {
		this.restaurant_schedule_index = restaurant_schedule_index;
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
}
