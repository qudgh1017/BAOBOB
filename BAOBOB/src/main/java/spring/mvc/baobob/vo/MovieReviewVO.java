package spring.mvc.baobob.vo;

import java.util.List;

public class MovieReviewVO {

	private MovieVO movie;
	private ReviewVO review;
	
	public MovieVO getMovie() {
		return movie;
	}
	public void setMovie(MovieVO movie) {
		this.movie = movie;
	}
	public ReviewVO getReview() {
		return review;
	}
	public void setReview(ReviewVO review) {
		this.review = review;
	}

	
}
