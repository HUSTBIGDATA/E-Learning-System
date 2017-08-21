package com.elearning.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.entity.Manager;
import com.elearning.service.ManagerService;
import com.elearning.tools.Md5Hash;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping(value = "/studentImport.html", method = RequestMethod.GET)
	public ModelAndView studentImportLoad() {
		System.out.println("fuck");
		return new ModelAndView("admin/studentImport");
	}
	
	@RequestMapping(value = "/upLoadFile.html", method = RequestMethod.POST)
	public ModelAndView upLoadFile(HttpServletRequest httpServletRequest,
			@RequestParam(value = "inputfile") MultipartFile inputfile) throws IOException {
			//byte[] bytes = inputfile.getBytes();
		String path = httpServletRequest.getSession().getServletContext().getRealPath("upload");
		String fileName = inputfile.getOriginalFilename();
		System.out.println(fileName);
		System.out.println(path);
		File targetFile = new File(path, fileName);
		System.out.println(targetFile);
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
