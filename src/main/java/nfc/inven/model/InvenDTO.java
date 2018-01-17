package nfc.inven.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class InvenDTO {
	private int jego_idx;
	private int shop_idx;
	private int material_idx;//재료번호
	private String material_name;//재료이름
	private String material_size;//재료사이즈
	private int material_price;//재료가격
	private int material_amount;//재료수량
	private String material_state;//재료상태
	private Timestamp material_date;//입고날짜
	private String material_bigo;

	
	public InvenDTO() {
		super();
	}

	public InvenDTO(int jego_idx, int shop_idx, int material_idx, String material_name, String material_size,
			int material_price, int material_amount, String material_state, Timestamp material_date,
			String material_bigo) {
		super();
		this.jego_idx = jego_idx;
		this.shop_idx = shop_idx;
		this.material_idx = material_idx;
		this.material_name = material_name;
		this.material_size = material_size;
		this.material_price = material_price;
		this.material_amount = material_amount;
		this.material_state = material_state;
		this.material_date = material_date;
		this.material_bigo = material_bigo;
	}

	public int getJego_idx() {
		return jego_idx;
	}

	public void setJego_idx(int jego_idx) {
		this.jego_idx = jego_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public int getMaterial_idx() {
		return material_idx;
	}

	public void setMaterial_idx(int material_idx) {
		this.material_idx = material_idx;
	}

	public String getMaterial_name() {
		return material_name;
	}

	public void setMaterial_name(String material_name) {
		this.material_name = material_name;
	}

	public String getMaterial_size() {
		return material_size;
	}

	public void setMaterial_size(String material_size) {
		this.material_size = material_size;
	}

	public int getMaterial_price() {
		return material_price;
	}

	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}

	public int getMaterial_amount() {
		return material_amount;
	}

	public void setMaterial_amount(int material_amount) {
		this.material_amount = material_amount;
	}

	public String getMaterial_state() {
		return material_state;
	}

	public void setMaterial_state(String material_state) {
		this.material_state = material_state;
	}

	public String getMaterial_date() {
		SimpleDateFormat sdfCurrent = new SimpleDateFormat ("YYYY/MM/dd HH:mm:ss");
        return sdfCurrent.format(material_date);
	}

	public void setMaterial_date(Timestamp material_date) {
		this.material_date = material_date;
	}

	public String getMaterial_bigo() {
		return material_bigo;
	}

	public void setMaterial_bigo(String material_bigo) {
		this.material_bigo = material_bigo;
	}

	
}
