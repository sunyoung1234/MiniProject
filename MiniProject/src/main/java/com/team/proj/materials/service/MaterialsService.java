package com.team.proj.materials.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.materials.dao.IMaterialsDAO;
import com.team.proj.materials.dto.MaterialsDTO;

@Service
public class MaterialsService {
	@Autowired
	IMaterialsDAO dao;
	
	public List<MaterialsDTO> getMatList(){
		List<MaterialsDTO> result = dao.getMatList();
		return result;
	}
}
