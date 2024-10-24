package com.team.proj.savesubcal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.savesubcal.dto.SaveSubcalDTO;

@Mapper
public interface ISaveSubcalDAO {

	int saveSubCal(SaveSubcalDTO ssd);
	
	List<SaveSubcalDTO> findBySscId(String sscId);
	
	int updateSubCal(String sscId);
	
	int deleteSubCal();
}
