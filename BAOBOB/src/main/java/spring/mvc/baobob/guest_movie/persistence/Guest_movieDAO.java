package spring.mvc.baobob.guest_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MovieVO;

public  interface Guest_movieDAO {

	//전체 영화갯수
	public int getMovieCnt();
	
	//movie_state에 따른 영화갯수
	public int getMovieStateCnt(Map<String,Object> map);
	
	//기본영화정보
	public ArrayList<MovieVO> getAllMovies(Map<String,Object> map);
	
	//movie_state에 따른 영화리스트
	public ArrayList<MovieVO> getMovieStateMovies(Map<String,Object> map);
	
	//영화상세정보
	public MovieVO getMovie(int movie_index);
}
