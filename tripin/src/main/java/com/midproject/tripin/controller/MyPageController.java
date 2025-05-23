package com.midproject.tripin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.midproject.tripin.model.InquiriesVO;
import com.midproject.tripin.model.PlaceVO;
import com.midproject.tripin.model.ReviewVO;
import com.midproject.tripin.model.UserVO;
import com.midproject.tripin.repository.InquiryRepo;
import com.midproject.tripin.service.impl.InquiryServiceImpl;
import com.midproject.tripin.service.impl.PlaceServiceImpl;
import com.midproject.tripin.service.impl.ReviewServiceImpl;
import com.midproject.tripin.service.impl.UserServiceImpl;

@Controller
public class MyPageController {
	
	@Autowired
	private UserServiceImpl userServiceImpl;
	@Autowired
	private ReviewServiceImpl reviewServiceImpl;
	@Autowired
	private PlaceServiceImpl placeServiceImpl;
	@Autowired
	private InquiryServiceImpl inquiryServiceImpl;

	@RequestMapping(value="mypage")
	public void mypage(Model m, HttpSession session) {
		// 밑에 세줄 나중에 로그인 컨트롤러에서 설정해야됨.
		UserVO user = userServiceImpl.selectUser(1);
		m.addAttribute("user", user);
		session.setAttribute("user", user);
		
		// 윗줄들 성공하면 user_id 가져오기
		UserVO user_ex = (UserVO)session.getAttribute("user");
		
//		System.out.println("========user_id:"+user_ex.getUser_id());
		
		Integer user_id = user_ex.getUser_id();
		// 유저별 저장한 여행지, 마이페이지 jsp에서 forEach 돌림
		List<PlaceVO> placeListByUser = placeServiceImpl.selectPlaceByUser(user.getUser_id());
		m.addAttribute("places", placeListByUser);
		
		// 유저별 리뷰 저장, 마이페이지 jsp에서 forEach 돌림
		List<ReviewVO> rivewListByUser = reviewServiceImpl.selectReviewByUser(user.getUser_id());
		m.addAttribute("reviews", rivewListByUser);
		
		// 유저의 전체 리뷰 갯수 Integer 반환 m에 저장해야함
		Integer reviewCount = reviewServiceImpl.reviewCountByUser(user.getUser_id());
		m.addAttribute("reviewCount", reviewCount);
		
		
		// 여행지 전체리뷰수(dest 객체 가져와야함)
//		Integer reviewCountByDest = reviewServiceImpl.reviewCountByDest(dest.getDest_id());
//		m.addAttribute("reviewCountByDest", reviewCountByDest);
		
		// 여행지 리뷰평점(dest 객체 가져와야함)
//		Float reviewAvgByDest = reviewServiceImpl.reviewAvgByDest(dest.getDest_id());
//		m.addAttribute("reviewAvgByDest", reviewAvgByDest);
		
		// 내 문의 리스트 보이기 jsp에서 forEach 돌려야함
		List<InquiriesVO> inquiries = inquiryServiceImpl.selectInquiryListByUser(user_id);
		m.addAttribute("inquiries", inquiries);
		
	}
	
	@RequestMapping("deletereview")
	@ResponseBody
	public void deleteReview(Integer review_id){
		reviewServiceImpl.deleteReview(review_id);
	}
	
	@PostMapping("updateUser")
	public String updateUser(UserVO user) {
		System.out.println(user.toString());
		userServiceImpl.updateUser(user);
		return "redirect: mypage.do";
	}
	
	
	@RequestMapping("deleteinquiry")
	@ResponseBody
	public void deleteInquiry(Integer chat_inq_id) {
		inquiryServiceImpl.deleteInquiry(chat_inq_id);
	}
	
	
}
