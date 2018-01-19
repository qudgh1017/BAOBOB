package sprint.mvc.baobob.android.service;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;


public interface AndroidService {
	
	public JSONObject androidSignIn(String member_id, String member_pwd);

}
