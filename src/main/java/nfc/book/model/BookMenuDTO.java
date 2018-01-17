package nfc.book.model;

import java.sql.Timestamp;

public class BookMenuDTO {

	private int member_idx;
	private int shop_idx;
	private int menu_idx;
	private Timestamp book_date;
	
	//조인하려고 가져옴
	private String menu_name;
	private int menu_price;
	private String menu_img;
	public BookMenuDTO() {
		super();
	}
	public BookMenuDTO(int member_idx, int shop_idx, int menu_idx, Timestamp book_date, String menu_name,
			int menu_price) {
		super();
		this.member_idx = member_idx;
		this.shop_idx = shop_idx;
		this.menu_idx = menu_idx;
		this.book_date = book_date;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
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
	public int getMenu_idx() {
		return menu_idx;
	}
	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}
	public Timestamp getBook_date() {
		return book_date;
	}
	public void setBook_date(Timestamp book_date) {
		this.book_date = book_date;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public String getMenu_img() {
		return menu_img;
	}
	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}
	
}
