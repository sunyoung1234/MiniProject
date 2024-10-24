package com.team.proj.savesubcal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.savesubcal.dao.ISaveSubcalDAO;
import com.team.proj.savesubcal.dto.SaveSubcalDTO;

@Service
public class SaveSubcalService {
	
	@Autowired
	ISaveSubcalDAO dao;
	
	public int saveSubCal(SaveSubcalDTO ssd) {
		int result = dao.saveSubCal(ssd);
		return result;
	}
	
	public List<SaveSubcalDTO> findBySscId(String sscId){
		List<SaveSubcalDTO> result = dao.findBySscId(sscId);
		return result;
	}

}
