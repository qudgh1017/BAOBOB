package spring.mvc.baobob.host_total.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Host_totalController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping("adminDefault")
	public String adminDefault(Model model) {
		
		log.debug("====== host_total.controller/adminDefault ======");
		
		return "adminDefault";
	}
	
	
	
	
	
	
	
	
	
}
