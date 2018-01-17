package nfc.book.model;

import java.util.List;

public interface BookMenuDAO {
	
	public int bookMarkMenuCheck(int member_idx,int menu_idx);
	public int bookMarkMenuAdd(int member_idx, int menu_idx);
	public int bookMarkMenuDel(int member_idx,int menu_idx);
	
	public int getMyBookMarkMenu(int member_idx);
	public List<BookMenuDTO> bookMarkMenu(int member_idx,int ls,int cp );
	public List<BookMenuDTO> bookMenuList(int member_idx);
}
