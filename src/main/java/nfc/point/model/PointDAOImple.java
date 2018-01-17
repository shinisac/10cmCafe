package nfc.point.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class PointDAOImple implements PointDAO {

   private SqlSessionTemplate sqlMap;
   
   public PointDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }

   //포인트 내역관련
   public List<PointDTO> myPoint(int idx,int ls,int cp) {
      
       int startnum=(cp-1)*ls+1;
       int endnum=cp*ls;
       HashMap map=new HashMap();
       map.put("startnum", startnum);
       map.put("endnum", endnum);
       map.put("idx", idx);
      List<PointDTO> dto=sqlMap.selectList("myPoint", map);

      return dto;
      
   }
   
   //포인트 적립관련 업데이트
   public int savePoint(String email,int savePoint) {
      HashMap map=new HashMap();
      map.put("member_email",email);
      map.put("savePoint", savePoint);
      int count=sqlMap.update("savePoint",map);
      return count;
   }
   //포인트 사용관련 업데이트
   public int usePoint(String email, int usePoint) {
      HashMap map=new HashMap();
      map.put("member_email",email);
      map.put("usePoint", usePoint);
      int count=sqlMap.update("usePoint",map);
      return count;
      
   }
   public int getPoint(int idx) {
      int count=sqlMap.selectOne("getPoint",idx);
      return count;
   }

   public int getMyPointTotal(int idx) {
      int count=sqlMap.selectOne("getMyPointTotal",idx);
      return count;
   }

}