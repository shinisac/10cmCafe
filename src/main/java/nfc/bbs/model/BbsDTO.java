package nfc.bbs.model;

import java.sql.*;

public class BbsDTO {

	private int review_idx;
	private int shop_idx;
	private int menu_idx;
	private String review_content;
	private String review_writer;
	private String review_subject;
	private int review_GPA;
	private Timestamp review_date;
	private String review_img;

	
	
	
	public BbsDTO() {
		super();
	}




	public BbsDTO(int review_idx, int shop_idx, int menu_idx, String review_content, String review_writer,
			String review_subject, int review_GPA, Timestamp review_date, String review_img) {
		super();
		this.review_idx = review_idx;
		this.shop_idx = shop_idx;
		this.menu_idx = menu_idx;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.review_subject = review_subject;
		this.review_GPA = review_GPA;
		this.review_date = review_date;
		this.review_img = review_img;
	}




	public int getReview_idx() {
		return review_idx;
	}




	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
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




	public String getReview_content() {
		return review_content;
	}




	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}




	public String getReview_writer() {
		return review_writer;
	}




	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}




	public String getReview_subject() {
		return review_subject;
	}




	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}




	public int getReview_GPA() {
		return review_GPA;
	}




	public void setReview_GPA(int review_GPA) {
		this.review_GPA = review_GPA;
	}




	public Timestamp getReview_date() {
		return review_date;
	}




	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}




	public String getReview_img() {
		return review_img;
	}




	public void setReview_img(String review_img) {
		this.review_img = review_img;
	}



	
	
	
	
	
	
}
