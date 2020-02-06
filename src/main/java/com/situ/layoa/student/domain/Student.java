package com.situ.layoa.student.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class Student implements Serializable {

	private static final long serialVersionUID = 1L;
  
	private Long rowId;//主键
	private String stuName;//学生名称
	private Integer stuAge;//学生年龄
	private Integer stuSex;//学生性别
	private List<String> stuLikes;//学生爱好
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stuBirthday;
	public Long getRowId() {
		return rowId;
	}
	public void setRowId(Long rowId) {
		this.rowId = rowId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public Integer getStuAge() {
		return stuAge;
	}
	public void setStuAge(Integer stuAge) {
		this.stuAge = stuAge;
	}
	public Integer getStuSex() {
		return stuSex;
	}
	public void setStuSex(Integer stuSex) {
		this.stuSex = stuSex;
	}
	public List<String> getStuLikes() {
		return stuLikes;
	}
	public void setStuLikes(List<String> stuLikes) {
		this.stuLikes = stuLikes;
	}
	public Date getStuBirthday() {
		return stuBirthday;
	}
	public void setStuBirthday(Date stuBirthday) {
		this.stuBirthday = stuBirthday;
	}
	@Override
	public String toString() {
		return "Student [rowId=" + rowId + ", stuName=" + stuName + ", stuAge=" + stuAge + ", stuSex=" + stuSex
				+ ", stuLikes=" + stuLikes + ", stuBirthday=" + stuBirthday + "]";
	}
	
	
}
