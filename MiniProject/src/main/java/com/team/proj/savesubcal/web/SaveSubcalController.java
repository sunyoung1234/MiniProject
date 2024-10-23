package com.team.proj.savesubcal.web;

import java.io.IOException;
import java.util.ArrayList;
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
import com.team.proj.member.dto.MemberDTO;
import com.team.proj.savesubcal.dto.SaveSubcalDTO;
import com.team.proj.savesubcal.service.SaveSubcalService;

@Controller
public class SaveSubcalController {

	@Autowired
	SaveSubcalService ssc;
	
	@Autowired
	BoardService boardService;
	
	@ResponseBody
	@RequestMapping("/saveSub")
	public String saveSub(@RequestBody Map<String, Object> data, HttpSession session) {
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
		ssd.setSubCalId(sscId);
		
		try {
        	ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> matMap = objectMapper.readValue(strMatMap, Map.class);
			
			Set<String> matKeySet = matMap.keySet();
			List<String> matKeyList = new ArrayList<>(matKeySet);
			
			
			for(String key : matKeyList) {
				
				
				ssd.setMatNo(Integer.parseInt(key));
				
				String strSubMap = matMap.get(key + "");
				Map<String, Double> subMap = objectMapper.readValue(strSubMap, Map.class);
				
				Set<String> subKeySet = subMap.keySet();
				List<String> subKeyList = new ArrayList<>(subKeySet);
				
				
				Object res = subMap.get("0");
				double result = 0;
				
				if(res instanceof Integer) {
					int int_res = (int) res ;
					result = int_res;
					
				}else {
					result = (double)res;
				}
				
				double differ = Math.round((before_result - result) * 100) / 100;
				ssd.setDifferentCo(differ);
				
				/*
				 * for(String subKey : subKeyList) {
				 * 
				 * if(!subKey.equals("0")) { ssd.setSubNo(Integer.parseInt(subKey));
				 * 
				 * double vol = subMap.get(subKey).doubleValue(); ssd.setSubVol(vol);
				 * System.out.println(ssd); } }
				 */
				
				
				
				

				
				
			}
			
			/*
			 * ssd.setMatNo(0) ssd.setSubNo(0) ssd.setSubVol(0) ssd.setDifferentCo(0)
			 */
			
			
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		return "a";
	}
	
}
