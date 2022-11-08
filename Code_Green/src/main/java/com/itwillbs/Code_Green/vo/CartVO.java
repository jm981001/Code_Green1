package com.itwillbs.Code_Green.vo;

public class CartVO {
	private int cart_idx;
	private int rf_item_idx;
	private int rf_member_idx;
	private int cart_amount;
	
	public CartVO() {}

	public int getCart_idx() {
		return cart_idx;
	}

	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}

	public int getRf_item_idx() {
		return rf_item_idx;
	}

	public void setRf_item_idx(int rf_item_idx) {
		this.rf_item_idx = rf_item_idx;
	}

	public int getRf_member_idx() {
		return rf_member_idx;
	}

	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}

	public int getCart_amount() {
		return cart_amount;
	}

	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

	public CartVO(int cart_idx, int rf_item_idx, int rf_member_idx, int cart_amount) {
		super();
		this.cart_idx = cart_idx;
		this.rf_item_idx = rf_item_idx;
		this.rf_member_idx = rf_member_idx;
		this.cart_amount = cart_amount;
	}

	@Override
	public String toString() {
		return "CartVO [cart_idx=" + cart_idx + ", rf_item_idx=" + rf_item_idx + ", rf_member_idx=" + rf_member_idx
				+ ", cart_amount=" + cart_amount + "]";
	}
	
	
	
	
	
}
