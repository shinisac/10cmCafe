package nfc.balju.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BaljuDTO {

	private int balju_idx;
	private int shop_idx;
	private Timestamp balju_date;
	private String balju_state;
	
	public BaljuDTO() {
		super();
	}

	public BaljuDTO(int balju_idx, int shop_idx, Timestamp balju_date, String balju_state) {
		super();
		this.balju_idx = balju_idx;
		this.shop_idx = shop_idx;
		this.balju_date = balju_date;
		this.balju_state = balju_state;
	}

	public int getBalju_idx() {
		return balju_idx;
	}

	public void setBalju_idx(int balju_idx) {
		this.balju_idx = balju_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public String getBalju_date() {
		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("YYYY/MM/dd HH:mm:ss");
        return sdfCurrent.format(balju_date);
	}

	public void setBalju_date(Timestamp balju_date) {
		this.balju_date = balju_date;
	}

	public String getBalju_state() {
		return balju_state;
	}

	public void setBalju_state(String balju_state) {
		this.balju_state = balju_state;
	}
	
}
