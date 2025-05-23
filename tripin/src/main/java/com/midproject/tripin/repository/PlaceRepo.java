package com.midproject.tripin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.midproject.tripin.model.PlaceVO;

@Mapper
public interface PlaceRepo {
	 List<PlaceVO> selectPlaceByUser(Integer user_id);
}
