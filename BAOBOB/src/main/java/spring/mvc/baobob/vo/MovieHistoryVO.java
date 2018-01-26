package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class MovieHistoryVO {

	private int movie_index;
	private String movie_title;
	private String movie_content;
	private int movie_janre;
	private int movie_age;
	private String movie_rel_date;
	private String movie_director;
	private String movie_star;
	private String movie_country;
	private int movie_runTime;
	private String movie_poster;
	private String movie_trailer;
	private int movie_state;
	private int movie_count;
	
	private int history_index;
	private int theater_schedule_index;
	private Timestamp history_date;
	private String member_id;
	private Timestamp schedule_startTime;
	private Timestamp schedule_endTime;
	
	private int theater_index;
	private String[] seat;

	
	public int getTheater_schedule_index() {
		return theater_schedule_index;
	}

	public void setTheater_schedule_index(int theater_schedule_index) {
		this.theater_schedule_index = theater_schedule_index;
	}

	public int getTheater_index() {
		return theater_index;
	}

	public void setTheater_index(int theater_index) {
		this.theater_index = theater_index;
	}

	public String[] getSeat() {
		return seat;
	}

	public void setSeat(String[] seat) {
		this.seat = seat;
	}

	public int getMovie_index() {
		return movie_index;
	}

	public void setMovie_index(int movie_index) {
		this.movie_index = movie_index;
	}

	public String getMovie_title() {
		return movie_title;
	}

	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}

	public String getMovie_content() {
		return movie_content;
	}

	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}

	public int getMovie_janre() {
		return movie_janre;
	}

	public void setMovie_janre(int movie_janre) {
		this.movie_janre = movie_janre;
	}

	public int getMovie_age() {
		return movie_age;
	}

	public void setMovie_age(int movie_age) {
		this.movie_age = movie_age;
	}

	public String getMovie_rel_date() {
		return movie_rel_date;
	}

	public void setMovie_rel_date(String movie_rel_date) {
		this.movie_rel_date = movie_rel_date;
	}

	public String getMovie_director() {
		return movie_director;
	}

	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}

	public String getMovie_star() {
		return movie_star;
	}

	public void setMovie_star(String movie_star) {
		this.movie_star = movie_star;
	}

	public String getMovie_country() {
		return movie_country;
	}

	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}

	public int getMovie_runTime() {
		return movie_runTime;
	}

	public void setMovie_runTime(int movie_runTime) {
		this.movie_runTime = movie_runTime;
	}

	public String getMovie_poster() {
		return movie_poster;
	}

	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}

	public String getMovie_trailer() {
		return movie_trailer;
	}

	public void setMovie_trailer(String movie_trailer) {
		this.movie_trailer = movie_trailer;
	}

	public int getMovie_state() {
		return movie_state;
	}

	public void setMovie_state(int movie_state) {
		this.movie_state = movie_state;
	}

	public int getMovie_count() {
		return movie_count;
	}

	public void setMovie_count(int movie_count) {
		this.movie_count = movie_count;
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
