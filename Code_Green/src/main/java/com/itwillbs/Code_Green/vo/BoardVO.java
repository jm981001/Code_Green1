package com.itwillbs.Code_Green.vo;

public class BoardVO {

	private int board_idx;
	private int board_item_idx; //상품번호 (없으면 N)
	private String board_type; //게시판 타입 (커뮤, 후기)
	private String board_id; //아이디
	private String board_category; //말머리
	private String board_subject; //제목
	private String board_content; //내용
	private String board_readcount; //조회수
	private String board_date; //날짜
	private String item_idx; //상품번호
	private String member_id; 
	private String file1;
	private String file2;
	private String file3;
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getBoard_item_idx() {
		return board_item_idx;
	}
	public void setBoard_item_idx(int board_item_idx) {
		this.board_item_idx = board_item_idx;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getBoard_category() {
		return board_category;
	}
	public void setBoard_category(String board_category) {
		this.board_category = board_category;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(String board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}
	public String getItem_idx() {
		return item_idx;
	}
	public void setItem_idx(String item_idx) {
		this.item_idx = item_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
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
	
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
	}
	public BoardVO() {
		// TODO Auto-generated constructor stub
	}
	public BoardVO(int board_idx, int board_item_idx, String board_type, String board_id, String board_category,
			String board_subject, String board_content, String board_readcount, String board_date, String item_idx,
			String member_id, String file1, String file2) {
		super();
		this.board_idx = board_idx;
		this.board_item_idx = board_item_idx;
		this.board_type = board_type;
		this.board_id = board_id;
		this.board_category = board_category;
		this.board_subject = board_subject;
		this.board_content = board_content;
		this.board_readcount = board_readcount;
		this.board_date = board_date;
		this.item_idx = item_idx;
		this.member_id = member_id;
		this.file1 = file1;
		this.file2 = file2;
	}
	@Override
	public String toString() {
		return "BoardVO [board_idx=" + board_idx + ", board_item_idx=" + board_item_idx + ", board_type=" + board_type
				+ ", board_id=" + board_id + ", board_category=" + board_category + ", board_subject=" + board_subject
				+ ", board_content=" + board_content + ", board_readcount=" + board_readcount + ", board_date="
				+ board_date + ", item_idx=" + item_idx + ", member_id=" + member_id + ", file1=" + file1 + ", file2="
				+ file2 + "]";
	}
	
	
	
}
