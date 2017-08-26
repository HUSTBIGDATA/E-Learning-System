package com.elearning.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.entity.PathConfig;

@Controller
@RequestMapping(value = "/upload")
public class UploadController {
	
	private String uploadPath;
	
	@SuppressWarnings("resource")
	@PostConstruct
	public void init() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("pathconfig.xml");
		PathConfig pathConfig = (PathConfig)context.getBean("pathConfig");
		uploadPath = pathConfig.getUploadPath();
	}
	
	@RequestMapping(value = "/uploadFile.do", method = RequestMethod.POST)
	public ModelAndView upLoadFile(HttpServletRequest httpServletRequest,
			@RequestParam(value = "inputfile") MultipartFile inputfile) {
		String fileName = inputfile.getOriginalFilename();
		File targetFile = new File(uploadPath, fileName);
		if(!targetFile.exists()) {  
	       targetFile.mkdirs();
	    }
			
		try {  
			inputfile.transferTo(targetFile);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }
		
		return new ModelAndView("admin/adminIndex");
	}
}
