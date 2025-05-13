package com.midproject.tripin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value="{step}")
	public String admin(@PathVariable String step ) {
		
		return step;
	}
}
