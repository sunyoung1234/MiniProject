package com.team.proj.reply.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.reply.dto.ReplyDTO;

@Mapper
public interface IReplyDAO {
	
	// �亯 �Է�
	int writeReply(ReplyDTO reply);
}
 