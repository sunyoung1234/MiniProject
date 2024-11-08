package com.team.proj.savesubcal.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.proj.board.dto.BoardDTO;
import com.team.proj.board.service.BoardService;
import com.team.proj.materials.dto.MaterialsDTO;
import com.team.proj.materials.service.MaterialsService;
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.savesubcal.dto.SaveSubcalDTO;
import com.team.proj.savesubcal.service.SaveSubcalService;
import com.team.proj.substitute.dto.SubstituteDTO;
import com.team.proj.substitute.service.SubService;

@Controller
public class SaveSubcalController {

	@Autowired
	SaveSubcalService ssc;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	SubService subService;
	
	@Autowired
	MaterialsService mService;
	
	@ResponseBody
	@RequestMapping("/saveSub")
	public Map<String, Object> saveSub(@RequestBody Map<String, Object> data, HttpSession session) {
		
		
		String sscId = (String) data.get("id");
		MemberDTO login = (MemberDTO)session.getAttribute("login");
		sscId = sscId + login.getMemId();
		
		String boardNo = (String) data.get("b_id");
		int b_no = Integer.parseInt(boardNo);
		
		
		BoardDTO board = boardService.getBoardByNo(b_no);
		double before_result = board.getCalcResult();
		
		
		String strMatMap = (String) data.get("map");
		
		SaveSubcalDTO ssd = new SaveSubcalDTO();
		
		ssd.setBoardId(boardNo);
		ssd.setSubcalId(sscId);
		Map<String, Object> response = new HashMap<>();
		
		try {
        	ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> matMap = objectMapper.readValue(strMatMap, Map.class);
			
			Set<String> matKeySet = matMap.keySet();
			List<String> matKeyList = new ArrayList<>(matKeySet);
			List<Integer> eaList = new ArrayList<>();
			
			
			
			for(String key : matKeyList) {
				int ea = 0;
				
				ssd.setMatNo(Integer.parseInt(key));
				
				String strSubMap = matMap.get(key + "");
				Map<String, Double> subMap = objectMapper.readValue(strSubMap, Map.class);
				
				Set<String> subKeySet = subMap.keySet();
				List<String> subKeyList = new ArrayList<>(subKeySet);
				
				System.out.println(subMap);
				System.out.println("서브매	ㅂ");
				
				Object res = subMap.get("0");
				
				double result = 0;
				if(res instanceof Integer) {
					int int_res = (int) res ;
					result += int_res;
					
				}else {
					result += (double)res;
				}
				
				double differ = Math.round((before_result - result) * 100) / 100;
				ssd.setDifferentCo(differ);
				
				for(String subKey : subKeyList) {
					
					if(!subKey.equals("0")) {
						ssd.setSubNo(Integer.parseInt(subKey));
						
						Object sub_res = subMap.get(subKey);
						
						double sub_result = 0;
						
						if(sub_res instanceof Integer) {
							int int_res = (int) sub_res ;
							sub_result = int_res;
							
						}else {
							sub_result = (double)res;
						}
						 
						
						if(sub_result > 0) {
							ssd.setSubVol(sub_result);
							ssd.setConfirmYn("N");
							System.out.println(ssd); 
							
							ssc.saveSubCal(ssd);
							ea++;
						}
					} 
				}
				eaList.add(ea);
			}
		response.put("eaList", eaList);
		
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// sscId 로 꺼내오기
		List<SaveSubcalDTO> sscList = ssc.findBySscId(sscId);
		List<SubstituteDTO> subList = new ArrayList<>();
		List<MaterialsDTO> matList = new ArrayList<>();
		
		for(SaveSubcalDTO ssc : sscList) {
			int sub_no = ssc.getSubNo();
			int mat_no = ssc.getMatNo();
			MaterialsDTO m = mService.getByMatNo(mat_no);
			SubstituteDTO s = subService.getSubByNo(sub_no);
			subList.add(s);
			matList.add(m);
		}
		
		
		
		response.put("matList", matList);
		response.put("sscList", sscList);
		response.put("subList", subList);
		
		
		
		
		return response;
	}
	
}
