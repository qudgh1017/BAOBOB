package sprint.mvc.baobob.android.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import sprint.mvc.baobob.android.service.AndroidService;

@Controller
public class AndroidController {

	@Autowired
	AndroidService service;
	
	@ResponseBody
	@RequestMapping(value="androidSignIn", produces="application/json; charset=UTF-8")
	public JSONObject androidSignIn(String member_id, String member_pwd){
		System.out.println("androidSignIn()");
		return service.androidSignIn(member_id, member_pwd);
	}
}
