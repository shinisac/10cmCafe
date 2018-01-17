package nfc.book.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class BookMenuDAOImple implements BookMenuDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public BookMenuDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int bookMarkMenuCheck(int member_idx, int menu_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		
		map.put("menu_idx", menu_idx);
		
		int check=sqlMap.selectOne("bookMarkMenuCheck", map);
		return check;
	}

	public int bookMarkMenuAdd(int member_idx,  int menu_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		
		map.put("menu_idx", menu_idx);
		int result=sqlMap.insert("bookMarkMenuAdd", map);
		return result;
	}

	public int bookMarkMenuDel(int member_idx,  int menu_idx) {
		HashMap map=new HashMap();
		map.put("member_idx", member_idx);
		//map.put("shop_idx", shop_idx);
		map.put("menu_idx", menu_idx);
		int result=sqlMap.delete("bookMarkMenuDel", map);
		return result;
	}
	//즐겨찾기  메뉴갯수 확인
	public int getMyBookMarkMenu(int member_idx) {
		int result=sqlMap.selectOne("getMyBookMarkMenu",member_idx);
		return result;
	}
	//즐겨찾기 매장메뉴 리스트
	public List<BookMenuDTO> bookMarkMenu(int member_idx, int ls, int cp) {
	    int startnum=(cp-1)*ls+1;
	    int endnum=cp*ls;
	    
	    HashMap map=new HashMap();
	    map.put("startnum", startnum);
	    map.put("endnum", endnum);
	    map.put("member_idx", member_idx);
	    
		List<BookMenuDTO> bookList=sqlMap.selectList("bookMarkMenu",map);
		return bookList;
	}

	public List<BookMenuDTO> bookMenuList(int member_idx) {
		List<BookMenuDTO> bookList=sqlMap.selectList("bookMenuList",member_idx);
		return bookList;
	}

	
}
