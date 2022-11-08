package com.itwillbs.Code_Green.vo;

public class QnaVO {
	private int qna_idx;
	private int qna_item;
	private String qna_type;
	private String qna_category;
	private String qna_answer;
	private String qna_id;
	private String qna_pass;
	private String qna_subject;
	private String qna_content;
    private String qna_re_ref;
    private String qna_re_lev;
    private String qna_re_seq;
    private String qna_readcount;
    private String qna_date;
    private String item_idx; //상품번호
	public int getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}
	public int getQna_item() {
		return qna_item;
	}
	public void setQna_item(int qna_item) {
		this.qna_item = qna_item;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_category() {
		return qna_category;
	}
	public void setQna_category(String qna_category) {
		this.qna_category = qna_category;
	}
	public String getQna_answer() {
		return qna_answer;
	}
	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_re_ref() {
		return qna_re_ref;
	}
	public void setQna_re_ref(String qna_re_ref) {
		this.qna_re_ref = qna_re_ref;
	}
	public String getQna_re_lev() {
		return qna_re_lev;
	}
	public void setQna_re_lev(String qna_re_lev) {
		this.qna_re_lev = qna_re_lev;
	}
	public String getQna_re_seq() {
		return qna_re_seq;
	}
	public void setQna_re_seq(String qna_re_seq) {
		this.qna_re_seq = qna_re_seq;
	}
	public String getQna_readcount() {
		return qna_readcount;
	}
	public void setQna_readcount(String qna_readcount) {
		this.qna_readcount = qna_readcount;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public QnaVO() {
		// TODO Auto-generated constructor stub
	}
	public QnaVO(int qna_idx, int qna_item, String qna_type, String qna_category, String qna_answer, String qna_id,
			String qna_pass, String qna_subject, String qna_content, String qna_re_ref, String qna_re_lev,
			String qna_re_seq, String qna_readcount, String qna_date, String item_idx) {
		super();
		this.qna_idx = qna_idx;
		this.qna_item = qna_item;
		this.qna_type = qna_type;
		this.qna_category = qna_category;
		this.qna_answer = qna_answer;
		this.qna_id = qna_id;
		this.qna_pass = qna_pass;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_re_ref = qna_re_ref;
		this.qna_re_lev = qna_re_lev;
		this.qna_re_seq = qna_re_seq;
		this.qna_readcount = qna_readcount;
		this.qna_date = qna_date;
		this.item_idx = item_idx;
	}
	@Override
	public String toString() {
		return "QnaVO [qna_idx=" + qna_idx + ", qna_item=" + qna_item + ", qna_type=" + qna_type + ", qna_category="
				+ qna_category + ", qna_answer=" + qna_answer + ", qna_id=" + qna_id + ", qna_pass=" + qna_pass
				+ ", qna_subject=" + qna_subject + ", qna_content=" + qna_content + ", qna_re_ref=" + qna_re_ref
				+ ", qna_re_lev=" + qna_re_lev + ", qna_re_seq=" + qna_re_seq + ", qna_readcount=" + qna_readcount
				+ ", qna_date=" + qna_date + ", item_idx=" + item_idx + "]";
	}

    
    
    
    
    
} 