package com.team.proj.substitute.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.substitute.dao.ISubDAO;
import com.team.proj.substitute.dto.SubJoinDTO;

@Service
public class SubService {
	
	@Autowired
	ISubDAO dao;
	
	public List<SubJoinDTO> getSubInfo(int matNo){
		List<SubJoinDTO> result = dao.getSubInfo(matNo);
		return result;
	} 
}
