package nfc.order.model;

import java.sql.Timestamp;

public class Order_menuDTO {
	
	private int order_idx;
	private int shop_idx;
	private String order_state;
	private Timestamp order_date;
	private int order_menu_turn;
	private int order_menu_idx;
	private String order_menu_name;
	private int order_menu_amount;
	private int order_menu_price;
	private String order_menu_optiona;
	private String order_menu_optionb;
	private String order_menu_optionc;
	
	public Order_menuDTO() {
		super();
	}

	public Order_menuDTO(int order_idx, int shop_idx, String order_state, Timestamp order_date, int order_menu_turn,
			int order_menu_idx, String order_menu_name, int order_menu_amount, int order_menu_price,
			String order_menu_optiona, String order_menu_optionb, String order_menu_optionc) {
		super();
		this.order_idx = order_idx;
		this.shop_idx = shop_idx;
		this.order_state = order_state;
		this.order_date = order_date;
		this.order_menu_turn = order_menu_turn;
		this.order_menu_idx = order_menu_idx;
		this.order_menu_name = order_menu_name;
		this.order_menu_amount = order_menu_amount;
		this.order_menu_price = order_menu_price;
		this.order_menu_optiona = order_menu_optiona;
		this.order_menu_optionb = order_menu_optionb;
		this.order_menu_optionc = order_menu_optionc;
	}

	public int getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(int order_idx) {
		this.order_idx = order_idx;
	}

	public int getShop_idx() {
		return shop_idx;
	}

	public void setShop_idx(int shop_idx) {
		this.shop_idx = shop_idx;
	}

	public String getOrder_state() {
		return order_state;
	}

	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}

	public Timestamp getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}

	public int getOrder_menu_turn() {
		return order_menu_turn;
	}

	public void setOrder_menu_turn(int order_menu_turn) {
		this.order_menu_turn = order_menu_turn;
	}

	public int getOrder_menu_idx() {
		return order_menu_idx;
	}

	public void setOrder_menu_idx(int order_menu_idx) {
		this.order_menu_idx = order_menu_idx;
	}

	public String getOrder_menu_name() {
		return order_menu_name;
	}

	public void setOrder_menu_name(String order_menu_name) {
		this.order_menu_name = order_menu_name;
	}

	public int getOrder_menu_amount() {
		return order_menu_amount;
	}

	public void setOrder_menu_amount(int order_menu_amount) {
		this.order_menu_amount = order_menu_amount;
	}

	public int getOrder_menu_price() {
		return order_menu_price;
	}

	public void setOrder_menu_price(int order_menu_price) {
		this.order_menu_price = order_menu_price;
	}

	public String getOrder_menu_optiona() {
		return order_menu_optiona;
	}

	public void setOrder_menu_optiona(String order_menu_optiona) {
		this.order_menu_optiona = order_menu_optiona;
	}

	public String getOrder_menu_optionb() {
		return order_menu_optionb;
	}

	public void setOrder_menu_optionb(String order_menu_optionb) {
		this.order_menu_optionb = order_menu_optionb;
	}

	public String getOrder_menu_optionc() {
		return order_menu_optionc;
	}

	public void setOrder_menu_optionc(String order_menu_optionc) {
		this.order_menu_optionc = order_menu_optionc;
	}
	
	public Boolean chkdto(Order_menuDTO dto) {
		if(order_menu_idx==dto.getOrder_menu_idx()) {
				if(order_menu_optiona.equals(dto.getOrder_menu_optiona())) {
					if(order_menu_optionb.equals(dto.getOrder_menu_optionb())) {
						if(order_menu_optionc.equals(dto.getOrder_menu_optionc())) {
							return true;
						}
					}
				}
		}
		return false;
	}
}
