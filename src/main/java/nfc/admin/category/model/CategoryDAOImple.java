package nfc.admin.category.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


public class CategoryDAOImple implements CategoryDAO {

	private SqlSessionTemplate sqlMap;
	
	public CategoryDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public List<CategoryDTO> categoryList(int cp, int ls) {
		int startnum=(cp-1)*ls+1;
		int endnum=cp*ls;
		Map data=new HashMap();
		data.put("startnum", startnum);
		data.put("endnum", endnum);
		List<CategoryDTO> list = sqlMap.selectList("categoryList", data);
		
		return list;
	}

	public int getTotalCnt() {
		int count=sqlMap.selectOne("categoryTotalCnt");
		return count==0?1:count;
	}

	public int categoryDel(int idx) {
		int count=sqlMap.delete("categoryDelete", idx);
		return count;
	}

	public int categoryAdd(CategoryDTO dto) {
		
		int count=sqlMap.insert("categoryAdd",dto);
		
		return count;
	}

	public CategoryDTO categoryContent(int idx) {
		CategoryDTO dto=null;
		try {
			dto=sqlMap.selectOne("cateReWrite", idx);
		} catch (Exception e) {
			return null;
		}
		return dto;
	}

	public int categoryReWrite(CategoryDTO dto,int idx) {
		Map data=new HashMap();
		data.put("dto", dto);
		data.put("idx", idx);
		int count=sqlMap.update("cateReWriteOk",data);
		return count;
	}
	
	public List<CategoryDTO> cateMenu() {

		List<CategoryDTO> list=sqlMap.selectList("cateMenu");
		return list;
	}
}
