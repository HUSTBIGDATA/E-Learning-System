package com.elearning.controller;

import java.io.IOException;
import java.io.StringWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.elearning.service.ManagerService;
import com.elearning.service.StudentService;
import com.elearning.service.TeacherService;
import com.elearning.tools.POIUtil;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping(value = "/manager")
public class ManagerController {
	/*private String uploadPath;
	
	@SuppressWarnings("resource")
	@PostConstruct
	public void init() {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("pathconfig.xml");
		PathConfig pathConfig = (PathConfig)context.getBean("pathConfig");
		uploadPath = pathConfig.getUploadPath();
	}*/
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private TeacherService teacherService;
	
	//@Autowired
	//private DataService dataService;
	
	@RequestMapping(value = "/studentImport.do", method = RequestMethod.GET)
	public ModelAndView studentImportLoad() {
		return new ModelAndView("admin/studentImport");
	}
	
	@RequestMapping(value = "/studentScan.do", method = RequestMethod.GET)
	public ModelAndView studentScanLoad() {
		return new ModelAndView("admin/studentScan");
	}
	
	@RequestMapping(value = "/adminInfo/{adminID}.do", method = RequestMethod.GET)
	public ModelAndView adminInfoLoad(@PathVariable("adminID") String ID) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/adminInfo");
		mv.addObject("adminID", ID);
		mv.addObject("adminName", managerService.findByID(ID).getName());
		return mv;
	}
	
	@RequestMapping(value = "/teacherScan.do", method = RequestMethod.GET)
	public ModelAndView teacherScanLoad() {
		return new ModelAndView("admin/teacherScan");
	}
	
	@RequestMapping(value = "/teacherImport.do", method = RequestMethod.GET)
	public ModelAndView teacherImportLoad() {
		return new ModelAndView("admin/teacherImport");
	}
	
	@RequestMapping(value = "/courseScan.do", method = RequestMethod.GET)
	public ModelAndView courseScanLoad() {
		return new ModelAndView("admin/courseScan");
	}
	
	@RequestMapping(value = "/dataScan.do", method = RequestMethod.GET)
	public ModelAndView dataScanLoad() {
		return new ModelAndView("admin/dataScan");
	}
	
	@RequestMapping(value = "/videoScan.do", method = RequestMethod.GET)
	public ModelAndView videoScanLoad() {
		return new ModelAndView("admin/videoScan");
	}
	
	/*@RequestMapping(value = "/dataImport.do", method = RequestMethod.GET)
	public ModelAndView dataImportLoad() {
		return new ModelAndView("admin/dataImport");
	}*/
	
	@RequestMapping(value = "/modifyPassword.do", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String modifyPassword(ModifyPasswordCommand modifyPasswordCommand) {
		ObjectMapper mapper = new ObjectMapper();
		StringWriter writer = new StringWriter();
		String response = "";
		
		String ID = modifyPasswordCommand.getID();
		String newPassword = modifyPasswordCommand.getNewPassword();
		String oldPassword = modifyPasswordCommand.getOldPassword();
		
		managerService.modifyPassword(ID, newPassword);	
		if(oldPassword!=managerService.getPassword(ID)) {
			response = "修改成功!";
		}
		else {
			response = "修改失败!";
		}
		
		try {
			mapper.writeValue(writer, response);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return writer.toString();
	} 
	
	@RequestMapping(value = "/uploadStudentList.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadStudentList(HttpServletRequest httpServletRequest, MultipartFile inputfile) {
		/*String[] fileNameList = inputfile.getOriginalFilename().split("\\.");
		String fileName = "studentList." + fileNameList[fileNameList.length - 1];
		File targetFile = new File(uploadPath + "\\namelist", fileName);
		if(!targetFile.exists()) {  
	       targetFile.mkdirs();
	    }
			
		try {  
			inputfile.transferTo(targetFile);  
	    } catch (Exception e) {  
	        e.printStackTrace();  
	    }*/
		try {
			List<String[]> studentList = POIUtil.readExcel(inputfile);
			for (String[] info : studentList) {
				studentService.insertBasicInformation(info[0], info[1], info[2], info[3]);
			}
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
	
	@RequestMapping(value = "/uploadTeacherList.do", method = RequestMethod.POST)
	@ResponseBody
	public String uploadTeacherList(HttpServletRequest httpServletRequest,
			@RequestParam(value = "inputfile") MultipartFile inputfile) {
		try {
			List<String[]> studentList = POIUtil.readExcel(inputfile);
			for (String[] info : studentList) {
				teacherService.insertBasicInformation(info[0], info[1], info[2], info[3]);
			}
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
	
	/*@RequestMapping(value = "/uploadData/{dataType}.do", method = RequestMethod.POST)
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
		System.out.println(writer.toString());
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
    }*/
}
