package nfc.member.model;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import org.apache.commons.mail.HtmlEmail;
import org.mybatis.spring.SqlSessionTemplate;
public class MemberDAOImple implements MemberDAO {
   
   private SqlSessionTemplate sqlMap;
   public MemberDAOImple(SqlSessionTemplate sqlMap) {
      super();
      this.sqlMap = sqlMap;
   }

      //이메일 인증용 8자리 랜덤한 KEY값 생성
      public String mailNumber() {
         String key = "";
         Random rd = new Random();

         for (int i = 0; i < 8; i++) {
            key += rd.nextInt(10);
         }
         return key;
      }
      //이메일 인증관련 메서드
      public String Emailtest(String member_email,String member_key) {
         // Mail Server 설정
               String charSet = "utf-8";
               String hostSMTP = "smtp.naver.com";      
               String hostSMTPid = "hiruis@naver.com"; // 본인의 아이디 입력      
               String hostSMTPpwd = "tm1q2w3e$R"; // 비밀번호 입력
               
               // 보내는 사람 EMail, 제목, 내용 
               String fromEmail = "hiruis@naver.com"; // 보내는 사람 eamil
               String fromName = "hiruis";  // 보내는 사람 이름
               String subject = "[CAFE 10cm] 가입 인증 메일 발송"; // 제목
               
               // 받는 사람 E-Mail 주소
               String mail = member_email;  // 받는 사람 email      
               
               String msg = "";
               try {
                  HtmlEmail email = new HtmlEmail();
                  email.setDebug(true);
                  email.setCharset(charSet);
                  email.setSSL(true);
                  email.setHostName(hostSMTP);
                  email.setSmtpPort(587);   // SMTP 포트 번호 입력

                  email.setAuthentication(hostSMTPid, hostSMTPpwd);
                  email.setTLS(true);
                  email.addTo(mail, "E-mail 인증",charSet);
                  email.setFrom(fromEmail, fromName, charSet);
                  email.setSubject(subject);
                  
                    msg+="<div>";  
                    msg+="<table align='center'>";  
                    msg+="<tr>";  
                    msg+="<td colspan='2'>";  
                    msg+="</td>";  
                    msg+="</tr>";  
                    msg+="<tr>";  
                    msg+="<td align='center'>";  
                    msg+="<img src='http://localhost:9090/nfc/img/email-logo.jpg' width='150' height='150'>";  
                    msg+="</td>"; 
                    msg+="</tr>";
                    msg+="<tr>"; 
                    msg+="<td align='center'>";  
                    msg+=" -10CM의 혁명-을 이용해 주셔셔 감사합니다.<br>";
                    msg+="  메일 인증이 완료 될수 있도록 아래 버튼을 눌러주세요.<br>"; 
                    msg+="</td>";                    
                    msg+="</tr>";     
                    msg+="<tr>";  
                    msg+="<td colspan='2'>";     
                    msg+="</td>";  
                    msg+="</tr>";  
                    msg+="<tr>";
                    msg+="<td align='center'>";
                    msg+="<a href='localhost:9090/nfc/emailStatus.do?param="+member_key+"' target='_blank'>메일 인증하기</a>";  
                         
                    msg+="</td>";  
                    msg+="</tr>";              
                    msg+="</table>";  
                    msg+="</div>";  
                   // 본문 내용
                  email.setHtmlMsg(msg);
            
                  email.send();         
               } catch (Exception e) {
                  System.out.println(e);
               }
               return "test/email";
      }
   


   


   public int memberJoin(MemberDTO dto) {
      dto.setMember_key(mailNumber());
      Emailtest(dto.getMember_email(),dto.getMember_key());
      int count=sqlMap.insert("memberAdd", dto);
      
      return count;
   }


   public int emailCheck(String member_email) {
      int check=sqlMap.selectOne("emailCheck", member_email);
      
      return check;
   }

      //이메일 인증 체크관련 메서드
      public int mailChk(String keys) {
         int count = sqlMap.selectOne("emailStatus", keys); 
         if(count>0) {
            sqlMap.update("checkJoin",keys);
         }
         return count;
      }
   public int phoneCheck(String member_phone) {
      int check=sqlMap.selectOne("phoneCheck", member_phone);
      return check;
   }
   public int loginOk(String member_email, String member_pwd) {

      HashMap map=new HashMap();
      map.put("member_email", member_email);
      map.put("member_pwd", member_pwd);
      
      int check=sqlMap.selectOne("loginOk",map);
      return check;
   }
   public int loginOk2(String member_email, String member_pwd) {
      HashMap map=new HashMap();
      map.put("member_email", member_email);
      map.put("member_pwd", member_pwd);
      int count=sqlMap.selectOne("loginOk2",map);
      return count;
   }
   public MemberDTO idFind(String name,String phone){
      HashMap map=new HashMap();
      map.put("member_name", name);
      map.put("member_phone", phone);

      MemberDTO dto=sqlMap.selectOne("idFind",map);
      return dto;
   }
   public MemberDTO pwdCheck(String name, String email) {
      HashMap map=new HashMap();
      map.put("member_name", name);
      map.put("member_email", email);
      MemberDTO dto=sqlMap.selectOne("pwdCheck",map);
      return dto;
      
   }
   public int pwdChange(String member_email, String member_pwd) {
      HashMap map=new HashMap();
      map.put("member_email", member_email);
      map.put("member_pwd", member_pwd);
      int count=sqlMap.update("pwdChange", map);
      return count;

   }
   //마이페이지 관련 메서드
   public MemberDTO myPage(String member_email) {
      MemberDTO dto=sqlMap.selectOne("myPage", member_email);
      return dto;
   }
   //회원 탈퇴관련 메서드
   public int memberOut(String member_email) {
      int count=sqlMap.update("memberOut", member_email);
      return count;
   }
   
   //관리자에서 회원목록 리스트 관련 메서드
   public List<MemberDTO> admin_memberList(int ls,int cp) {
       int startnum=(cp-1)*ls+1;
       int endnum=cp*ls;
       HashMap map=new HashMap();
       map.put("startnum", startnum);
       map.put("endnum", endnum);
      List<MemberDTO> allList=sqlMap.selectList("admin_memberList",map);
      return allList;
      
   }
   //관리자 회원검색 관련 메서드
   public List<MemberDTO> admin_memberFind(String searchsel,String keyword,int ls,int cp) {
       int startnum=(cp-1)*ls+1;
       int endnum=cp*ls;
      
      
       HashMap map=new HashMap();
      map.put("sel", searchsel);
      map.put("keyword", keyword);
      map.put("startnum", startnum);
      map.put("endnum",endnum);
      List<MemberDTO> findList=sqlMap.selectList("admin_memberFind", map);
      return findList;
   }
   //관리자 탈퇴회원 목록
   public List<MemberDTO> memberOutList(int ls,int cp) {
       int startnum=(cp-1)*ls+1;
       int endnum=cp*ls;
       HashMap map=new HashMap();
       map.put("startnum", startnum);
       map.put("endnum", endnum);
      List<MemberDTO> OutList=sqlMap.selectList("memberOutList",map);
      return OutList;
   }
   public List<MemberDTO> admin_memberOutFind(String searchsel, String keyword,int ls,int cp) {
         int startnum=(cp-1)*ls+1;
         int endnum=cp*ls;
       HashMap map=new HashMap();
      map.put("sel", searchsel);
      map.put("keyword", keyword);
      map.put("startnum", startnum);
      map.put("endnum",endnum);
      List<MemberDTO> findOutList=sqlMap.selectList("admin_memberOutFind", map);
      return findOutList;
   }
   public MemberDTO member_info(int idx) {
      MemberDTO info=sqlMap.selectOne("member_info", idx);
      return info;
   }
   public int memberIdx(String member_email) {
      int count=sqlMap.selectOne("memberIdx",member_email);
      return count;
   }
   public int member_PointGive(int point, int idx) {
      HashMap map=new HashMap();
      map.put("point", point);
      map.put("idx", idx);
      
      int count=sqlMap.update("member_PointGive",map);
      return count;
   }
   public int member_pointUpdate(int point, int idx,String point_content) {
      HashMap map=new HashMap();
      map.put("point", point);
      map.put("idx", idx);
      map.put("point_content", point_content);
      int count=sqlMap.insert("member_pointUpdate",map);
      return count;
   }
   //토탈회원 리스트 수
   public int getMemberTotal() {
      int count=sqlMap.selectOne("getMemberTotal");
      
      return count==0?1:count;
   }
   //검색회원 리스트 수
   public int getMemberFindTotal(String sel,String keyword) {
      HashMap map=new HashMap();
      
      
      if(sel.equals("member_date")) {
         

            map.put("keyword",keyword);
            System.out.println(keyword);
         
         
      }else {
         map.put("keyword",keyword);
      }
      
      map.put("sel", sel);
      
      int count=sqlMap.selectOne("getMemberFindTotal",map);
      return count==0?1:count;
   }
   
   public int getMemberOutTotal() {
      int count=sqlMap.selectOne("getMemberOutTotal");
      return count==0?1:count;
   }
   public int getMemberOutFindTotal(String sel,String keyword) {
      HashMap map=new HashMap();
      map.put("sel", sel);
      map.put("keyword",keyword);
      int count=sqlMap.selectOne("getMemberOutFindTotal",map);
      return count==0?1:count;
   }
   public List<MemberDTO> getMemberIdxTotal() {
      List<MemberDTO> dto=sqlMap.selectList("getMemberIdxTotal");
      return dto;
   }
   //암호화된 패스워드 가져오기
   public String getPwd(String member_email) {
      String pwd=sqlMap.selectOne("getPwd",member_email);
      return pwd;
   }

   public int admin_memberDel(int member_idx) {
      int result=sqlMap.delete("admin_memberDel", member_idx);
      return result;
   }
}