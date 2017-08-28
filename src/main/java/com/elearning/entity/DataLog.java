package com.elearning.entity;

import java.sql.Date;

public class DataLog {
	private int datalogID;
	private int dataID;
	private String downloaderID;
	private Date downloadTime;
	
	public int getDatalogID() {
		return datalogID;
	}
	public void setDatalogID(int datalogID) {
		this.datalogID = datalogID;
	}
	public int getDataID() {
		return dataID;
	}
	public void setDataID(int dataID) {
		this.dataID = dataID;
	}
	public String getDownloaderID() {
		return downloaderID;
	}
	public void setDownloaderID(String downloaderID) {
		this.downloaderID = downloaderID;
	}
	public Date getDownloadTime() {
		return downloadTime;
	}
	public void setDownloadTime(Date downloadTime) {
		this.downloadTime = downloadTime;
	}
}
