package sprint.mvc.baobob.android.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.baobob.persistence.MainDAO;
import spring.mvc.baobob.vo.Member;
import sprint.mvc.baobob.android.service.AndroidService;

@Controller
public class AndroidController {

	@Autowired
	AndroidService service;

	@Autowired
	MainDAO mainDao;
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value="androidSignIn", produces="application/json; charset=UTF-8")
	public JSONObject androidSignIn(String member_id, String member_pwd){
		
		JSONObject json = new JSONObject();
		
		Member m = new Member();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id",  member_id);
		map.put("member_pwd",  member_pwd);
		
		if(mainDao.confirmIdPwd(map) != null) {
			json.put("msg", "정보 있음");
			json.put("member_id", m.getMember_id());
			json.put("member_name", m.getMember_name());
			json.put("member_step", m.getMember_step());
		} else {
			json.put("msg", "정보 없음");
		}
		
		return json;
	}
}
