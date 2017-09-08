package com.elearning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/read")
public class ReadOnlineController {
	
	@RequestMapping(value = "/readOnline.do", method = RequestMethod.GET)
	public ModelAndView readOnline(String filepath) {
		System.out.println(filepath);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("public/readOnline");
		return mv;
	}
}
