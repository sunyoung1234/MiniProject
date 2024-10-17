package com.team.proj.member.web;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping("/memEditView")
    public String memEditView(HttpSession session, Model model) {
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        if (member != null) {
            model.addAttribute("member", member); // 세션에서 회원 정보를 모델에 추가
            return "member/memEditView"; // JSP 페이지로 이동
        } else {
            return "redirect:/loginView"; // 로그인하지 않은 경우 로그인 페이지로 리다이렉트
        }
    }

    @RequestMapping("/loginDo")
    public String loginDo(MemberDTO member, HttpSession session, Model model) {
        MemberDTO login = memberService.loginMember(member);
        if (login != null) {
            session.setAttribute("login", login); // 세션에 로그인 정보 저장
            return "redirect:/"; // 홈으로 리다이렉트
        } else {
            model.addAttribute("msg", "아이디 혹은 비밀번호가 올바르지 않습니다.");
            return "member/loginView"; // 로그인 실패 시 로그인 페이지로
        }
    }

    @RequestMapping("/registDo")
    public String registDo(HttpServletRequest req, MultipartFile img, HttpSession session) {
        String id = req.getParameter("id");
        String pw = req.getParameter("pw");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String entp = req.getParameter("entp");

        String imgPath;
        try {
            AttachDTO attach = fileUpload.getAttachByMultipart(img);
            imgPath = (String) attach.getAtchPath();
            MemberDTO member = new MemberDTO(id, pw, email, phone, entp, imgPath);
            memberService.registMember(member);
            attachService.insertAttach(attach);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "redirect:/loginView"; // 회원가입 후 로그인 페이지로 리다이렉트
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 홈으로 리다이렉트
    }
}
