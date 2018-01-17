package nfc.bbs.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import nfc.shop.model.*;

public class BbsDAOImple implements BbsDAO {

	private SqlSessionTemplate sqlMap;
	
	
	
	public BbsDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	public int bbsWrite(BbsDTO dto,int star) {
		Map data=new HashMap();
		data.put("dto", dto);
		data.put("star", star);
		int result=sqlMap.insert("bbsWrite", data);
		return result;
	}

	
	public List<BbsDTO> bbsList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<BbsDTO> list=sqlMap.selectList("bbsList",data);
		return list;
	}
	
	public List<BbsDTO> bbsList2(int cp, int ls, int shop_idx) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		data.put("shop_idx", shop_idx);
		List<BbsDTO> list=sqlMap.selectList("bbsList2",data);
		return list;
	}
	
	public BbsDTO bbsContent(int review_idx) {
		
		
		BbsDTO dto=null;
		try {
			dto=sqlMap.selectOne("bbsContent",review_idx); //1개 아닌 0개 또는 2개 이상이면 예외를 출력한다.
		}catch(Exception e) {
			return null;
		}
		
		//SelectList 로 가져오는 것을 권고하지만 데이터가 1개 인 것이 확실하면 사용가능하다.
		//예외는 직접처리 해주어야함
		
		return dto;
	}

	
	
	public int getTotalCnt() {
		int count=sqlMap.selectOne("bbsTotalCnt");
		return count==0?1:count;
	}



	public ShopDTO shopList(int shop_idx) {
		
		ShopDTO dto=sqlMap.selectOne("bbsShop", shop_idx);
		return dto;
	}


	public int bbsDel(int review_idx) {
		int count=sqlMap.delete("bbsDel", review_idx);
		return count;
	}


	public int bbsUpdate(int idx,BbsDTO dto,int star) {
		Map data=new HashMap();
		data.put("review_idx", idx);
		data.put("dto", dto);
		data.put("star", star);
		int result=sqlMap.update("bbsUpdate", data);
		return result;
	}
	
	public List<ShopDTO> bookList() {

		List<ShopDTO> list=sqlMap.selectList("bookPage");
		return list;
	}

	public int bookmarkPage(ShopDTO dto) {
		Map data=new HashMap();
		data.put("dto", dto);
		int result=sqlMap.update("bookmarkPage", dto);
		return result;
	}


	public List<BbsDTO> shopReview(int shop_idx) {
		
		List<BbsDTO> list=sqlMap.selectList("shopReview", shop_idx);
		
		return list;
	}
	

	
	
}
