package com.itwillbs.Code_Green.vo;

public class FollowVO {
	
	private int follow_idx;
	private int rf_member_idx;
	private int rf_manager_idx;
	
	

	public FollowVO() {}
	
	public int getFollow_idx() {
		return follow_idx;
	}
	public void setFollow_idx(int follow_idx) {
		this.follow_idx = follow_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	public int getRf_manager_idx() {
		return rf_manager_idx;
	}
	public void setRf_manager_idx(int rf_manager_idx) {
		this.rf_manager_idx = rf_manager_idx;
	}

	
	public FollowVO(int follow_idx, int rf_member_idx, int rf_manager_idx) {
		super();
		this.follow_idx = follow_idx;
		this.rf_member_idx = rf_member_idx;
		this.rf_manager_idx = rf_manager_idx;
	}
	
	
	
	
}
	