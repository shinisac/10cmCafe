package nfc.book.model;

import java.util.List;

public interface BookDAO {
	
	//북마크 검증
	public int bookMarkCheck(int member_idx,int shop_idx);
	
	public int bookMarkAdd(int member_idx,int shop_idx);
	public int bookMarkDel(int member_idx,int shop_idx);
	public int getMyBookMark(int member_idx);
	public List<BookDTO> bookMark(int member_idx,int ls,int cp );
}
