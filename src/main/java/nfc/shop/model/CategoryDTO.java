package nfc.shop.model;

public class CategoryDTO {
	private int category_idx;
	private int category_turn;
	private String category_name;
	private String category_img;
	public CategoryDTO() {
		super();
	}
	
	public CategoryDTO(int category_idx, int category_turn, String category_name, String category_img) {
		super();
		this.category_idx = category_idx;
		this.category_turn = category_turn;
		this.category_name = category_name;
		this.category_img = category_img;
	}

	public int getCategory_idx() {
		return category_idx;
	}
	public void setCategory_idx(int category_idx) {
		this.category_idx = category_idx;
	}
	public int getCategory_turn() {
		return category_turn;
	}
	public void setCategory_turn(int category_turn) {
		this.category_turn = category_turn;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_img() {
		return category_img;
	}
	public void setCategory_img(String category_img) {
		this.category_img = category_img;
	}
	
}
