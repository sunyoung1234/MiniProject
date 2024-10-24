package com.team.proj.reply.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.reply.dto.ReplyDTO;

@Mapper
public interface IReplyDAO {
	
	// 답변 입력
	int writeReply(ReplyDTO reply);
}
 