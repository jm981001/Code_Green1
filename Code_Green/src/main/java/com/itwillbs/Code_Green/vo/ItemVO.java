package com.itwillbs.Code_Green.vo;

public class ItemVO {
	
	
	private int item_idx;
	private String re_manager_idx;
	private String item_name;
	private String item_info;
	private String item_packing;
	private String item_category;
	private String item_price;
	private String item_sale;
	private String item_stock;
	private String item_status;
	private String item_readcount;
	private String item_date;
	private String file1;
	private String file2;
	private String manager_brandname;
	private String board_star_score;
	private String count;
	
	public int getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(int item_idx) {
		this.item_idx = item_idx;
	}
	public String getRe_manager_idx() {
		return re_manager_idx;
	}
	public void setRe_manager_idx(String re_manager_idx) {
		this.re_manager_idx = re_manager_idx;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_info() {
		return item_info;
	}
	public void setItem_info(String item_info) {
		this.item_info = item_info;
	}
	public String getItem_packing() {
		return item_packing;
	}
	public void setItem_packing(String item_packing) {
		this.item_packing = item_packing;
	}
	public String getItem_category() {
		return item_category;
	}
	public void setItem_category(String item_category) {
		this.item_category = item_category;
	}
	public String getItem_price() {
		return item_price;
	}
	public void setItem_price(String item_price) {
		this.item_price = item_price;
	}
	public String getItem_sale() {
		return item_sale;
	}
	public void setItem_sale(String item_sale) {
		this.item_sale = item_sale;
	}
	public String getItem_stock() {
		return item_stock;
	}
	public void setItem_stock(String item_stock) {
		this.item_stock = item_stock;
	}
	public String getItem_status() {
		return item_status;
	}
	public void setItem_status(String item_status) {
		this.item_status = item_status;
	}
	public String getItem_readcount() {
		return item_readcount;
	}
	public void setItem_readcount(String item_readcount) {
		this.item_readcount = item_readcount;
	}
	public String getItem_date() {
		return item_date;
	}
	public void setItem_date(String item_date) {
		this.item_date = item_date;
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
	public String getManager_brandname() {
		return manager_brandname;
	}
	public void setManager_brandname(String manager_brandname) {
		this.manager_brandname = manager_brandname;
	}
	
	
	public String getBoard_star_score() {
		return board_star_score;
	}
	public void setBoard_star_score(String board_star_score) {
		this.board_star_score = board_star_score;
	}
	
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public ItemVO() {
		// TODO Auto-generated constructor stub
	}
	public ItemVO(int item_idx, String re_manager_idx, String item_name, String item_info, String item_packing,
			String item_category, String item_price, String item_sale, String item_stock, String item_status,
			String item_readcount, String item_date, String file1, String file2, String manager_brandname) {
		super();
		this.item_idx = item_idx;
		this.re_manager_idx = re_manager_idx;
		this.item_name = item_name;
		this.item_info = item_info;
		this.item_packing = item_packing;
		this.item_category = item_category;
		this.item_price = item_price;
		this.item_sale = item_sale;
		this.item_stock = item_stock;
		this.item_status = item_status;
		this.item_readcount = item_readcount;
		this.item_date = item_date;
		this.file1 = file1;
		this.file2 = file2;
		this.manager_brandname = manager_brandname;
	}
	@Override
	public String toString() {
		return "ItemVO [item_idx=" + item_idx + ", re_manager_idx=" + re_manager_idx + ", item_name=" + item_name
				+ ", item_info=" + item_info + ", item_packing=" + item_packing + ", item_category=" + item_category
				+ ", item_price=" + item_price + ", item_sale=" + item_sale + ", item_stock=" + item_stock
				+ ", item_status=" + item_status + ", item_readcount=" + item_readcount + ", item_date=" + item_date
				+ ", file1=" + file1 + ", file2=" + file2 + ", manager_brandname=" + manager_brandname + "]";
	}
	
	
	
	

	
}
