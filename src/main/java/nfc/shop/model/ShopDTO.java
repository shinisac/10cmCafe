package nfc.shop.model;

public class ShopDTO {

	private int shop_idx;
	private String shop_name;
	private String shop_area;
	private String shop_addr;
	private String shop_tel;
	private String shop_img;
	private Double shop_lat;
	private Double shop_lng;
	public ShopDTO() {
		super();
	}
	public ShopDTO(int shop_idx, String shop_name, String shop_area, String shop_addr, String shop_tel, String shop_img,
			Double shop_lat, Double shop_lng) {
		super();
		this.shop_idx = shop_idx;
		this.shop_name = shop_name;
		this.shop_area = shop_area;
		this.shop_addr = shop_addr;
		this.shop_tel = shop_tel;
		this.shop_img = shop_img;
		this.shop_lat = shop_lat;
		this.shop_lng = shop_lng;
	}
	public int getShop_idx() {
		return shop_idx;
	}
	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}
	public String getShop_name() {
		return shop_name;
	}
	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}
	public String getShop_area() {
		return shop_area;
	}
	public void setShop_area(String shop_area) {
		this.shop_area = shop_area;
	}
	public String getShop_addr() {
		return shop_addr;
	}
	public void setShop_addr(String shop_addr) {
		this.shop_addr = shop_addr;
	}
	public String getShop_tel() {
		return shop_tel;
	}
	public void setShop_tel(String shop_tel) {
		this.shop_tel = shop_tel;
	}
	public String getShop_img() {
		return shop_img;
	}
	public void setShop_img(String shop_img) {
		this.shop_img = shop_img;
	}
	public Double getShop_lat() {
		return shop_lat;
	}
	public void setShop_lat(Double shop_lat) {
		this.shop_lat = shop_lat;
	}
	public Double getShop_lng() {
		return shop_lng;
	}
	public void setShop_lng(Double shop_lng) {
		this.shop_lng = shop_lng;
	} 
	
}
