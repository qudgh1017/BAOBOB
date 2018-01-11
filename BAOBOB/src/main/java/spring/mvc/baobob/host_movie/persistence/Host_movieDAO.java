package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import spring.mvc.baobob.vo.MovieVO;

public interface Host_movieDAO {
	
	// 영화 갯수 구하기
	public int getMovieCnt();
	
	// 영화 전체 목록 조회(개봉일 순)
	public ArrayList<MovieVO> getMovieList(Map<String, Integer> map);
	
	// 영화 추가 처리
	public int hostMovieAddPro(MovieVO vo);
	
	// 영화 삭제 처리
	public int hostMovieDel(int movie_index);
	
	// 영화 상세
	public MovieVO hostMovieDetail(int movie_index);
	
	// 영화 수정 처리
	public int hostMovieModPro(MovieVO vo);
	
}
