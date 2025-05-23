package com.midproject.tripin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	
	@RequestMapping(value="chatbot")
	public String chatbotPage() {
		
		return "chatbot";
	}
	
	@RequestMapping(value="login")
	public String loginPage() {
		
		return "login";
	}
	
	@RequestMapping(value="admininq")
	public String admininq() {
		return "";
	}
	
	@RequestMapping(value="weather")
	public String weather() {
		return "weather";
	}
}
