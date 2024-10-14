package com.team.proj.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.member.dto.MemberDTO;

@Mapper
public interface IMemberDAO {
	
	int registMember(MemberDTO mem);
}
