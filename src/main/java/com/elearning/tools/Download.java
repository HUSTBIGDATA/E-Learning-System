package com.elearning.tools;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Download {
	public static void downloadFile(File file, HttpServletRequest request, HttpServletResponse response) {
		try {
			BufferedInputStream fis = new BufferedInputStream(new FileInputStream(file.getPath()));
            byte[] buffer = new byte[fis.available()];
            fis.read(buffer);
            fis.close();
            // 清空response
            response.reset();
            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + new String(file.getName().getBytes("UTF-8"),"ISO-8859-1"));
            toClient.write(buffer);
            toClient.flush();
            toClient.close();
            file.delete();        //将生成的服务器端文件删除
         } catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void zipFiles(List<String> filePaths, ZipOutputStream outputStream) {
		
		File[] files = new File[filePaths.size()];

        try {
        	
        	for(int i=0;i<filePaths.size();i++) {  
                files[i] = new File(filePaths.get(i));
                //System.out.println(files[i].exists());
                //System.out.println(files[i].getName());
                zipFile(files[i], outputStream);
            }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void zipFile(File inputFile, ZipOutputStream outputStream) {
		try {
			if (inputFile.exists()) {
				 if (inputFile.isFile()) {
					 FileInputStream inStream = new FileInputStream(inputFile);
					 BufferedInputStream bInStream = new BufferedInputStream(inStream);
					 ZipEntry entry = new ZipEntry(inputFile.getName());
					 outputStream.putNextEntry(entry);

					 final int MAX_BYTE = 10 * 1024 * 1024; // 最大的流为10M
					 long streamTotal = 0; // 接受流的容量
					 int streamNum = 0; // 流需要分开的数量
					 int leaveByte = 0; // 文件剩下的字符数
					 byte[] inOutbyte; // byte数组接受文件的数据

					 streamTotal = bInStream.available(); // 通过available方法取得流的最大字符数
					 streamNum = (int) Math.floor(streamTotal / MAX_BYTE); // 取得流文件需要分开的数量
					 leaveByte = (int) streamTotal % MAX_BYTE; // 分开文件之后,剩余的数量

					 if (streamNum > 0) {
						 for (int j = 0; j < streamNum; ++j) {
							 inOutbyte = new byte[MAX_BYTE];
							 // 读入流,保存在byte数组
							 bInStream.read(inOutbyte, 0, MAX_BYTE);
							 outputStream.write(inOutbyte, 0, MAX_BYTE); // 写出流
						 }
					 }
					 // 写出剩下的流数据
					 inOutbyte = new byte[leaveByte];
					 bInStream.read(inOutbyte, 0, leaveByte);
					 outputStream.write(inOutbyte);
					 outputStream.closeEntry(); // Closes the current ZIP entry
					 // and positions the stream for
					 // writing the next entry
					 bInStream.close(); // 关闭
					 inStream.close();
	             }
			 } else {
				 throw new Exception("文件不存在！");
	         }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*public static boolean downloadFile(String filePath, String fileName, HttpServletResponse response) {
		
		response.setCharacterEncoding("utf-8");
		
		try {
			File file = new File(filePath, fileName);
			//以流的形式下载>createFiles文件
			BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file.getPath()));
			byte[] buffer = new byte[bufferedInputStream.available()];
			bufferedInputStream.read(buffer);
			bufferedInputStream.close();
			//清空response  
			response.reset();
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-Disposition", "attachment;filename=" + fileName);
			toClient.write(buffer);  
	        toClient.flush();  
	        toClient.close(); 
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	public static boolean downloadZip(String zipPath, String zipName, List<String>createFilePath,
			HttpServletRequest request, HttpServletResponse response) {
		byte[] buffer = new byte[65536];
		
		String strZipPath = zipPath + "\\" + zipName;
		
		try {
			File tmpZip = new File(zipPath);
			if (!tmpZip.exists())  
				tmpZip.mkdirs();
            File tmpZipFile = new File(strZipPath); 
            if (!tmpZipFile.exists())  
            	tmpZipFile.createNewFile();
            
            ZipOutputStream out = new ZipOutputStream(new FileOutputStream(strZipPath));
            
            File[] files = new File[createFilePath.size()];
            
            for(int i=0;i<createFilePath.size();i++){  
                files[i] = new File(createFilePath.get(i));  
            } 
            
            for(int i=0;i<files.length;i++) {
            	FileInputStream in = new FileInputStream(files[i]);
            	//System.out.print(files[i].getPath());
            	out.putNextEntry(new ZipEntry(files[i].getName()));
            	int len;
            	while((len = in.read(buffer)) > 0) {
            		out.write(buffer, 0, len);
            	}
            	out.closeEntry();
            	in.close();
            }
            out.close();
            downloadFile(zipPath,zipName,response);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}*/
}
