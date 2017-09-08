package com.elearning.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.elearning.entity.Data;
import com.elearning.entity.PathConfig;
import com.elearning.service.DataService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/data")
public class DataController {
	private String uploadPath;
	
	@SuppressWarnings("resource")
	@PostConstruct
	public void init() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("pathconfig.xml");
		PathConfig pathConfig = (PathConfig)context.getBean("pathConfig");
		uploadPath = pathConfig.getUploadPath();
	}
	
	@Autowired
	private DataService dataService;
	
	@RequestMapping(value = "/dataList.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String dataList() {
		List<Data> dataList = dataService.findAll();
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, dataList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/findByType.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findByType(String type) {
		List<Data> dataList = dataService.findByType(type);
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, dataList);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/deleteData.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deleteData(String dataList) {
		String[] dataIDList = dataList.split(",");
		for(int i = 0;i<dataIDList.length;i++) {
			int ID = Integer.parseInt(dataIDList[i]);
			//dataService.delete(Integer.parseInt(dataIDList[i]));
			//System.out.println(dataIDList[i]);
			File file = new File(dataService.findByID(ID).getDataPath());
			
			if (!file.exists()) {
				//System.out.println("删除文件失败:不存在");
		    } else {
		    if (file.isFile())
		    	file.delete();
		    	//System.out.println("删除文件成功");
		    }
			
			dataService.delete(ID);
		}
		
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, dataService.findAll());
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return writer.toString();
	}
	
	@RequestMapping(value = "/uploadData/{dataType}.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadData(HttpServletRequest httpServletRequest, MultipartFile inputfile, 
			@PathVariable(value = "dataType") String dataType) throws UnsupportedEncodingException {
		dataType = new String(dataType.getBytes("ISO-8859-1"), "utf8");  

		String[] fileNameList = inputfile.getOriginalFilename().split("\\.");
		//String fileName = "studentList." + fileNameList[fileNameList.length - 1];
		String fileName = inputfile.getOriginalFilename();
		File targetFile = new File(uploadPath + "\\data", fileName);
		
		Data data = new Data();
		
		data.setDataAbstract(null);
		data.setDataDownloadSum(0);
		data.setDataImage(null);
		data.setDataName(fileNameList[0]);
		data.setDataPath(uploadPath + "\\data\\" + fileName);
		data.setDataType(dataType);
		
		if(!targetFile.exists()) {  
	       targetFile.mkdirs();
	       dataService.add(data);
	    }
			
		try {
			inputfile.transferTo(targetFile);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		
		try {
			mapper.writeValue(writer, "上传成功!");
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return writer.toString();
	}
	
	@RequestMapping(value =  "/downloadData.do", method = RequestMethod.POST)
    public void downloadData(@RequestParam(value = "ID") String ID, HttpServletRequest request, HttpServletResponse response) {
		OutputStream os = null;
        try {
        	os = response.getOutputStream();
        	File file = new File(dataService.findByID(Integer.parseInt(ID)).getDataPath());

        	if(!file.exists()) {
        		//System.out.println("下载失败,文件不存在");
        	}
        	response.reset();
        	response.setHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("utf-8"),"iso-8859-1"));
        	response.setContentType("application/octet-stream; charset=utf-8");
            os.write(FileUtils.readFileToByteArray(file));
        } catch (Exception e) {
        	e.printStackTrace();
        } finally{
        	IOUtils.closeQuietly(os);
        }
    }
}
