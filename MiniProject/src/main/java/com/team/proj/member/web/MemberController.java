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
            model.addAttribute("member", member); // ���ǿ��� ȸ�� ������ �𵨿� �߰�
            return "member/memEditView"; // JSP �������� �̵�
        } else {
            return "redirect:/loginView"; // �α������� ���� ��� �α��� �������� �����̷�Ʈ
        }
    }

    @RequestMapping("/loginDo")
    public String loginDo(MemberDTO member, HttpSession session, Model model) {
        MemberDTO login = memberService.loginMember(member);
        if (login != null) {
            session.setAttribute("login", login); // ���ǿ� �α��� ���� ����
            return "redirect:/"; // Ȩ���� �����̷�Ʈ
        } else {
            model.addAttribute("msg", "���̵� Ȥ�� ��й�ȣ�� �ùٸ��� �ʽ��ϴ�.");
            return "member/loginView"; // �α��� ���� �� �α��� ��������
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

        return "redirect:/loginView"; // ȸ������ �� �α��� �������� �����̷�Ʈ
    }
    
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ���� ��ȿȭ
        return "redirect:/"; // Ȩ���� �����̷�Ʈ
    }
}
