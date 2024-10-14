package com.team.proj.member.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.team.proj.FileUpload;
import com.team.proj.attach.dto.AttachDTO;
import com.team.proj.attach.service.AttachService;
import com.team.proj.member.dto.MemberDTO;
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
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberDTO member, HttpSession session) {
		
		MemberDTO mem = memberService.loginMember(member);
		session.setAttribute("login", mem);

		
		
		
		return "redirect:/";
	}
	
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) {
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String entp = req.getParameter("entp");
//		
		String imgPath;
		try {
			AttachDTO attach = fileUpload.getAttachByMultipart(img);
			System.out.println(attach);
			imgPath = (String)attach.getAtchPath();
			MemberDTO member = new MemberDTO(id,pw,email,phone,entp,imgPath);
			memberService.registMember(member);
			attachService.insertAttach(attach);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/loginView";
	}
	
	

}
