package nfc.s_member.model;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.mybatis.spring.SqlSessionTemplate;

public class s_memberDAOImple implements s_memberDAO {

	private SqlSessionTemplate sqlMap;//리모컨
	
	

	public s_memberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int memberLogin(int shop_idx,String id,String user_pwd) {
		Map data = new HashedMap();
		data.put("shop_member_id", id);
		data.put("shop_idx", shop_idx);
		int result=0;
		String pwd=sqlMap.selectOne("memberSelect", data);
		try {
			if(pwd.equals(user_pwd)){//비밀번호가 맞았을때
				result=1;
			}else{
				result=2;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return 3;
		}
		
		
		return result;
	}

	

	
}
