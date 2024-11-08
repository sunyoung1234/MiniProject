package com.team.proj.zero.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.zero.dao.IZeroDAO;
import com.team.proj.zero.dto.ZeroDTO;

@Service
public class ZeroService {

	@Autowired
	IZeroDAO dao;
	
	public List<ZeroDTO> allZero(){
		List<ZeroDTO> result = dao.allZero();
		return result;
		
	}
}
