package com.team.proj.member.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.team.proj.FileUpload;
import com.team.proj.attach.dto.AttachDTO;
import com.team.proj.attach.service.AttachService;
import com.team.proj.board.service.BoardService;
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

	@Autowired
	BoardService boardService;

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

	// �α��� ó��
	@RequestMapping("/loginDo")
	public String loginDo(MemberDTO member, HttpSession session, boolean rememberId, Model model,
			HttpServletResponse response) {

		MemberDTO login = memberService.loginMember(member);

		if (login != null) {
			session.setAttribute("login", login); // ���ǿ� �α��� ���� ����

			// ��Ű ó��
			if (rememberId) {
				// ��Ű ����
				Cookie cookie = new Cookie("rememberId", member.getMemId());
				cookie.setMaxAge(7 * 24 * 60 * 60); // 7�� ��ȿ
				response.addCookie(cookie);
			} else {
				// ��Ű ����
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

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

		String imgPath = null; // �̹��� ��� �ʱ�ȭ
		try {
			// �̹����� ���ε��ϰ� ��θ� ����ϴ�.
			if (img != null && !img.isEmpty()) {
				AttachDTO attach = fileUpload.getAttachByMultipart(img);
				imgPath = attach.getAtchPath().substring(11); // ���ε�� �̹��� ���
				attachService.insertAttach(attach); // �̹��� ���� DB�� ����
			} else {
				// �⺻ �̹��� ��� ���� (�⺻ ������ �̹���)
				imgPath = "assets/default-prof.jpg";
			}

			MemberDTO member = new MemberDTO(id, pw, email, phone, entp, imgPath);
			memberService.registMember(member);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/registView"; // ���� �߻� �� ȸ������ �������� ���ư���
		}

		return "redirect:/loginView"; // ȸ������ �� �α��� �������� �����̷�Ʈ
	}

	// �α׾ƿ� ó��
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // ���� ��ȿȭ
		return "home"; // Ȩ���� �����̷�Ʈ
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

		String imgPath = ""; // ���� �̹��� ��� �ʱ�ȭ

		try {
			// �̹����� ���ε��ϰ� ��θ� ����ϴ�.
			if (img != null && !img.isEmpty()) {
				AttachDTO attach = fileUpload.getAttachByMultipart(img);
				imgPath = attach.getAtchPath().substring(11); // ���ε�� �̹��� ���
				attachService.insertAttach(attach); // �̹��� ���� DB�� ����
			} else {
				// �⺻ �̹��� ��� ���� (�⺻ ������ �̹���)
				imgPath = member.getMemProfile();
			}

			MemberDTO updatedMem = new MemberDTO(id, pw, email, phone, entp, imgPath);
			memberService.updateMember(updatedMem);
			session.setAttribute("login", updatedMem);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/registView"; // ���� �߻� �� ȸ������ �������� ���ư���
		}

		return "redirect:/memEditView"; // ���� �Ϸ� �� ȸ������ ���� �������� �����̷�Ʈ
	}

	@RequestMapping("/deleteMember")
	public String deleteMember(HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String id = login.getMemId();

		return "home";
	}

}
