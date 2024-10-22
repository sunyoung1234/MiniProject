package com.team.proj.greenhouse.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.greenhouse.dto.GreenDTO;

@Mapper
public interface IGreenDAO {

	List<GreenDTO> getListGreen();
	
}
