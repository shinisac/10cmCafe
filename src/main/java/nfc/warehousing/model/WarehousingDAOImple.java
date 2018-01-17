package nfc.warehousing.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.inven.model.InvenDTO;

public class WarehousingDAOImple implements WarehousingDAO {

	private SqlSessionTemplate sqlMap;

	public WarehousingDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<WarehousingDTO> whList(int cp, int ls, int idx){
		
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", idx);
		
		List<WarehousingDTO> list=sqlMap.selectList("whList", data);
		return list;
	}
	
	public WarehousingDTO whContent(int idx) {
		
		WarehousingDTO dto=null;
		try {
			dto=sqlMap.selectOne("whContent", idx);
		}catch(Exception e){
			return null;
		}
		return dto;
	}
	
	public int getTotalCnt() {
		
		int count=sqlMap.selectOne("whTotalCnt");
		return count==0?1:count;
	}
	
	public int getRefMax() {
		int count=0;
		if(sqlMap.selectOne("getRefMax")!=null)
			count=sqlMap.selectOne("getRefMax");
		return count;
	}
	
	public List<ShopDTO> shopList(){
		List<ShopDTO> list=sqlMap.selectList("whShop");
		return list;
	}

	public List<WarehousingDTO> search(String start, String end, int shop_idx) {
		// TODO Auto-generated method stub
	
		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("shop_idx", shop_idx);
		
		List<WarehousingDTO> list=sqlMap.selectList("whSearch",data);
		return list;
	}
	
	public int whWrite(WarehousingDTO dto) {
		
		int count=sqlMap.insert("whWrite", dto);
		return count;
	}

	public WarehousingDTO whUpdate1(int wh_idx) {
		
		WarehousingDTO dto=sqlMap.selectOne("whUpdate1", wh_idx);
		return dto;
	}

	public int whUpdate2(WarehousingDTO dto) {
		
		int count=sqlMap.update("whUpdate2", dto);
		return count;
	}

	public int whDel(int wh_idx) {

		int count=sqlMap.delete("whDel", wh_idx);
		return count;
	}
}
