package com.team.proj.board.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;

@Controller
public class BoardController {
	
	@Autowired
	MaterialsService matService;
	
	@RequestMapping("/boardView")
	public String boardView() {
		
		return "board/boardView";
	}
	
	@RequestMapping("/boardWriteView")
	public String boardWriteView(Model model) {
		
		List<MaterialsDTO> matList = matService.getMatList();
		model.addAttribute("keyMatList", matList);
		
		
		return "board/boardWriteView";
		
	}
	
	
}
