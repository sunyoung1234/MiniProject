package com.team.proj.savecal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.savecal.dao.ISavecalDAO;
import com.team.proj.savecal.dto.SavecalDTO;
import com.team.proj.savecal.dto.SavecalVolDTO;

@Service
public class SavecalService {
	
	@Autowired
	ISavecalDAO dao;
	
	public int addSavecal(SavecalDTO sc) {
		int result = dao.addSavecal(sc);
		return result;
	}
	
	public List<SavecalDTO> findById(String id){
		List<SavecalDTO> result = dao.findById(id);
		return result;
	}
	
	public int updateConfirm(String calcId) {
		int result = dao.updateConfirm(calcId);
		return result;
	}
	
	public int deleteConfirmN() {
		int result = dao.deleteConfirmN();
		return result;
	}
	
	
	public List<SavecalVolDTO> getScVol(String calcId){
		List<SavecalVolDTO> result = dao.getScVol(calcId);
		return result;
	}
}
