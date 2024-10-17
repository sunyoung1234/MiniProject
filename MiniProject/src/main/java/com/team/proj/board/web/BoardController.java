package com.team.proj.board.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.board.vo.SearchVO;
import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.savecal.dto.SavecalDTO;
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
        List<BoardDTO> boardList = boardService.getBoardList(search);
        model.addAttribute("boardList", boardList);
        MemberDTO login = (MemberDTO) session.getAttribute("login");
        String memId = login.getMemId();
        String entp = login.getEntpName();
        
        List<BoardDTO> boardListById = boardService.getBoardListById(memId);
        
        if(boardListById.size()>0) {
        	model.addAttribute("boardListById", boardListById);
        	model.addAttribute("keyEntp", entp);
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
    @RequestMapping("/boardDetailView/{boardNo}")
    public String boardDetailView(@PathVariable int boardNo, Model model) {
        // 게시글 정보를 가져옴
        BoardDTO boardDetail = boardService.getBoard(boardNo);
        model.addAttribute("board", boardDetail);
        return "board/boardDetailView"; // JSP 파일 경로
    }
    
    @ResponseBody
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
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS"); 
		String unique = sdf.format(date);
		unique += mem_id;
		
		BoardDTO board = new BoardDTO();
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
}
