package com.team.proj.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.reply.dao.IReplyDAO;
import com.team.proj.reply.dto.ReplyDTO;

@Service
public class ReplyService {

	@Autowired
	IReplyDAO dao;
	
	public int writeReply(ReplyDTO reply) {
		int result = dao.writeReply(reply);
		return result;
	}
	
	public List<ReplyDTO> getListReply(String memId){
		List<ReplyDTO> result = dao.getListReply(memId);
		return result;
	}
	
	public double getReplyResult(String memId) {
		double result = dao.getReplyResult(memId);
		return result;
	}
}
