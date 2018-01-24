package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class WordVO {
	private String word;
	private int count;
	private String type_of_speech;
	private Timestamp update_date;
	private Timestamp reg_date;
	private int movie_index;

	public int getMovie_index() {
		return movie_index;
	}

	public void setMovie_index(int movie_index) {
		this.movie_index = movie_index;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getType_of_speech() {
		return type_of_speech;
	}

	public void setType_of_speech(String type_of_speech) {
		this.type_of_speech = type_of_speech;
	}

	public Timestamp getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(Timestamp update_date) {
		this.update_date = update_date;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

}
