package com.elearning.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/video")
public class VideoController {
	
	@RequestMapping(value = "/videoShow.do", method = RequestMethod.GET)
	public ModelAndView videoShow() {
		return new ModelAndView("public/videoShow");
	}
	
	@RequestMapping(value = "/videoPlay.do", method = RequestMethod.GET)
	public ModelAndView videoPlay() {
		return new ModelAndView("public/videoPlay");
	}
	
	@RequestMapping(value = "/videoMore.do", method = RequestMethod.GET)
	public ModelAndView videoMore() {
		return new ModelAndView("public/videoMore");
	}
}
