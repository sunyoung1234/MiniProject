package com.team.proj.region.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.region.dto.RegionDTO;

@Mapper
public interface IRegionDAO {
	
	List<RegionDTO> getCityPoint(String pointRegion);

}
