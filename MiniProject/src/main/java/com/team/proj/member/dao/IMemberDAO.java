package com.team.proj.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.team.proj.member.dto.MemberDTO;

@Mapper
public interface IMemberDAO {
	
	// 회원가입 
	int registMember(MemberDTO mem);
	
	// 로그인
	MemberDTO loginMember(MemberDTO member);
	
	// 회원 정보 수정
	int updateMember(MemberDTO member);
	
	// 모든 회원 목록 조회 메소드
	List<MemberDTO> getMemberList();
	
	
	int deleteMember(String memId);
	
	
}
