package com.team.proj.board.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	
	@RequestMapping("/boardView")
	public String boardView() {
		
		return "board/boardView";
	}
	

}
