package member.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/loginView")
	public String loginView() {
		
		return "member/loginView";
	}
	
}
