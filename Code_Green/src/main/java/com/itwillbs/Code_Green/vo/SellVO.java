package com.itwillbs.Code_Green.vo;


public class SellVO {
	// 전체적인 주문 내역
	// 주문에 대한 상세는 SellDetailVO => 후에 만들 것
	
	private int sell_idx; // 주문 번호
//	private int rf_member_idx; // 회원 번호
	private int rf_item_idx; // 상품 번호
	private String sell_amount; // 상품당 구매 수량
	private String sell_item_total_price; // 상품당 총 금액(가격 * 갯수)
	private String sell_use_coin; // 사용한 적립금
	private String sell_total_pay_price; // 결제할 금액(적립금 + 배송비?)
	private String sell_status; // 주문상태  / default '결제대기중'
	private String sell_shipping_fee; // 배송비 / default '2500'
	private String sell_postcode; // 받는 사람 우편번호
	private String sell_address;  // 받는 사람 주소
	private String sell_phone; // 받는 사람 연락처
	private String sell_receiver; // 받는 사람 이름
	private String sell_date; // 주문일
	private String sell_pay_type; // 결제수단
	private String sell_pay_status; // 결제여부 / default 'N'
	private String sell_pay_date; // 결제일
	
	public SellVO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getSell_idx() {
		return sell_idx;
	}
	public void setSell_idx(int sell_idx) {
		this.sell_idx = sell_idx;
	}
	public int getRf_item_idx() {
		return rf_item_idx;
	}
	public void setRf_item_idx(int rf_item_idx) {
		this.rf_item_idx = rf_item_idx;
	}
	public String getSell_amount() {
		return sell_amount;
	}
	public void setSell_amount(String sell_amount) {
		this.sell_amount = sell_amount;
	}
	public String getSell_item_total_price() {
		return sell_item_total_price;
	}
	public void setSell_item_total_price(String sell_item_total_price) {
		this.sell_item_total_price = sell_item_total_price;
	}
	public String getSell_use_coin() {
		return sell_use_coin;
	}
	public void setSell_use_coin(String sell_use_coin) {
		this.sell_use_coin = sell_use_coin;
	}
	public String getSell_total_pay_price() {
		return sell_total_pay_price;
	}
	public void setSell_total_pay_price(String sell_total_pay_price) {
		this.sell_total_pay_price = sell_total_pay_price;
	}
	public String getSell_status() {
		return sell_status;
	}
	public void setSell_status(String sell_status) {
		this.sell_status = sell_status;
	}
	public String getSell_shipping_fee() {
		return sell_shipping_fee;
	}
	public void setSell_shipping_fee(String sell_shipping_fee) {
		this.sell_shipping_fee = sell_shipping_fee;
	}
	public String getSell_postcode() {
		return sell_postcode;
	}
	public void setSell_postcode(String sell_postcode) {
		this.sell_postcode = sell_postcode;
	}
	public String getSell_address() {
		return sell_address;
	}
	public void setSell_address(String sell_address) {
		this.sell_address = sell_address;
	}
	public String getSell_phone() {
		return sell_phone;
	}
	public void setSell_phone(String sell_phone) {
		this.sell_phone = sell_phone;
	}
	public String getSell_receiver() {
		return sell_receiver;
	}
	public void setSell_receiver(String sell_receiver) {
		this.sell_receiver = sell_receiver;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public String getSell_pay_type() {
		return sell_pay_type;
	}
	public void setSell_pay_type(String sell_pay_type) {
		this.sell_pay_type = sell_pay_type;
	}
	public String getSell_pay_status() {
		return sell_pay_status;
	}
	public void setSell_pay_status(String sell_pay_status) {
		this.sell_pay_status = sell_pay_status;
	}
	public String getSell_pay_date() {
		return sell_pay_date;
	}
	public void setSell_pay_date(String sell_pay_date) {
		this.sell_pay_date = sell_pay_date;
	}

	@Override
	public String toString() {
		return "SellVO [sell_idx=" + sell_idx + ", rf_item_idx=" + rf_item_idx + ", sell_amount=" + sell_amount
				+ ", sell_item_total_price=" + sell_item_total_price + ", sell_use_coin=" + sell_use_coin
				+ ", sell_total_pay_price=" + sell_total_pay_price + ", sell_status=" + sell_status
				+ ", sell_shipping_fee=" + sell_shipping_fee + ", sell_postcode=" + sell_postcode + ", sell_address="
				+ sell_address + ", sell_phone=" + sell_phone + ", sell_receiver=" + sell_receiver + ", sell_date="
				+ sell_date + ", sell_pay_type=" + sell_pay_type + ", sell_pay_status=" + sell_pay_status
				+ ", sell_pay_date=" + sell_pay_date + "]";
	}
	
	
}
