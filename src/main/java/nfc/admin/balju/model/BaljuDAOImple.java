package nfc.admin.balju.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.warehousing.model.ShopDTO;

public class BaljuDAOImple implements BaljuDAO {

	private SqlSessionTemplate sqlMap;

	public BaljuDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<nfc.warehousing.model.ShopDTO> shopList() {
		
		List<ShopDTO> list=sqlMap.selectList("adBaljuShop");
		return list;
	}

	public List<BaljuDTO> baljuList(int cp, int ls, int shop_idx) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		List<BaljuDTO> list=sqlMap.selectList("adBaljuList", data);
		return list;
	}

	public int getTotalCnt(int shop_idx) {
		int count=sqlMap.selectOne("adBaljuTotalCnt",shop_idx);
		return count==0?1:count;
	}
	
	public int getTotalCnt2(int shop_idx) {
		int count=sqlMap.selectOne("adBaljuTotalCnt2",shop_idx);
		return count==0?1:count;
	}

	public List<Balju_MaterialDTO> baljuContent(int balju_idx) {
		List<Balju_MaterialDTO> list=sqlMap.selectList("adBaljuContent", balju_idx);
		return list;
	}

	public int baljuOk(int balju_idx) {
		
		int count=sqlMap.update("adBaljuOk", balju_idx);
		return count;
	}
	
	public List<BaljuDTO> baljuList2(int cp, int ls, int shop_idx) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		List<BaljuDTO> list=sqlMap.selectList("adBaljuList2", data);
		return list;
	}

}
