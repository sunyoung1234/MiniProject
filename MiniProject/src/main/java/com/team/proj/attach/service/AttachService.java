package com.team.proj.attach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.attach.dao.IAttachDAO;
import com.team.proj.attach.dto.AttachDTO;

@Service
public class AttachService {
	
	@Autowired
	IAttachDAO dao;
	
	public int insertAttach(AttachDTO attach) {
		int result = dao.insertAttach(attach);
		return result;
	}
	
	public List<AttachDTO> getAttachList(int boardNo){
		List<AttachDTO> result = dao.getAttachList(boardNo);
		return result;
	}
}
