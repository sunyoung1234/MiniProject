package com.team.proj.member.dao;

import java.util.List;

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
	
	// ��� ȸ�� ��� ��ȸ �޼ҵ�
	List<MemberDTO> getMemberList();
	
	
	int deleteMember(String memId);
	
	
}
