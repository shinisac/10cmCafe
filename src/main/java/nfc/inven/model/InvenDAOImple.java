package nfc.inven.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.warehousing.model.ShopDTO;


public class InvenDAOImple implements InvenDAO {

	private SqlSessionTemplate sqlMap;//리모컨
	
	public InvenDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<InvenDTO> invenList(int cp, int ls, int idx) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", idx);
		List<InvenDTO> list=sqlMap.selectList("invenList",data);
		return list;
	}
	
	public int getTotalCnt(int idx) {
		int count=sqlMap.selectOne("invenTotalCnt",idx);
		return count==0?1:count;
	}

	public InvenDTO invenDetail(int idx) {

		InvenDTO dto=sqlMap.selectOne("invenDetailList",idx);
		
		return dto;
	}

	public int invenUpdate(int idx, String level, int amount, String bigo, int shop_idx) {
		Map data=new HashMap();
		data.put("idx", idx);
		data.put("level", level);
		data.put("amount", amount);
		data.put("bigo", bigo);
		data.put("shop_idx", shop_idx);
		int result=sqlMap.update("invenUpdate",data);
		return result;
		
	}

	public List<ShopDTO> shopList(){
		List<ShopDTO> list=sqlMap.selectList("invenShop");
		return list;
	}

	public List<InvenDTO> search(String start, String end, int shop_idx) {
		// TODO Auto-generated method stub
	
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("shop_idx", shop_idx);
		
		List<InvenDTO> list=sqlMap.selectList("search",data);
		return list;
	}

}
