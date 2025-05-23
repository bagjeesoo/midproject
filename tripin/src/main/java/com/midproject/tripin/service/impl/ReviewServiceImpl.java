package com.midproject.tripin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midproject.tripin.model.ReviewVO;
import com.midproject.tripin.repository.ReviewRepo;
import com.midproject.tripin.service.ReviewService;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewRepo reviewRepo;

	@Override
	public List<ReviewVO> selectReviewByUser(Integer user_id) {
		return reviewRepo.selectReviewByUser(user_id);
	}

	@Override
	public void deleteReview(Integer review_id) {
		reviewRepo.deleteReview(review_id);
		
	}

	@Override
	public Integer reviewCountByUser(Integer user_id) {
		return reviewRepo.reviewCountByUser(user_id);
	}
	
}
