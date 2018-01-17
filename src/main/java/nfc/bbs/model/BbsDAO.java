package nfc.bbs.model;

import java.util.*;
import nfc.shop.model.*;

public interface BbsDAO {
	
	public int bbsWrite(BbsDTO dto,int star);
	public List<BbsDTO> bbsList(int cp,int ls);
	public List<BbsDTO> bbsList2(int cp,int ls,int shop_idx);
	public BbsDTO bbsContent(int review_idx);
	public int getTotalCnt();
	public ShopDTO shopList(int shop_idx);
	public int bbsDel(int review_idx);
	public int bbsUpdate(int idx,BbsDTO dto,int star);
	public List<ShopDTO> bookList();
	public int bookmarkPage(ShopDTO dto);
	public List<BbsDTO> shopReview(int shop_idx);
}
