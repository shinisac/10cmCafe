package nfc.warehousing.model;

import java.util.*;

import nfc.inven.model.InvenDTO;

public interface WarehousingDAO {
	
	public List<WarehousingDTO> whList(int cp,int ls,int idx);
	public WarehousingDTO whContent(int idx);
	public int getTotalCnt();
	public int getRefMax();
	public List<WarehousingDTO> search(String start, String end, int shop_idx);
	public List<ShopDTO> shopList();
	public int whWrite(WarehousingDTO dto);
	public WarehousingDTO whUpdate1(int wh_idx);
	public int whUpdate2(WarehousingDTO dto);
	public int whDel(int wh_idx);
}
