package com.team.proj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.board.vo.SearchVO;

@Controller
public class BoardController {
   
    @Autowired
    MaterialsService matService;

    @Autowired
    BoardService boardService;

    @RequestMapping("/boardView")
    public String boardView(Model model, SearchVO search) {
        List<BoardDTO> boardList = boardService.getBoardList(search);
        model.addAttribute("boardList", boardList);
        return "board/boardView"	;
    }

    @RequestMapping("/boardWriteView")
    public String boardWriteView(Model model) {
        List<MaterialsDTO> matList = matService.getMatList();
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
}
