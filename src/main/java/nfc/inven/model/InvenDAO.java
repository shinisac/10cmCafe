package nfc.inven.model;

import java.util.*;

import nfc.warehousing.model.ShopDTO;

public interface InvenDAO {
	public List<InvenDTO> invenList(int cp, int ls, int idx);
	public InvenDTO invenDetail(int idx);
	public int getTotalCnt(int idx); 
	public int invenUpdate(int idx, String level, int amount, String bigo, int shop_idx);
	public List<ShopDTO> shopList();
	public List<InvenDTO> search(String start, String end, int shop_idx);
}
