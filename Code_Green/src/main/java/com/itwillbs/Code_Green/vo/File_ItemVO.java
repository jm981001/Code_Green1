package com.itwillbs.Code_Green.vo;

public class File_ItemVO {
 
 private int  file_item_idx;
 private String  file;
 private String  real_file;
 private int  rf_item_idx;
public int getFile_item_idx() {
	return file_item_idx;
}
public void setFile_item_idx(int file_item_idx) {
	this.file_item_idx = file_item_idx;
}
public String getFile() {
	return file;
}
public void setFile(String file) {
	this.file = file;
}
public String getReal_file() {
	return real_file;
}
public void setReal_file(String real_file) {
	this.real_file = real_file;
}
public int getRf_item_idx() {
	return rf_item_idx;
}
public void setRf_item_idx(int rf_item_idx) {
	this.rf_item_idx = rf_item_idx;
}
@Override
public String toString() {
	return "File_ItemVO [file_item_idx=" + file_item_idx + ", file=" + file + ", real_file=" + real_file
			+ ", rf_item_idx=" + rf_item_idx + "]";
}

public File_ItemVO() {
	// TODO Auto-generated constructor stub
}
public File_ItemVO(int file_item_idx, String file, String real_file, int rf_item_idx) {
	super();
	this.file_item_idx = file_item_idx;
	this.file = file;
	this.real_file = real_file;
	this.rf_item_idx = rf_item_idx;
}
 
	
}
