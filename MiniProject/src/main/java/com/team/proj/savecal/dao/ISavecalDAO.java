package com.team.proj.savecal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.savecal.dto.SavecalDTO;
import com.team.proj.savecal.dto.SavecalMatDTO;
import com.team.proj.savecal.dto.SavecalVolDTO;

@Mapper
public interface ISavecalDAO {
	
	// savecal 추가하기
	int addSavecal(SavecalDTO sc);
	
	// calcId 로 찾기
	List<SavecalDTO> findById(String calcId);
	
	// calcId confirm_yn = Y 로 업데이트
	int updateConfirm(String calcId);
	
	// calcId confirm_yn = N 인것 들 삭제
	int deleteConfirmN();
	
	// inner Join 으로 materials의 name , img 추가 SavecalVolDTO
	List<SavecalVolDTO> getScVol(String calcId);
	
	List<SavecalMatDTO> getScmList(String calcId);
}
