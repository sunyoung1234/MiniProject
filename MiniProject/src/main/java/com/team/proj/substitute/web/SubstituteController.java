package com.team.proj.substitute.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.substitute.dto.SubJoinDTO;
import com.team.proj.substitute.service.SubService;

@Controller
public class SubstituteController {
	
	@Autowired
	SubService subService;
	
	@ResponseBody
	@RequestMapping("/findSub")
	public List<SubJoinDTO> findSub(@RequestBody Map<String,Integer> data, Model model){
		int matNo = data.get("no");
		List<SubJoinDTO> sjList = subService.getSubInfo(matNo);
		
		
		return sjList;
	}
}
