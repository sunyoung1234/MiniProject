package com.team.proj.member.dao;

import org.apache.ibatis.annotations.Mapper;
import com.team.proj.member.dto.MemberDTO;

@Mapper
public interface IMemberDAO {
	
	// ȸ������ 
	int registMember(MemberDTO mem);
	
	// �α���
	MemberDTO loginMember(MemberDTO member);
	
	// ȸ�� ���� ����
	int updateMember(MemberDTO member);
}
