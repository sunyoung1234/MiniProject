package com.team.proj.member.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.proj.FileUpload;
import com.team.proj.attach.service.AttachService;
import com.team.proj.member.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AttachService attachService;
	
	@Autowired
	FileUpload fileUpload;
	
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
