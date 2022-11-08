package com.itwillbs.Code_Green.vo;

import org.springframework.web.multipart.MultipartFile;

public class File_ItemVO {
 
 private int  file_item_idx;
 private MultipartFile  file1;
 private MultipartFile  file2;
 private int  rf_item_idx;
 
 
public int getFile_item_idx() {
	return file_item_idx;
}
public void setFile_item_idx(int file_item_idx) {
	this.file_item_idx = file_item_idx;
}
public MultipartFile getFile1() {
	return file1;
}
public void setFile1(MultipartFile file1) {
	this.file1 = file1;
}
public MultipartFile getFile2() {
	return file2;
}
public void setFile2(MultipartFile file2) {
	this.file2 = file2;
}
public int getRf_item_idx() {
	return rf_item_idx;
}
public void setRf_item_idx(int rf_item_idx) {
	this.rf_item_idx = rf_item_idx;
}

public File_ItemVO() {
	// TODO Auto-generated constructor stub
}
public File_ItemVO(int file_item_idx, MultipartFile file1, MultipartFile file2, int rf_item_idx) {
	super();
	this.file_item_idx = file_item_idx;
	this.file1 = file1;
	this.file2 = file2;
	this.rf_item_idx = rf_item_idx;
}
@Override
public String toString() {
	return "File_ItemVO [file_item_idx=" + file_item_idx + ", file1=" + file1 + ", file2=" + file2 + ", rf_item_idx="
			+ rf_item_idx + "]";
}

 
 
	
}
