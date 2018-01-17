package nfc.admin.category.model;

import java.util.List;

public interface CategoryDAO {
	public List<CategoryDTO> categoryList(int cp, int ls);
	public int getTotalCnt(); 
	public int categoryDel(int idx);
	public int categoryAdd(CategoryDTO dto);
	public CategoryDTO categoryContent(int idx);
	public int categoryReWrite(CategoryDTO dto, int idx);
	public List<CategoryDTO> cateMenu();
}
