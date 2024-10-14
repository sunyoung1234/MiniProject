package com.team.proj.point.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.point.dao.IPointDAO;
import com.team.proj.point.dto.PointDTO;

@Service
public class PointService {

	@Autowired
	IPointDAO dao;
	
	public List<PointDTO> getPointList(){
		List<PointDTO> result = dao.getPointList();
		return result;
	}
	
	
}
