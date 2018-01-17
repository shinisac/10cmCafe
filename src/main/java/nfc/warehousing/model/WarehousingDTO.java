package nfc.warehousing.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class WarehousingDTO {
	
	private int wh_idx;
	private int shop_idx;
	private int material_idx;
	private String material_name;
	private String material_size;
	private int material_price;
	private int material_amount;
	private String material_state;
	private Timestamp material_date;
	private String material_bigo;
	private int material_readnum;
	private int material_ref;
	private int material_lev;
	private int material_sunbun;
	
	public WarehousingDTO() {
		super();
	}

	public WarehousingDTO(int wh_idx, int shop_idx, int material_idx, String material_name, String material_size,
			int material_price, int material_amount, String material_state, Timestamp material_date,
			String material_bigo, int material_readnum, int material_ref, int material_lev, int material_sunbun) {
		super();
		this.wh_idx = wh_idx;
		this.shop_idx = shop_idx;
		this.material_idx = material_idx;
		this.material_name = material_name;
		this.material_size = material_size;
		this.material_price = material_price;
		this.material_amount = material_amount;
		this.material_state = material_state;
		this.material_date = material_date;
		this.material_bigo = material_bigo;
		this.material_readnum = material_readnum;
		this.material_ref = material_ref;
		this.material_lev = material_lev;
		this.material_sunbun = material_sunbun;
	}

	public int getWh_idx() {
		return wh_idx;
	}

	public void setWh_idx(int wh_idx) {
		this.wh_idx = wh_idx;
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

	public int getMaterial_readnum() {
		return material_readnum;
	}

	public void setMaterial_readnum(int material_readnum) {
		this.material_readnum = material_readnum;
	}

	public int getMaterial_ref() {
		return material_ref;
	}

	public void setMaterial_ref(int material_ref) {
		this.material_ref = material_ref;
	}

	public int getMaterial_lev() {
		return material_lev;
	}

	public void setMaterial_lev(int material_lev) {
		this.material_lev = material_lev;
	}

	public int getMaterial_sunbun() {
		return material_sunbun;
	}

	public void setMaterial_sunbun(int material_sunbun) {
		this.material_sunbun = material_sunbun;
	}
	
	
}
