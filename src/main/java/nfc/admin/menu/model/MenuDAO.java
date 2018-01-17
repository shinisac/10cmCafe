package nfc.admin.menu.model;

import java.util.*;

import nfc.warehousing.model.ShopDTO;

public interface MenuDAO {
	
	public List<MenuDTO> menuList(int cp,int ls,int shop_idx);
	
	public int getTotalCnt();
	
	public int menuAdd(MenuDTO dto,int shop_idx);
	
	public int menuDel(int idx);
	
	public MenuDTO menuDetailList(int idx);
	
	public int menuUpdate(MenuDTO dto);
	
	public List<ShopDTO> shopList();
}
