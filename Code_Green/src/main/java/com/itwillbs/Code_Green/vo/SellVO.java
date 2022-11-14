package com.itwillbs.Code_Green.vo;

public class SellVO {
	// 전체적인 주문 내역
	// 주문에 대한 상세는 SellDetailVO => 후에 만들 것
	
	private int sell_idx; // 주문 번호
	private int rf_member_idx; // 회원 번호
	private int fee_idx; // 배송비 번호
	private String sell_amount; // 주문 상품 구매 수량
	private String sell_total_price; // 주문 총 금액
	private String sell_use_coin; // 사용한 적립금
	private String sell_total_pay; // 결제할 금액
	private String sell_status; // 주문상태 ex)배송 준비중...? / default는?
	private String sell_postcode; // 받는 사람 우편번호
	private String sell_address;  // 받는 사람 주소
	private String sell_phone; // 받는 사람 연락처
	private String sell_receiver; // 받는 사람 이름
	private String sell_review_status; // 후기(리뷰) 상태 / default 'N'
	private String sell_date; // 주문일
	private String sell_payment; // 결제 정보 ex)카드
	private String sell_payment_num; // 결제 수단 번호 ?????????
	private String sell_payment_date; // 결제일
	
	public int getSell_idx() {
		return sell_idx;
	}
	public void setSell_idx(int sell_idx) {
		this.sell_idx = sell_idx;
	}
	public int getRf_member_idx() {
		return rf_member_idx;
	}
	public void setRf_member_idx(int rf_member_idx) {
		this.rf_member_idx = rf_member_idx;
	}
	public int getFee_idx() {
		return fee_idx;
	}
	public void setFee_idx(int fee_idx) {
		this.fee_idx = fee_idx;
	}
	public String getSell_amount() {
		return sell_amount;
	}
	public void setSell_amount(String sell_amount) {
		this.sell_amount = sell_amount;
	}
	public String getSell_total_price() {
		return sell_total_price;
	}
	public void setSell_total_price(String sell_total_price) {
		this.sell_total_price = sell_total_price;
	}
	public String getSell_use_coin() {
		return sell_use_coin;
	}
	public void setSell_use_coin(String sell_use_coin) {
		this.sell_use_coin = sell_use_coin;
	}
	public String getSell_total_pay() {
		return sell_total_pay;
	}
	public void setSell_total_pay(String sell_total_pay) {
		this.sell_total_pay = sell_total_pay;
	}
	public String getSell_status() {
		return sell_status;
	}
	public void setSell_status(String sell_status) {
		this.sell_status = sell_status;
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
	public String getSell_review_status() {
		return sell_review_status;
	}
	public void setSell_review_status(String sell_review_status) {
		this.sell_review_status = sell_review_status;
	}
	public String getSell_date() {
		return sell_date;
	}
	public void setSell_date(String sell_date) {
		this.sell_date = sell_date;
	}
	public String getSell_payment() {
		return sell_payment;
	}
	public void setSell_payment(String sell_payment) {
		this.sell_payment = sell_payment;
	}
	public String getSell_payment_num() {
		return sell_payment_num;
	}
	public void setSell_payment_num(String sell_payment_num) {
		this.sell_payment_num = sell_payment_num;
	}
	public String getSell_payment_date() {
		return sell_payment_date;
	}
	public void setSell_payment_date(String sell_payment_date) {
		this.sell_payment_date = sell_payment_date;
	}
	
	@Override
	public String toString() {
		return "SellVO [sell_idx=" + sell_idx + ", rf_member_idx=" + rf_member_idx + ", fee_idx=" + fee_idx
				+ ", sell_amount=" + sell_amount + ", sell_total_price=" + sell_total_price + ", sell_use_coin="
				+ sell_use_coin + ", sell_total_pay=" + sell_total_pay + ", sell_status=" + sell_status
				+ ", sell_postcode=" + sell_postcode + ", sell_address=" + sell_address + ", sell_phone=" + sell_phone
				+ ", sell_receiver=" + sell_receiver + ", sell_review_status=" + sell_review_status + ", sell_date="
				+ sell_date + ", sell_payment=" + sell_payment + ", sell_payment_num=" + sell_payment_num
				+ ", sell_payment_date=" + sell_payment_date + "]";
	}
	
	
	
}
