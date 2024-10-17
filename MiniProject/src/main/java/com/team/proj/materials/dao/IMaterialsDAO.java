package com.team.proj.materials.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.materials.dto.MaterialsDTO;

@Mapper
public interface IMaterialsDAO {
	
	List<MaterialsDTO> getMatList();
	
	MaterialsDTO getByMatNo(int no); 
}
