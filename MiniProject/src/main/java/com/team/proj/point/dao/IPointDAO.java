package com.team.proj.point.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.point.dto.PointDTO;

@Mapper
public interface IPointDAO {
	
	// ������Ȳ ��������
	List<PointDTO> getPointList();
	
}
