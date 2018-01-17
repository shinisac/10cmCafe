package nfc.book.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import nfc.member.model.MemberDTO;

public class BookDAOImple implements BookDAO {

	private SqlSessionTemplate sqlMap;

	public BookDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int bookMarkCheck(int member_idx, int shop_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		map.put("shop_idx", shop_idx);
		int check=sqlMap.selectOne("bookMarkCheck", map);
		return check;
	}
	
	
	
	public int bookMarkAdd(int member_idx, int shop_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		map.put("shop_idx", shop_idx);
		int result=sqlMap.insert("bookMarkAdd", map);
		return result;
	}

	public int bookMarkDel(int member_idx, int shop_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		map.put("shop_idx", shop_idx);
		int result=sqlMap.delete("bookMarkDel", map);
		return result;
	}

	//즐겨찾기 갯수 확인
	public int getMyBookMark(int member_idx) {
		int result=sqlMap.selectOne("getMyBookMark",member_idx);
		return result;
	}

	//즐겨찾기 매장 리스트
	public List<BookDTO> bookMark(int member_idx, int ls, int cp) {
	    int startnum=(cp-1)*ls+1;
	    int endnum=cp*ls;
	    
	    HashMap map=new HashMap();
	    map.put("startnum", startnum);
	    map.put("endnum", endnum);
	    map.put("member_idx", member_idx);
	    
		List<BookDTO> bookList=sqlMap.selectList("bookList",map);
		return bookList;
	}


	
}
