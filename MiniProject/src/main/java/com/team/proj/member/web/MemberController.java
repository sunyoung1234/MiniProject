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

	// 로그인 처리
	@RequestMapping("/loginDo")
	public String loginDo(MemberDTO member, HttpSession session, boolean rememberId, Model model,
			HttpServletResponse response) {

		MemberDTO login = memberService.loginMember(member);

		if (login != null) {
			session.setAttribute("login", login); // 세션에 로그인 정보 저장

			// 쿠키 처리
			if (rememberId) {
				// 쿠키 생성
				Cookie cookie = new Cookie("rememberId", member.getMemId());
				cookie.setMaxAge(7 * 24 * 60 * 60); // 7일 유효
				response.addCookie(cookie);
			} else {
				// 쿠키 삭제
				Cookie cookie = new Cookie("rememberId", "");
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}

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

		String imgPath = null; // 이미지 경로 초기화
		try {
			// 이미지를 업로드하고 경로를 얻습니다.
			if (img != null && !img.isEmpty()) {
				AttachDTO attach = fileUpload.getAttachByMultipart(img);
				imgPath = attach.getAtchPath().substring(11); // 업로드된 이미지 경로
				attachService.insertAttach(attach); // 이미지 정보 DB에 저장
			} else {
				// 기본 이미지 경로 지정 (기본 프로필 이미지)
				imgPath = "assets/default-prof.jpg";
			}

			MemberDTO member = new MemberDTO(id, pw, email, phone, entp, imgPath);
			memberService.registMember(member);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/registView"; // 에러 발생 시 회원가입 페이지로 돌아가기
		}

		return "redirect:/loginView"; // 회원가입 후 로그인 페이지로 리다이렉트
	}

	// 로그아웃 처리
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션 무효화
		return "home"; // 홈으로 리다이렉트
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

		String imgPath = ""; // 기존 이미지 경로 초기화

		try {
			// 이미지를 업로드하고 경로를 얻습니다.
			if (img != null && !img.isEmpty()) {
				AttachDTO attach = fileUpload.getAttachByMultipart(img);
				imgPath = attach.getAtchPath().substring(11); // 업로드된 이미지 경로
				attachService.insertAttach(attach); // 이미지 정보 DB에 저장
			} else {
				// 기본 이미지 경로 지정 (기본 프로필 이미지)
				imgPath = member.getMemProfile();
			}

			MemberDTO updatedMem = new MemberDTO(id, pw, email, phone, entp, imgPath);
			memberService.updateMember(updatedMem);
			session.setAttribute("login", updatedMem);
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/registView"; // 에러 발생 시 회원가입 페이지로 돌아가기
		}

		return "redirect:/memEditView"; // 수정 완료 후 회원정보 수정 페이지로 리다이렉트
	}

	@RequestMapping("/deleteMember")
	public String deleteMember(HttpSession session) {

		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String id = login.getMemId();

		return "home";
	}

}
