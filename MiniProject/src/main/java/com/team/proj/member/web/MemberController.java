package com.team.proj.member.web;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MemberController {
	
	
	@RequestMapping("/loginView")
	public String loginView() {
		
		return "member/loginView";
	}

	@RequestMapping("/registView")
	public String registView() {
		
		return "member/registView";
	}
	
	@RequestMapping("/registDo")
	public String registDo() {
		
		
		return "redirect:/loginView";
	}
	
	

}
