package nfc.balju.model;

import java.util.List;

public class Balju_MaterialDTO {
	private List<Balju_MaterialDTO> balju_list;
	private int balju_idx;
	private int material_idx;
	private String material_name;
	private int material_amount;
	private int material_price;
	private String material_size;
	
	
	public Balju_MaterialDTO() {
		super();
	}

	public Balju_MaterialDTO(int balju_idx, int material_idx, String material_name, int material_amount,
			int material_price, String material_size) {
		super();
		this.balju_idx = balju_idx;
		this.material_idx = material_idx;
		this.material_name = material_name;
		this.material_amount = material_amount;
		this.material_price = material_price;
		this.material_size = material_size;
	}

	public int getBalju_idx() {
		return balju_idx;
	}

	public void setBalju_idx(int balju_idx) {
		this.balju_idx = balju_idx;
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

	public int getMaterial_amount() {
		return material_amount;
	}

	public void setMaterial_amount(int material_amount) {
		this.material_amount = material_amount;
	}

	public int getMaterial_price() {
		return material_price;
	}

	public void setMaterial_price(int material_price) {
		this.material_price = material_price;
	}

	public String getMaterial_size() {
		return material_size;
	}

	public void setMaterial_size(String material_size) {
		this.material_size = material_size;
	}
	
	public List<Balju_MaterialDTO> getBalju_list() {
		return balju_list;
	}

	public void setBalju_list(List<Balju_MaterialDTO> balju_list) {
		this.balju_list = balju_list;
	}

	
	
}
