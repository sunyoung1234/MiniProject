package com.team.proj.substitute.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.substitute.dto.SubJoinDTO;

@Mapper
public interface ISubDAO {
	
	List<SubJoinDTO> getSubInfo(int matNo); 
}
