package spring.mvc.baobob.host_movie.persistence;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.mvc.baobob.vo.MovieVO;

@Repository
public class Host_movieDAOImpl implements Host_movieDAO {
	
	@Autowired
	public SqlSession sqlSession;
	
	// 영화 갯수 구하기
	@Override
	public int getMovieCnt() {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.getMovieCnt();
		
		return cnt;
	}
	
	// 영화 전체 목록 조회(개봉일 순)
	@Override
	public ArrayList<MovieVO> getMovieList(Map<String, Integer> map) {
		ArrayList<MovieVO> vos = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vos = dao.getMovieList(map);
		
		System.out.println("vos : " + vos);
		
		return vos;
	}
	
	// 영화 추가 처리
	@Override
	public int hostMovieAddPro(MovieVO vo) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieAddPro(vo);
		
		return cnt;
	}

	// 영화 삭제 처리
	@Override
	public int hostMovieDel(int movie_index) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieDel(movie_index);
		
		return cnt;
	}

	@Override
	public MovieVO hostMovieDetail(int movie_index) {
		MovieVO vo = null;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		vo = dao.hostMovieDetail(movie_index);
		
		return vo;
	}

	@Override
	public int hostMovieModPro(MovieVO vo) {
		int cnt = 0;
		
		Host_movieDAO dao = sqlSession.getMapper(Host_movieDAO.class);
		cnt = dao.hostMovieModPro(vo);
		
		return cnt;
	}

	

	
}
