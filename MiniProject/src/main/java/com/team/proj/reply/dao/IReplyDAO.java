package com.team.proj.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.reply.dto.ReplyDTO;

@Mapper
public interface IReplyDAO {
	
	// 답변 입력
	int writeReply(ReplyDTO reply);
	
	// 조회
	List<ReplyDTO> getListReply(String memId);
	
	// 결과값만 가져오기
	double getReplyResult(String memId);
	
	// 결과값만 가져오기(회원 전부)
	double getReplyResultAll();
	
	ReplyDTO getReplyByBoardId(int boardNo);
}
 