package nfc.balju.model;

import java.util.List;

import nfc.warehousing.model.ShopDTO;

public interface BaljuDAO {
	public List<ShopDTO> shopList();
	
	public ShopDTO baljuList(int idx);

	public List<MaterialDTO> materialList();
	
	public MaterialDTO chk_material(int idx);
	
	public int baljuAdd(int shop_idx);
	
	public int materialAdd(Balju_MaterialDTO dto);
	
	public List<BaljuDTO> baljuMainList(int cp, int ls, int shop_idx);

	public int getTotalCnt();
	
	public List<BaljuDTO> baljuSearch(String start, String end, int shop_idx);
	
	public List<MaterialDTO> baljuDetailList(int balju_idx);
	
}
