package nfc.admin.balju.model;

import java.util.List;

import nfc.warehousing.model.ShopDTO;

public interface BaljuDAO {
	public List<ShopDTO> shopList();
	
	public List<BaljuDTO> baljuList(int cp, int ls, int shop_idx);
	
	public List<BaljuDTO> baljuList2(int cp, int ls, int shop_idx);
	
	public int getTotalCnt(int shop_idx);
	public int getTotalCnt2(int shop_idx);
	
	public List<Balju_MaterialDTO> baljuContent(int balju_idx);
	
	public int baljuOk(int balju_idx);
}
