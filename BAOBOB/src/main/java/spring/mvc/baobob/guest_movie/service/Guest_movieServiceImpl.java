package spring.mvc.baobob.guest_movie.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAO;
import spring.mvc.baobob.guest_movie.persistence.Guest_movieDAOImpl;

@Service
public class Guest_movieServiceImpl implements Guest_movieService{

	@Autowired
	Guest_movieDAO gmdao = new Guest_movieDAOImpl();
	
}
