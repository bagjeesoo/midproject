package com.midproject.tripin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.midproject.tripin.model.InquiriesVO;
import com.midproject.tripin.repository.InquiryRepo;
import com.midproject.tripin.service.InquiryService;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private InquiryRepo inquiryRepo;
	
	@Override
	public void deleteInquiry(Integer chat_inq_id) {
		inquiryRepo.deleteInquiry(chat_inq_id);
	}

	@Override
	public List<InquiriesVO> selectInquiryListByUser(Integer user_id) {
		return inquiryRepo.selectInquiryListByUser(user_id);
	}

}
