package com.itwillbs.Code_Green.vo;

public class ManagerVO {
	
	private int         manager_idx; 
	private String  	manager_id;
	private String  	manager_pass;
	private String  	manager_name; 
	private String  	manager_brandname; 
	private String  	manager_storecode; 
	private String  	manager_phone; 
	private String  	manager_email; 
	private String  	manager_email_auth; 
	private String  	manager_postcode; 
	private String  	manager_address; 
	private String      manager_adminauth;
	private String      manager_realfile; 
	private String     	manager_original_file; 
	private String     	manager_del_yn; 
	private String		manager_date;
	public int getManager_idx() {
		return manager_idx;
	}
	public void setManager_idx(int manager_idx) {
		this.manager_idx = manager_idx;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pass() {
		return manager_pass;
	}
	public void setManager_pass(String manager_pass) {
		this.manager_pass = manager_pass;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	public String getManager_storecode() {
		return manager_storecode;
	}
	public void setManager_storecode(String manager_storecode) {
		this.manager_storecode = manager_storecode;
	}
	public String getManager_phone() {
		return manager_phone;
	}
	public void setManager_phone(String manager_phone) {
		this.manager_phone = manager_phone;
	}
	public String getManager_email() {
		return manager_email;
	}
	public void setManager_email(String manager_email) {
		this.manager_email = manager_email;
	}
	public String getManager_email_auth() {
		return manager_email_auth;
	}
	public void setManager_email_auth(String manager_email_auth) {
		this.manager_email_auth = manager_email_auth;
	}
	public String getManager_postcode() {
		return manager_postcode;
	}
	public void setManager_postcode(String manager_postcode) {
		this.manager_postcode = manager_postcode;
	}
	public String getManager_address() {
		return manager_address;
	}
	public void setManager_address(String manager_address) {
		this.manager_address = manager_address;
	}
	public String getManager_adminauth() {
		return manager_adminauth;
	}
	public void setManager_adminauth(String manager_adminauth) {
		this.manager_adminauth = manager_adminauth;
	}
	public String getManager_realfile() {
		return manager_realfile;
	}
	public void setManager_realfile(String manager_realfile) {
		this.manager_realfile = manager_realfile;
	}
	public String getManager_original_file() {
		return manager_original_file;
	}
	public void setManager_original_file(String manager_original_file) {
		this.manager_original_file = manager_original_file;
	}
	public String getManager_del_yn() {
		return manager_del_yn;
	}
	public void setManager_del_yn(String manager_del_yn) {
		this.manager_del_yn = manager_del_yn;
	}
	public String getManager_date() {
		return manager_date;
	}
	public void setManager_date(String manager_date) {
		this.manager_date = manager_date;
	}
	
	
	
	public ManagerVO() {
		// TODO Auto-generated constructor stub
	}
	public ManagerVO(int manager_idx, String manager_id, String manager_pass, String manager_name,
			String manager_brandname, String manager_storecode, String manager_phone, String manager_email,
			String manager_email_auth, String manager_postcode, String manager_address, String manager_adminauth,
			String manager_realfile, String manager_original_file, String manager_del_yn, String manager_date) {
		super();
		this.manager_idx = manager_idx;
		this.manager_id = manager_id;
		this.manager_pass = manager_pass;
		this.manager_name = manager_name;
		this.manager_brandname = manager_brandname;
		this.manager_storecode = manager_storecode;
		this.manager_phone = manager_phone;
		this.manager_email = manager_email;
		this.manager_email_auth = manager_email_auth;
		this.manager_postcode = manager_postcode;
		this.manager_address = manager_address;
		this.manager_adminauth = manager_adminauth;
		this.manager_realfile = manager_realfile;
		this.manager_original_file = manager_original_file;
		this.manager_del_yn = manager_del_yn;
		this.manager_date = manager_date;
	}
	@Override
	public String toString() {
		return "ManagerVO [manager_idx=" + manager_idx + ", manager_id=" + manager_id + ", manager_pass=" + manager_pass
				+ ", manager_name=" + manager_name + ", manager_brandname=" + manager_brandname
				+ ", manager_storecode=" + manager_storecode + ", manager_phone=" + manager_phone + ", manager_email="
				+ manager_email + ", manager_email_auth=" + manager_email_auth + ", manager_postcode="
				+ manager_postcode + ", manager_address=" + manager_address + ", manager_adminauth=" + manager_adminauth
				+ ", manager_realfile=" + manager_realfile + ", manager_original_file=" + manager_original_file
				+ ", manager_del_yn=" + manager_del_yn + ", manager_date=" + manager_date + "]";
	}
	
	

}
