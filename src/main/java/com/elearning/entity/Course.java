package com.elearning.entity;

public class Course {
	private int courseID;
	private String courseTeacher;
	private String courseName;
	private String plan;
	private float schedule;
	private String courseInfo;
	private String itemBank;
	
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourseTeacher() {
		return courseTeacher;
	}
	public void setCourseTeacher(String courseTeacher) {
		this.courseTeacher = courseTeacher;
	}
	public String getPlan() {
		return plan;
	}
	public void setPlan(String plan) {
		this.plan = plan;
	}
	public float getSchedule() {
		return schedule;
	}
	public void setSchedule(float schedule) {
		this.schedule = schedule;
	}
	public String getCourseInfo() {
		return courseInfo;
	}
	public void setCourseInfo(String courseInfo) {
		this.courseInfo = courseInfo;
	}
	public String getItemBank() {
		return itemBank;
	}
	public void setItemBank(String itemBank) {
		this.itemBank = itemBank;
	}
}
