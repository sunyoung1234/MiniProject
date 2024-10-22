package com.team.proj.savecal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.savecal.dto.SavecalDTO;
import com.team.proj.savecal.dto.SavecalMatDTO;
import com.team.proj.savecal.dto.SavecalVolDTO;

@Mapper
public interface ISavecalDAO {
	
	// savecal �߰��ϱ�
	int addSavecal(SavecalDTO sc);
	
	// calcId �� ã��
	List<SavecalDTO> findById(String calcId);
	
	// calcId confirm_yn = Y �� ������Ʈ
	int updateConfirm(String calcId);
	
	// calcId confirm_yn = N �ΰ� �� ����
	int deleteConfirmN();
	
	// inner Join ���� materials�� name , img �߰� SavecalVolDTO
	List<SavecalVolDTO> getScVol(String calcId);
	
	List<SavecalMatDTO> getScmList(String calcId);
}
