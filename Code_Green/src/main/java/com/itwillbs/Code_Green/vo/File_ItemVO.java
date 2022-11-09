package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class File_ItemVO {
 
 private int  file_item_idx;
 private String  file1;
 private String  file2;
 private int  rf_item_idx;
 private MultipartFile file;
 
 
public int getFile_item_idx() {
	return file_item_idx;
}
public void setFile_item_idx(int file_item_idx) {
	this.file_item_idx = file_item_idx;
}
public String getFile1() {
	return file1;
}
public void setFile1(String file1) {
	this.file1 = file1;
}
public String getFile2() {
	return file2;
}
public void setFile2(String file2) {
	this.file2 = file2;
}
public int getRf_item_idx() {
	return rf_item_idx;
}
public void setRf_item_idx(int rf_item_idx) {
	this.rf_item_idx = rf_item_idx;
}
public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
}

public File_ItemVO() {
	// TODO Auto-generated constructor stub
}

public File_ItemVO(int file_item_idx, String file1, String file2, int rf_item_idx, MultipartFile file) {
	super();
	this.file_item_idx = file_item_idx;
	this.file1 = file1;
	this.file2 = file2;
	this.rf_item_idx = rf_item_idx;
	this.file = file;
}
@Override
public String toString() {
	return "File_ItemVO [file_item_idx=" + file_item_idx + ", file1=" + file1 + ", file2=" + file2 + ", rf_item_idx="
			+ rf_item_idx + ", file=" + file + ", getFile_item_idx()=" + getFile_item_idx() + ", getFile1()="
			+ getFile1() + ", getFile2()=" + getFile2() + ", getRf_item_idx()=" + getRf_item_idx() + ", getFile()="
			+ getFile() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
			+ super.toString() + "]";
}
 

 
 
 
 
	
}
