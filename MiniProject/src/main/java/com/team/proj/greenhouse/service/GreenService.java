package com.team.proj.greenhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.greenhouse.dao.IGreenDAO;
import com.team.proj.greenhouse.dto.GreenDTO;

@Service
public class GreenService {
	
	@Autowired
	IGreenDAO dao;
	
	public List<GreenDTO> getListGreen(){
		List<GreenDTO> result = dao.getListGreen();
		return result;
	}
	

}
