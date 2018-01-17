package nfc.s_member.model;

public class s_memberDTO {
	private int shop_member_idx;
	private int shop_idx;
	private String shop_member_id;
	private String shop_member_pwd;
	
	public s_memberDTO() {
		super();
	}

	public s_memberDTO(int shop_member_idx, int shop_idx, String shop_member_id, String shop_member_pwd) {
		super();
		this.shop_member_idx = shop_member_idx;
		this.shop_idx = shop_idx;
		this.shop_member_id = shop_member_id;
		this.shop_member_pwd = shop_member_pwd;
	}

	public int getShop_member_idx() {
		return shop_member_idx;
	}

	public void setShop_member_idx(int shop_member_idx) {
		this.shop_member_idx = shop_member_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public String getShop_member_id() {
		return shop_member_id;
	}

	public void setShop_member_id(String shop_member_id) {
		this.shop_member_id = shop_member_id;
	}

	public String getShop_member_pwd() {
		return shop_member_pwd;
	}

	public void setShop_member_pwd(String shop_member_pwd) {
		this.shop_member_pwd = shop_member_pwd;
	}
	
	
}
