package nfc.order.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import nfc.shop.model.*;
import nfc.point.model.PointDTO;

public interface OrderDAO {
	public ArrayList<Order_menuDTO> orderpage(int idx,HttpSession session);
	public List<ShopDTO> lookshop(int idx);
	public int memberPoint(HttpSession session);
	public int orderinfo(PointDTO points,OrderDTO dto,HttpSession session);
	public List<OrderDTO> beforeOrderListForm(int member_idx);
	
	public List<ShopDTO> shopList();
	public List<OrderDTO> salesList(int cp,int ls,int shop_idx);
	public List<OrderDTO> salesTotalList(int cp,int ls);
	public int getTotalCnt();
	public int todayTotalPrice();
	public int todayTotalCount(); 
	public int todayPrice(int idx);
	public int todayCount(int idx);
	public List<OrderDTO> salesSearch(String start, String end, int shop_idx);
	public List<OrderDTO> salesTotalSearch(String start, String end);
	public MonthDTO monthPrice1(int shop_idx);
	public MonthDTO monthPrice2(int shop_idx);
	public MonthDTO monthPrice3(int shop_idx);
	public MonthDTO monthTotalPrice1();
	public MonthDTO monthTotalPrice2();
	public MonthDTO monthTotalPrice3();
	public nfc.warehousing.model.ShopDTO wshopName(int shop_idx);
	public OrderDTO salesTotalSearchPrice(String start, String end);
	public OrderDTO salesSearchPrice(String start, String end, int shop_idx);
}
