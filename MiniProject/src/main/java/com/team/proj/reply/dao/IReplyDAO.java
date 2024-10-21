package com.team.proj.reply.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IReplyDAO {
	
	// 답변 입력
	int replyWrite();
}
