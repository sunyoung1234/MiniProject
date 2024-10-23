package com.team.proj.board.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.board.vo.SearchVO;
import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.reply.dto.ReplyDTO;
import com.team.proj.reply.service.ReplyService;
import com.team.proj.savecal.dto.SavecalDTO;
import com.team.proj.savecal.dto.SavecalMatDTO;
import com.team.proj.savecal.dto.SavecalVolDTO;
import com.team.proj.savecal.service.SavecalService;

@Controller
public class BoardController {

	@Autowired
	MaterialsService matService;

	@Autowired
	BoardService boardService;

	@Autowired
	SavecalService scService;
	
	@Autowired
	ReplyService replyService;

	@RequestMapping("/boardView")
	public String boardView(Model model, SearchVO search, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String memId = login.getMemId();

		List<BoardDTO> boardListById = boardService.getBoardListById(memId);

		if (boardListById.size() > 0) {
			model.addAttribute("boardListById", boardListById);
		} else {
			model.addAttribute("noList", "�ۼ��� ���� �����ϴ�.");
		}

		System.out.println(boardListById);

		return "board/boardView";
	}

	@RequestMapping("/boardWriteView")
	public String boardWriteView(Model model, HttpSession session) {
		List<MaterialsDTO> matList = matService.getMatList();
		MemberDTO mem = (MemberDTO) session.getAttribute("login");

		model.addAttribute("keyMatList", matList);
		return "board/boardWriteView";
	}

	// �Խñ� �󼼺��� �޼ҵ�
	@RequestMapping("/boardDetailView")
	public String boardDetailView(int orderNo, Model model, HttpSession session) {

		MemberDTO mem = (MemberDTO) session.getAttribute("login");

		// �Խñ� ������ ������
		System.out.println(orderNo);
		BoardDTO boardDetail = boardService.getBoard(orderNo);
		model.addAttribute("board", boardDetail);

		String calcId = boardDetail.getCalcId();
		double calcResult = boardDetail.getCalcResult();
		
		// ȸ���� �ø� ����
		List<SavecalMatDTO> scmList = scService.getScmList(calcId);
		
		model.addAttribute("scmList", scmList);
		
		

		List<SavecalVolDTO> scVolList = scService.getScVol(calcId);

		model.addAttribute("scVolList", scVolList);
		model.addAttribute("calcResult", calcResult);

		System.out.println(scVolList);
		
		
		
		
		return "board/boardDetailView"; // JSP ���� ���
	}

	@RequestMapping("/boardWriteDo")
	public String practice(@RequestBody Map<String, String> data, HttpSession session) {

		String calc_id = data.get("id");
		String boardTitle = data.get("title");
		String boardContent = data.get("content");
		List<SavecalDTO> scList = scService.findById(calc_id);

		double total = 0;

		for (SavecalDTO sc : scList) {
			int matNo = sc.getMaterialNo();
			int matVol = sc.getMaterialVolume();
			MaterialsDTO mat = matService.getByMatNo(matNo);
			double co2kg = mat.getGasKg();

			total += co2kg * matVol;
		}

		total = Math.floor(total * 100) / 100;

		MemberDTO mem = (MemberDTO) session.getAttribute("login");
		String mem_id = mem.getMemId();
		String entpName = mem.getEntpName();

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		String unique = sdf.format(date);
		unique += mem_id;

		BoardDTO board = new BoardDTO();
		board.setEntpName(entpName);
		board.setBoardId(unique);
		board.setCalcId(calc_id);
		board.setOrderTitle(boardTitle);
		board.setOrderContent(boardContent);
		board.setCalcResult(total);
		board.setMemId(mem_id);

		boardService.boardWriteDo(board);

		// CONFIRM YN Y�� ����
		scService.updateConfirm(calc_id);
		// CONFIRM YN N�� �͵� ����
		scService.deleteConfirmN();

		return "board/boardView";
	}

	
	
	@RequestMapping("/boardViewAdmin")
	public String boardViewAdmin(HttpSession session, Model model, BoardDTO check, SearchVO pageSearch) {
	    // �α��� ���� ��������
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
	    String memId = login.getMemId();

	    // �α��� ������ ���ų�, �����ڰ� �ƴ� ��� �α��� �������� �ǵ��ư���
	    if (login == null || !"admin".equals(login.getMemId())) {
	        return "redirect:/loginView";
	    }
	    
	    System.out.println("������ ��ġ: " + pageSearch);
	    
	    // �Խñ� Ȯ���� ���� ���� ����
	    check.setMemId(memId);
	    System.out.println(check);
	    System.out.println(memId);

	    // �Խñ� ��� Ȯ��
	    List<BoardDTO> getBoardListByIdConfirm = boardService.getBoardListByIdConfirm(check);

	    // �Խñ� ����� �ִ��� Ȯ��
	    if (getBoardListByIdConfirm.size() > 0) {
	        model.addAttribute("getBoardListByIdConfirm", getBoardListByIdConfirm);
	        System.out.println(getBoardListByIdConfirm);
	    } else {
	        model.addAttribute("noList", "�ۼ��� ���� �����ϴ�.");
	    }

	    // ����¡ ó��
	    int totalRowCount = boardService.getBoardCount(pageSearch);
	    System.out.println(pageSearch);
	    pageSearch.setBoardCount(totalRowCount);
	    pageSearch.pageSetting();

	    // �Խñ� ��� ��������
	    List<BoardDTO> boardList = boardService.getBoardList(pageSearch);
	    model.addAttribute("boardList", boardList);
	    model.addAttribute("pageSearch", pageSearch);
	    model.addAttribute("member", login);
	    System.out.println(boardList);

	    // adminpage ��� �̵�
	    return "board/boardViewAdmin";
	}


	 @ResponseBody
	 @RequestMapping("/replyWriteDo") 
	 public ReplyDTO replyWriteDo(@RequestBody Map<String,String> data, HttpSession session) {
		 int b_no = Integer.parseInt(data.get("no"));
		 String b_content = data.get("content");
		 String calc_id = data.get("id");
		 MemberDTO mem = (MemberDTO) session.getAttribute("login");
		 String mem_id = mem.getMemId();
		 
		 BoardDTO board = boardService.getBoardByNo(b_no);
		 String board_id = board.getBoardId();
		 
		 List<SavecalDTO> scList = scService.findById(calc_id);
		 
		 double result = 0;
		 
		 for(SavecalDTO sc : scList) {
			 int no = sc.getMaterialNo();
			 int vol = sc.getMaterialVolume();
			 MaterialsDTO mat = matService.getByMatNo(no);
			 double gasKg = mat.getGasKg();
			 double res = gasKg * vol;
			 
			 result += res;
		 }
		 
		 Date date = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS");
		 String unique = sdf.format(date);
		 unique += "reply" + data.get("no");
		 
		 ReplyDTO rep = new ReplyDTO(unique, board_id, b_content, calc_id, result);
		
		 // Board �ǵ�� ���� ���� 
		 boardService.updateFeedbackYN(b_no);
		 // CONFIRM YN Y�� ����
		 scService.updateConfirm(calc_id);
		 // CONFIRM YN N�� �͵� ����
		 scService.deleteConfirmN();
		 
		 return rep;
	 }
	 

}
