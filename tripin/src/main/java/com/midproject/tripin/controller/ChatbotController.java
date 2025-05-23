package com.midproject.tripin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.midproject.tripin.model.ChatbotRecommendationVO;
import com.midproject.tripin.model.FAQVO;
import com.midproject.tripin.model.InquiriesVO;
import com.midproject.tripin.service.impl.ChatbotServiceImpl;

@RestController
public class ChatbotController {
	
	@Autowired
	private ChatbotServiceImpl chatbotServiceImpl;
	  
	// ********추천챗봇***********
	  @GetMapping(value="selectByUser")
	  public List<ChatbotRecommendationVO> getChatList(Integer user_id, Model m) {
		  List<ChatbotRecommendationVO> chatList = chatbotServiceImpl.getChatList(user_id);
		  m.addAttribute("chatList", chatList);
		  return chatList;
	  }
	  
	  @PostMapping(value="insertChat")
	  public void insertChat(Integer user_id, ChatbotRecommendationVO vo){
		  chatbotServiceImpl.insertChat(vo);
	  }
	  
	  
	// ********문의챗봇***********
	  @GetMapping(value="inquiry")
	  public FAQVO inquireResponseSelect(Integer inquiry_id) {
		  FAQVO faqVO = chatbotServiceImpl.inquireResponseSelect(inquiry_id);
		  return faqVO;
	  }
	  
	  @GetMapping(value="inquiries")
	  public List<InquiriesVO> getInquiriesList(Integer user_id){
		  List<InquiriesVO> inquiriesList = chatbotServiceImpl.getInquiriesList(user_id);
		  return inquiriesList;
	  }
	  
	  @PostMapping(value="insertInqChat")
	  public void insertInqChat(Integer user_id, InquiriesVO vo){
		  chatbotServiceImpl.insertInqChat(vo);
	  }
	  
	  
}
