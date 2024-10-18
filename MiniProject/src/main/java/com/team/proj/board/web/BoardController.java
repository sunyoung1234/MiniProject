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

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.board.vo.SearchVO;
import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.savecal.dto.SavecalDTO;
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

    @RequestMapping("/boardView")
    public String boardView(Model model, SearchVO search, HttpSession session) {
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String memId = login.getMemId();
        
        List<BoardDTO> boardListById = boardService.getBoardListById(memId);
        
        if(boardListById.size()>0) {
        	model.addAttribute("boardListById", boardListById);
        }else {
        	model.addAttribute("noList","작성한 글이 없습니다.");
        }
        
        System.out.println(boardListById);
        
        return "board/boardView"	;
    }

    @RequestMapping("/boardWriteView")
    public String boardWriteView(Model model, HttpSession session) {
        List<MaterialsDTO> matList = matService.getMatList();
        MemberDTO mem = (MemberDTO) session.getAttribute("login");
       
        
        model.addAttribute("keyMatList", matList);
        return "board/boardWriteView";
    }
    
    // 게시글 상세보기 메소드
    @RequestMapping("/boardDetailView")
    public String boardDetailView(int orderNo, Model model, HttpSession session) {
    	
    	 List<MaterialsDTO> matList = matService.getMatList();
         MemberDTO mem = (MemberDTO) session.getAttribute("login");
        
         
         model.addAttribute("keyMatList", matList);
    	
        // 게시글 정보를 가져옴
    	System.out.println(orderNo);
        BoardDTO boardDetail = boardService.getBoard(orderNo);
        model.addAttribute("board", boardDetail);
        
        String calcId = boardDetail.getCalcId();
        double calcResult = boardDetail.getCalcResult();
        
        List<SavecalVolDTO> scVolList = scService.getScVol(calcId);
        
        model.addAttribute("scVolList", scVolList);
        model.addAttribute("calcResult", calcResult);

        System.out.println(scVolList);
        return "board/boardDetailView"; // JSP 파일 경로
    }
    
    
	@RequestMapping("/boardWriteDo")
	public String practice(@RequestBody Map<String,String> data,HttpSession session) {
		
		String calc_id = data.get("id");
		String boardTitle = data.get("title");
		String boardContent = data.get("content");
		List<SavecalDTO> scList = scService.findById(calc_id);
		
		double total = 0;
		
		for(SavecalDTO sc : scList) {
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
		
		// CONFIRM YN Y로 변경
		scService.updateConfirm(calc_id);
		// CONFIRM YN N인 것들 삭제
		scService.deleteConfirmN();
		
		return "board/boardView";
	}
	
	@RequestMapping("/boardViewAdmin")
	public String boardViewAdmin(HttpSession session, Model model, BoardDTO check, String feedbackYn) {
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
        String memId = login.getMemId();
        
        check.setMemId(memId);
        check.setFeedbackYn(feedbackYn);
        System.out.println(check);
        
        System.out.println(memId);
        System.out.println(feedbackYn);
        
        List<BoardDTO> getBoardListByIdConfirm = boardService.getBoardListByIdConfirm(check);
        
        if(getBoardListByIdConfirm.size()>0) {
        	model.addAttribute("BoardListByIdConfirm", getBoardListByIdConfirm);
        	System.out.println(getBoardListByIdConfirm);
        }else {
        	model.addAttribute("noList","작성한 글이 없습니다.");
        }
        
		
		return "board/boardViewAdmin";
	}
	
	/*
	 * @RequestMapping("/replyWriteDo") public String replyWriteDo(@RequestBody
	 * Map<String>)
	 */
	
	
}
