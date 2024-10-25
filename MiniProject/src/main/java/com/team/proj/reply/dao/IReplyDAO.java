package com.team.proj.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.reply.dto.ReplyDTO;

@Mapper
public interface IReplyDAO {
	
	// �亯 �Է�
	int writeReply(ReplyDTO reply);
	
	// ��ȸ
	List<ReplyDTO> getListReply(String memId);
	
	// ������� ��������
	double getReplyResult(String memId);
	
	// ������� ��������(ȸ�� ����)
	double getReplyResultAll();
	
	ReplyDTO getReplyByBoardId(int boardNo);
}
 