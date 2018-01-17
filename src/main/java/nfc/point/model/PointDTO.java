package nfc.point.model;

import java.sql.Timestamp;

public class PointDTO {

	private int point_idx;
	private int point_member;
	private int point_save;
	private int point_use;
	private Timestamp point_date;
	private int point_shop;
	private String point_event;
	
	//조인하려고 가져옴
	private String shop_name;
	
	public PointDTO() {
		super();
	}

	public PointDTO(int point_idx, int point_member, int point_save, int point_use, Timestamp point_date,
			int point_shop, String point_event) {
		super();
		this.point_idx = point_idx;
		this.point_member = point_member;
		this.point_save = point_save;
		this.point_use = point_use;
		this.point_date = point_date;
		this.point_shop = point_shop;
		this.point_event = point_event;
	}

	public int getPoint_idx() {
		return point_idx;
	}

	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}

	public int getPoint_member() {
		return point_member;
	}

	public void setPoint_member(int point_member) {
		this.point_member = point_member;
	}

	public int getPoint_save() {
		return point_save;
	}

	public void setPoint_save(int point_save) {
		this.point_save = point_save;
	}

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}

	public Timestamp getPoint_date() {
		return point_date;
	}

	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}

	public int getPoint_shop() {
		return point_shop;
	}

	public void setPoint_shop(int point_shop) {
		this.point_shop = point_shop;
	}

	public String getPoint_event() {
		return point_event;
	}

	public void setPoint_event(String point_event) {
		this.point_event = point_event;
	}

	public String getShop_name() {
		return shop_name;
	}

	public void setShop_name(String shop_name) {
		this.shop_name = shop_name;
	}

	
}
