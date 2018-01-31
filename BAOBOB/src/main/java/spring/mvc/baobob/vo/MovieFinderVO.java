package spring.mvc.baobob.vo;

import java.util.Arrays;

//무비파인더 파라미터용으로 쓸  VO입니다.
public class MovieFinderVO {
	private String sel;
	private String keyword;
	private int[] movie_janre;
	private int[] movie_age;
	private String[] movie_country;
	private int start;
	private int end;
	
	public String getSel() {
		return sel;
	}
	public void setSel(String sel) {
		this.sel = sel;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int[] getMovie_janre() {
		return movie_janre;
	}
	public void setMovie_janre(int[] movie_janre) {
		this.movie_janre = movie_janre;
	}
	public int[] getMovie_age() {
		return movie_age;
	}
	public void setMovie_age(int[] movie_age) {
		this.movie_age = movie_age;
	}
	public String[] getMovie_country() {
		return movie_country;
	}
	public void setMovie_country(String[] movie_country) {
		this.movie_country = movie_country;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "MovieFinderVO [sel=" + sel + ", keyword=" + keyword + ", movie_janre=" + Arrays.toString(movie_janre)
				+ ", movie_age=" + Arrays.toString(movie_age) + ", movie_country=" + Arrays.toString(movie_country)
				+ "]";
	}
	
	
	
}
