package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MovieVO;

public  interface Guest_movieDAO {

	//영화갯수
	public int getMovieCnt();
	
	//기본영화정보
	public ArrayList<MovieVO> getAllMovies(Map<String,Object> map);
	
	//영화상세정보
	public MovieVO getMovie(int movie_index);
}
