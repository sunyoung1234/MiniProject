package com.team.proj.reply.service;

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
}
