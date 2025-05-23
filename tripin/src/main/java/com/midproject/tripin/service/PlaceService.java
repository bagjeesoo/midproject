package com.midproject.tripin.service;

import java.util.List;

import com.midproject.tripin.model.PlaceVO;

public interface PlaceService {
	 List<PlaceVO> selectPlaceByUser(Integer user_id);
}
