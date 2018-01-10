package spring.mvc.baobob.host_movie.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import spring.mvc.baobob.host_movie.persistence.Host_movieDAO;
import spring.mvc.baobob.host_movie.persistence.Host_movieDAOImpl;
import spring.mvc.baobob.vo.MovieVO;

@Service
public class Host_movieServiceImpl implements Host_movieService{
	
	@Autowired
	Host_movieDAO dao = new Host_movieDAOImpl();

	@Override
	public void hostMovieAddPro(MultipartHttpServletRequest req, Model model) {
		MultipartFile file = req.getFile("movie_poster");
		
		String saveDir = req.getSession().getServletContext().getRealPath("/resources/images/phc/");
		
		String realDir = "C:\\Dev\\workspace_baobob\\BAOBOB\\BAOBOB\\src\\main\\webapp\\resources\\images\\phc\\";
		
		try {
			file.transferTo(new File(saveDir+file.getOriginalFilename()));
			
			FileInputStream fis = new FileInputStream(saveDir + file.getOriginalFilename());
			FileOutputStream fos = new FileOutputStream(realDir + file.getOriginalFilename());
			
			int data = 0;
			
			while((data = fis.read()) != -1) {
				fos.write(data);
			}
			fis.close();
			fos.close();
			
			String movie_title = req.getParameter("movie_title");
			String movie_content = req.getParameter("movie_content");
			String movie_janre = "drama";
			int movie_age = Integer.parseInt(req.getParameter("movie_age"));
			String movie_rel_date = req.getParameter("movie_rel_date");
			String movie_director = req.getParameter("movie_director");
			String movie_star = req.getParameter("movie_star");
			String movie_country = req.getParameter("movie_country");
			int movie_runTime = Integer.parseInt(req.getParameter("movie_runTime"));
			String movie_poster = file.getOriginalFilename();
			String movie_trailer = req.getParameter("movie_trailer");
			int movie_state = Integer.parseInt(req.getParameter("movie_state"));
			
			MovieVO vo = new MovieVO();
			
			vo.setMovie_title(movie_title);
			vo.setMovie_content(movie_content);
			//vo.setMovie_janre(movie_janre);
			vo.setMovie_age(movie_age);
			// rel_date
			vo.setMovie_age(movie_age);
			vo.setMovie_director(movie_director);
			vo.setMovie_star(movie_star);
			vo.setMovie_country(movie_country);
			vo.setMovie_runTime(movie_runTime);
			vo.setMovie_poster(movie_poster);
			vo.setMovie_trailer(movie_trailer);
			vo.setMovie_state(movie_state);
			
			int cnt = dao.hostMovieAddPro(vo);
			
			model.addAttribute("cnt", cnt);
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
}

