package spring.mvc.baobob.vo;

import java.util.List;

public class MovieReviewVO {

	private List<MovieVO> movies;
	private List<ReviewVO> reviews;
	
	public List<MovieVO> getMovies() {
		return movies;
	}
	public void setMovies(List<MovieVO> movies) {
		this.movies = movies;
	}
	public List<ReviewVO> getReviews() {
		return reviews;
	}
	public void setReviews(List<ReviewVO> reviews) {
		this.reviews = reviews;
	}
	
	
}
