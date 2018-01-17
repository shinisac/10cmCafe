package nfc.ordermenu.model;

import java.util.List;

import nfc.order.model.OrderDTO;
import nfc.warehousing.model.ShopDTO;

public interface OrderMenuDAO {
	
	public List<ShopDTO> shopList();
	public List<OrderMenuDTO> orderList(int idx);
	public List<OrderMenuDTO> detailList(int idx);
	public int reserveOk(int idx, int shop_idx);
	public int orderOk(int idx, int shop_idx);
	public int orderDel(int idx, int shop_idx);
}
