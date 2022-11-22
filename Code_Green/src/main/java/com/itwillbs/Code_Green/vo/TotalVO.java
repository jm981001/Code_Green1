package com.itwillbs.Code_Green.vo;

public class TotalVO {
	private int brandtotal;//브랜드매출
	private String  manager_brandname;//브랜드명
	 
	
	
	
	public TotalVO() {}
	
	
	public TotalVO(int brandtotal, String manager_brandname) {
		super();
		this.brandtotal = brandtotal;
		this.manager_brandname = manager_brandname;
	}

	public int getBrandtotal() {
		return brandtotal;
	}

	public void setBrandtotal(int brandtotal) {
		this.brandtotal = brandtotal;
	}

	public String getManager_brandname() {
		return manager_brandname;
	}

	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}


	
	@Override
	public String toString() {
		return "TotalVO [brandtotal=" + brandtotal + ", manager_brandname=" + manager_brandname + "]";
	}


	
	
	
	
	
	
	
}
