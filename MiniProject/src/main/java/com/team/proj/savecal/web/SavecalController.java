package com.team.proj.savecal.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.savecal.dto.SavecalDTO;
import com.team.proj.savecal.service.SavecalService;

@Controller
public class SavecalController {
	
	@Autowired 
	SavecalService saveService;
	
	@Autowired
	MaterialsService matService;
	
	@ResponseBody
	@PostMapping("/registCal")
	public Map<String, Object> registCal(@RequestBody Map<String,String> data, HttpSession session) {
		
		
		
		String strNoList = data.get("no");
		String strEaList = data.get("ea");
		
		String[] noArray = strNoList.split(",");
		String[] eaArray = strEaList.split(",");
		List<String> noList = new ArrayList<>(Arrays.asList(noArray));
		List<String> eaList = new ArrayList<>(Arrays.asList(eaArray));
		
		MemberDTO login = (MemberDTO) session.getAttribute("login");
		
		List<MaterialsDTO> registMatList = new ArrayList<MaterialsDTO>();
		Map<String, Object> response = new HashMap<>();
		
		for(String no : noList) {
			int number = Integer.parseInt(no);
			MaterialsDTO mat = matService.getByMatNo(number);
			registMatList.add(mat);
		}
		
		response.put("registList", registMatList);
		
		
		 Date date = new Date(); 
		 SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmssSSS"); 
		 String unique = sdf.format(date);
		 unique += login.getMemId();
		 response.put("scId", unique);
		 
		 String yn = "N";
		 
		 if(eaList.size() > 0){ 
			 for(int i=0; i<eaList.size(); i++){ 
				 SavecalDTO sc = new SavecalDTO(unique,Integer.parseInt(noList.get(i)),Integer.parseInt(eaList.get(i)),yn); 
				 saveService.addSavecal(sc); 
			 } 
		 }
		 session.setAttribute("scId", unique);
		 
		return response;
	}
	
}
