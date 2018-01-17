package nfc.admin.menu.model;

public class MenuDTO {

	private int menu_idx;
	private int shop_idx;
	private int menu_turn;
	private String menu_name;
	private int menu_price;
	private String menu_img;
	private String menu_state;
	private int menu_category;
	private int menu_buy;
	
	public MenuDTO() {
		super();
	}

	public MenuDTO(int menu_idx, int shop_idx, int menu_turn, String menu_name, int menu_price, String menu_img,
			String menu_state, int menu_category, int menu_buy) {
		super();
		this.menu_idx = menu_idx;
		this.shop_idx = shop_idx;
		this.menu_turn = menu_turn;
		this.menu_name = menu_name;
		this.menu_price = menu_price;
		this.menu_img = menu_img;
		this.menu_state = menu_state;
		this.menu_category = menu_category;
		this.menu_buy = menu_buy;
	}

	public int getMenu_idx() {
		return menu_idx;
	}

	public void setMenu_idx(int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public int getMenu_turn() {
		return menu_turn;
	}

	public void setMenu_turn(int menu_turn) {
		this.menu_turn = menu_turn;
	}

	public String getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}

	public int getMenu_price() {
		return menu_price;
	}

	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenu_img() {
		return menu_img;
	}

	public void setMenu_img(String menu_img) {
		this.menu_img = menu_img;
	}

	public String getMenu_state() {
		return menu_state;
	}

	public void setMenu_state(String menu_state) {
		this.menu_state = menu_state;
	}

	public int getMenu_category() {
		return menu_category;
	}

	public void setMenu_category(int menu_category) {
		this.menu_category = menu_category;
	}

	public int getMenu_buy() {
		return menu_buy;
	}

	public void setMenu_buy(int menu_buy) {
		this.menu_buy = menu_buy;
	}

	
}
