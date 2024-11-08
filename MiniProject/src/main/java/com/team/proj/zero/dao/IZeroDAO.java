package com.team.proj.zero.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.proj.zero.dto.ZeroDTO;

@Mapper
public interface IZeroDAO {

	List<ZeroDTO> allZero();
}
