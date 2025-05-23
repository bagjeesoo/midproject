package com.midproject.tripin.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.midproject.tripin.model.InquiriesVO;

@Mapper
public interface InquiryRepo {
	void deleteInquiry(Integer chat_inq_id);
	List<InquiriesVO> selectInquiryListByUser(Integer user_id);
}
