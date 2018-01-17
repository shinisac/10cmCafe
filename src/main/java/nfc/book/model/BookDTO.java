package nfc.book.model;

import java.sql.Timestamp;

public class BookDTO {

	private int member_idx;
	private int shop_idx;
	private Timestamp book_date;
	
	//조인하려고 가져옴
	private String shop_name;
	private String shop_img;
	
	public BookDTO() {
		super();
	}

	public BookDTO(int member_idx, int shop_idx, Timestamp book_date, String shop_name) {
		super();
		this.member_idx = member_idx;
		this.shop_idx = shop_idx;
		this.book_date = book_date;
		this.shop_name = shop_name;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public Timestamp getBook_date() {
		return book_date;
	}

	public void setBook_date(Timestamp book_date) {
		this.book_date = book_date;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	public String getShop_img() {
		return shop_img;
	}

	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	
	
}
