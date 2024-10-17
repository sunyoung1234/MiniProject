package com.team.proj.member.dao;

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
}
