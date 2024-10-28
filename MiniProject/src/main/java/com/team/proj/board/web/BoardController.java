package com.team.proj.board.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

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
import com.team.proj.savesubcal.dto.SaveSubcalDTO;
import com.team.proj.savesubcal.service.SaveSubcalService;
import com.team.proj.substitute.dto.SubstituteDTO;
import com.team.proj.substitute.service.SubService;

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
	
	@Autowired
	SaveSubcalService saveSubService;
	
	@Autowired
	SubService subService;

	@RequestMapping("/boardView")
	public String boardView(Model model, SearchVO pageSearch, HttpSession session) {
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		String memId = login.getMemId();
		
		pageSearch.setMemId(memId);
		// ����¡ ó��
	    int totalRowCount = boardService.getBoardCountById(pageSearch);
	    System.out.println(pageSearch);
	    pageSearch.setBoardCount(totalRowCount);
	    
	    pageSearch.pageSetting();
	    
	    System.out.println(pageSearch.getBoardCount());

		List<BoardDTO> boardListById = boardService.getBoardListById(pageSearch);
		
		System.out.println(boardListById);

		if (boardListById.size() > 0) {
			model.addAttribute("boardListById", boardListById);
		} else {
			model.addAttribute("noList", "�ۼ��� ���� �����ϴ�.");
		}
		model.addAttribute("pageSearch", pageSearch);
		System.out.println(boardListById);

		return "board/boardView";
	}
	
	
	@RequestMapping("/boardViewAdmin")
	public String boardViewAdmin(HttpSession session, Model model, SearchVO pageSearch) {
	    // �α��� ���� ��������
	    MemberDTO login = (MemberDTO) session.getAttribute("login");
	    String memId = login.getMemId();
	    

	    // �α��� ������ ���ų�, �����ڰ� �ƴ� ��� �α��� �������� �ǵ��ư���
	    if (login == null || !"admin".equals(login.getMemId())) {
	        return "redirect:/loginView";
	    }
	    
	    System.out.println("������ ��ġ: " + pageSearch);
	    
	    // �Խñ� Ȯ���� ���� ���� ����
	    

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
	    System.out.println("���帮��Ʈ" + boardList);

	    // adminpage ��� �̵�
	    return "board/boardViewAdmin";
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
		BoardDTO boardDetail = boardService.getBoard(orderNo);
		model.addAttribute("board", boardDetail);

		String calcId = boardDetail.getCalcId();
		double calcResult = boardDetail.getCalcResult();
		
		
		
		// ȸ���� �ø� ����
		List<SavecalMatDTO> scmList = scService.getScmList(calcId);
		
		model.addAttribute("scmList", scmList);
		
		// �����ڰ� �ø� ��ü ����
		ReplyDTO reply = replyService.getReplyByBoardId(orderNo);
		System.out.println(reply);
		
		
		if(reply != null) {
			
			double current =  reply.getAfterCalcResult();
			double differ = reply.getReplyCalcResult(); // �Ƴ���
			
			model.addAttribute("current", current);
			model.addAttribute("differ", differ);
			
			List<Integer> noList = new ArrayList<>(); // 15 15 61 120
			List<Integer> eaList = new ArrayList<>();
			
			List<String> imgList = new ArrayList<>();
			List<String> nameList = new ArrayList<>();
			
			
			String replyCalcId = reply.getReplyCalcId();
			replyCalcId += "admin";
			List<SaveSubcalDTO> saveSubList = saveSubService.findBySscId(replyCalcId);
			model.addAttribute("saveSubList",saveSubList);
			
			System.out.println("���̺꼭�긮��Ʈ"  + saveSubList);
			
			for(SaveSubcalDTO ss : saveSubList) {
				int matNo = ss.getMatNo();
				noList.add(matNo); 
				int subNo = ss.getSubNo();
				SubstituteDTO sub = subService.getSubByNo(subNo);
				String subImg = sub.getSubImg();
				String subName = sub.getSubName();
				imgList.add(subImg);
				nameList.add(subName);
			}
			
			System.out.println("ss :"  + saveSubList);
			
			
			
			HashMap<Integer, Integer> countMap = new HashMap<>();

	        for (int no : noList) {
	            countMap.put(no, countMap.getOrDefault(no, 0) + 1);
	        }

	        for (int num : countMap.keySet()) {
	            eaList.add(countMap.get(num));
	        }
	        
	        model.addAttribute("eaList", eaList);
	        model.addAttribute("noList", noList);
	        model.addAttribute("imgList", imgList);
	        model.addAttribute("nameList", nameList);
	        
	        System.out.println(noList);
	        System.out.println(eaList);
	        System.out.println(imgList);
	        System.out.println(nameList);
		}
		

		List<SavecalVolDTO> scVolList = scService.getScVol(calcId);

		model.addAttribute("scVolList", scVolList);
		model.addAttribute("calcResult", calcResult);

		
		
		
		
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

	
	 

}
