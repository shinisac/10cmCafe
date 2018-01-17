package nfc.balju.model;

public class MaterialDTO {
	private int material_idx;
	private String material_name;
	private String material_size;
	private int material_price;
	private int material_amount;
	
	public MaterialDTO() {
		super();
	}

	public MaterialDTO(int material_idx, String material_name, String material_size, int material_price) {
		super();
		this.material_idx = material_idx;
		this.material_name = material_name;
		this.material_size = material_size;
		this.material_price = material_price;
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
	
}
