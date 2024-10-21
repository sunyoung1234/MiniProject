package com.team.proj.reply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team.proj.reply.dao.IReplyDAO;

@Service
public class ReplyService {

	@Autowired
	IReplyDAO dao;
	
	public int replyWrite() {
		int result = dao.replyWrite();
		return result;
	}
}
