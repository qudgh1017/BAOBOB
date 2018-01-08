package spring.mvc.baobob;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

	@RequestMapping("mainDefault")
	public String mainDefault(Model model) {
		return "mainDefault";
	}

	@RequestMapping("mainEx")
	public String mainEx(Model model) {
		return "guest/example";
	}
	
	@RequestMapping("adminDefault")
	public String adminDefault(Model model) {
		return "adminDefault";
	}

	@RequestMapping("adminEx")
	public String adminEx(Model model) {
		return "host/example";
	}
	
	@RequestMapping("index")
	public String index(HttpServletRequest req, Model model) {
		return "index";
	}
}
