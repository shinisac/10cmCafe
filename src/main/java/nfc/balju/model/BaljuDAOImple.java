package nfc.balju.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.warehousing.model.ShopDTO;

import nfc.balju.model.BaljuDTO;;

public class BaljuDAOImple implements BaljuDAO {
	
	private SqlSessionTemplate sqlMap;

	public BaljuDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<nfc.warehousing.model.ShopDTO> shopList() {
		
		List<ShopDTO> list=sqlMap.selectList("baljuShop");
		return list;
	}


	public List<MaterialDTO> materialList() {
		List<MaterialDTO> list=sqlMap.selectList("materialList");
		return list;
	}

	public MaterialDTO chk_material(int idx) {
		MaterialDTO list=(MaterialDTO) sqlMap.selectOne("chk_material",idx);
		return list;
	}

	public int baljuAdd(int shop_idx) {
		int result=sqlMap.insert("baljuInsert",shop_idx);
		return result;
	}

	public int materialAdd(Balju_MaterialDTO dto) {
		int result=sqlMap.insert("materialInsert",dto);
		return result;
	}

	public ShopDTO baljuList(int idx) {
		ShopDTO dto=null;
		try {
			dto=sqlMap.selectOne("baljuList", idx);//selectOne의 특징은 무조건 1개가 나와야한다.그이상은 익셉션 발생
		} catch (Exception e) {
			return null;
		}
		return dto;
	}

public List<BaljuDTO> baljuMainList(int cp, int ls, int shop_idx) {
		
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		
		List<BaljuDTO> list=sqlMap.selectList("baljuMainList", data);
		return list;
	}
	
	public int getTotalCnt() {
		
		int count=sqlMap.selectOne("baljuTotalCnt");
		return count==0?1:count;
	}

	public List<BaljuDTO> baljuSearch(String start, String end, int shop_idx) {

		Map data=new HashMap();
		data.put("start", start);
		data.put("end", end);
		data.put("shop_idx", shop_idx);
		
		List<BaljuDTO> list=sqlMap.selectList("baljuSearch", data);
		return list;
	}

	public List<MaterialDTO> baljuDetailList(int balju_idx) {

		List<MaterialDTO> list=sqlMap.selectList("baljuDetailList", balju_idx);
		return list;
	}
}

