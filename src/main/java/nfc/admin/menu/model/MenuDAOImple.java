package nfc.admin.menu.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.warehousing.model.ShopDTO;

public class MenuDAOImple implements MenuDAO {
	
	private SqlSessionTemplate sqlMap;

	public MenuDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<MenuDTO> menuList(int cp, int ls, int shop_idx) {

		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		
		List<MenuDTO> list=sqlMap.selectList("menuList", data);
		return list;
	}
	
	public int getTotalCnt() {
		
		int count=sqlMap.selectOne("menuTotalCnt");
		return count==0?1:count;
	}

	public int menuAdd(MenuDTO dto,int shop_idx) {
		Map data=new HashMap();
		data.put("dto", dto);
		data.put("shop_idx", shop_idx);
		int count=sqlMap.insert("menuAdd", data);
		return count;
	}

	public int menuDel(int idx) {

		int count=sqlMap.delete("menuDel", idx);
		return count;
	}

	public MenuDTO menuDetailList(int idx) {
		
		MenuDTO dto=sqlMap.selectOne("menuDetailList", idx);
		return dto;
	}

	public int menuUpdate(MenuDTO dto) {

		int count=sqlMap.update("menuUpdate", dto);
		return count;
	}

	public List<ShopDTO> shopList() {
		List<ShopDTO> list=sqlMap.selectList("menuShop");
		return list;
	}
}
