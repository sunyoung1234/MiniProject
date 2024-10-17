package com.team.proj.savecal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.savecal.dto.SavecalDTO;

@Mapper
public interface ISavecalDAO {
	
	int addSavecal(SavecalDTO sc);
	
	List<SavecalDTO> findById(String calcId);
	
	int updateConfirm(String calcId);
	
	int deleteConfirmN();
}
