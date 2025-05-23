package com.midproject.tripin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midproject.tripin.model.PlaceVO;
import com.midproject.tripin.repository.PlaceRepo;
import com.midproject.tripin.service.PlaceService;

@Service
public class PlaceServiceImpl implements PlaceService {

	@Autowired
	private PlaceRepo placeRepo;
	
	public List<PlaceVO> selectPlaceByUser(Integer user_id){
		return placeRepo.selectPlaceByUser(user_id);
	}
}
