package nfc.shop.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nfc.admin.category.model.CategoryDTO;
import nfc.order.model.Order_menuDTO;

public interface ShopDAO {
	public List<ShopDTO> mapcode();
	public String shoparea(String addr); 
	public String shopjson(List<ShopDTO> arrs);
	public String lookshop(int idx);
	public String shopname(String name);
	public List<ShopDTO> shopcategory();
	public String menujson(List<MenuDTO> arrs);
	public List<MenuDTO> menuList(int idx);
	public MenuDTO menuContent(int menu_idx,int member_idx);
	public void cartIn(int idx,Order_menuDTO dto,HttpSession session,HttpServletResponse res);
	public String cartjson(int idx,HttpSession session, HttpServletResponse res);
	public String cartdel(int idx,Order_menuDTO dto,HttpSession session, HttpServletResponse res);
	public String cartamount(int idx, Order_menuDTO dto, HttpSession session, HttpServletResponse res);
	public int storeAdd(ShopDTO dto);
	public List<ShopDTO> adminshopList(int cp,int ls);
	public int adminshoptotalList();
	public ShopDTO shopContent(int idx);
	public int shopDel(int idx);
	public int shopupdate(ShopDTO dto);
	public CategoryDTO menuCategory(int idx);
	public List<MenuDTO> loadmenuList();
	public ArrayList<Order_menuDTO> loadCartList(HttpSession session,int idx);
	public ShopDTO shopnameFind(int shop_idx);
}
