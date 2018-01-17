package nfc.admin_member.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class Admin_memberDAOImple implements Admin_memberDAO {
	
	private SqlSessionTemplate sqlMap;

	public Admin_memberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	public int adminMemberLogin(String id, String pwd) {
		
		int result=0;
		String admin_member_pwd=sqlMap.selectOne("adminmemberSelect", id);
		try {
			if(admin_member_pwd.equals(pwd)){//비밀번호가 맞았을때
				result=1;
			}else{
				result=2;
			}
		} catch (Exception e) {
			return 3;
		}
		return result;
	}
}
