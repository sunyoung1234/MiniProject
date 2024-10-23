package com.team.proj.savesubcal.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.savesubcal.dto.SaveSubcalDTO;

@Mapper
public interface ISaveSubcalDAO {

	int saveSubCal(SaveSubcalDTO ssd);
}
