package com.team.proj.region.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.region.dao.IRegionDAO;
import com.team.proj.region.dto.RegionDTO;

@Service
public class RegionService {
	
	@Autowired
	IRegionDAO dao;
	
	public List<RegionDTO> getCityPoint(String pointRegion){
		List<RegionDTO> result = dao.getCityPoint(pointRegion);
		return result;
	}

}
