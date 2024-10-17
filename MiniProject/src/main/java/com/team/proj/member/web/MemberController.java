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

    // 로그인 페이지로 이동
    @RequestMapping("/loginView")
    public String loginView() {
        return "member/loginView";
    }

    // 회원가입 페이지로 이동
    @RequestMapping("/registView")
    public String registView() {
        return "member/registView";
    }

    // 회원 정보 수정 페이지로 이동
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

    // 로그인 처리
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

    // 회원가입 처리
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
    
    // 로그아웃 처리
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 무효화
        return "redirect:/"; // 홈으로 리다이렉트
    }
    
    // 회원 정보 수정 처리
    @RequestMapping("/memberUpdate")
    public String memberUpdate(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // 세션에서 회원 정보를 가져옵니다.
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        
        // 수정된 정보 가져오기
        String id = member.getMemId(); // ID는 변경할 수 없음
        String pw = req.getParameter("memPw"); // 새로운 비밀번호
        String email = req.getParameter("memEmail"); // 수정된 이메일
        String phone = req.getParameter("memPhone"); // 수정된 전화번호
        String entp = member.getEntpName(); // 회사명은 변경할 수 없음

        String imgPath = member.getMemProfile(); // 기존 이미지 경로
        if (img != null && !img.isEmpty()) { // 새로운 이미지가 업로드된 경우
            try {
                AttachDTO attach = fileUpload.getAttachByMultipart(img);
                imgPath = (String) attach.getAtchPath(); // 새 이미지 경로로 변경
                attachService.insertAttach(attach); // 이미지 정보 DB에 저장
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // 수정된 회원 정보를 DTO에 담습니다.
        MemberDTO updatedMember = new MemberDTO(id, pw, email, phone, entp, imgPath);
        memberService.updateMember(updatedMember); // DB 업데이트

        // 세션 정보도 업데이트합니다.
        session.setAttribute("login", updatedMember);

        return "redirect:/memEditView"; // 수정 완료 후 회원정보 수정 페이지로 리다이렉트
    }
}
