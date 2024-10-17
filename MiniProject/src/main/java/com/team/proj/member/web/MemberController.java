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

    // �α��� �������� �̵�
    @RequestMapping("/loginView")
    public String loginView() {
        return "member/loginView";
    }

    // ȸ������ �������� �̵�
    @RequestMapping("/registView")
    public String registView() {
        return "member/registView";
    }

    // ȸ�� ���� ���� �������� �̵�
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

    // �α��� ó��
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

    // ȸ������ ó��
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
    
    // �α׾ƿ� ó��
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // ���� ��ȿȭ
        return "redirect:/"; // Ȩ���� �����̷�Ʈ
    }
    
    // ȸ�� ���� ���� ó��
    @RequestMapping("/memberUpdate")
    public String memberUpdate(HttpServletRequest req, MultipartFile img, HttpSession session) {
        // ���ǿ��� ȸ�� ������ �����ɴϴ�.
        MemberDTO member = (MemberDTO) session.getAttribute("login");
        
        // ������ ���� ��������
        String id = member.getMemId(); // ID�� ������ �� ����
        String pw = req.getParameter("memPw"); // ���ο� ��й�ȣ
        String email = req.getParameter("memEmail"); // ������ �̸���
        String phone = req.getParameter("memPhone"); // ������ ��ȭ��ȣ
        String entp = member.getEntpName(); // ȸ����� ������ �� ����

        String imgPath = member.getMemProfile(); // ���� �̹��� ���
        if (img != null && !img.isEmpty()) { // ���ο� �̹����� ���ε�� ���
            try {
                AttachDTO attach = fileUpload.getAttachByMultipart(img);
                imgPath = (String) attach.getAtchPath(); // �� �̹��� ��η� ����
                attachService.insertAttach(attach); // �̹��� ���� DB�� ����
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        // ������ ȸ�� ������ DTO�� ����ϴ�.
        MemberDTO updatedMember = new MemberDTO(id, pw, email, phone, entp, imgPath);
        memberService.updateMember(updatedMember); // DB ������Ʈ

        // ���� ������ ������Ʈ�մϴ�.
        session.setAttribute("login", updatedMember);

        return "redirect:/memEditView"; // ���� �Ϸ� �� ȸ������ ���� �������� �����̷�Ʈ
    }
}
