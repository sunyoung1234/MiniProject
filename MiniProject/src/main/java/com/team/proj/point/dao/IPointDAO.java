package com.team.proj.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.point.dto.PointDTO;

@Mapper
public interface IPointDAO {
	
	// 참여현황 가져오기
	List<PointDTO> getPointList();
	
}
