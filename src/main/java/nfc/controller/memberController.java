package nfc.controller;


import java.util.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.member.model.MemberDAO;
import nfc.member.model.MemberDTO;
import nfc.order.model.OrderDAO;
import nfc.order.model.OrderDTO;
import nfc.point.model.PointDAO;
import nfc.point.model.PointDTO;


@Controller
public class memberController {

   @Autowired
   private MemberDAO memberDao;
   @Autowired
   private PointDAO pointDao;
   @Autowired
   private OrderDAO orderDao;

   
   @RequestMapping("/joinForm.do")
   public String joinForm() {

      return "member/joinForm";
   }

   @RequestMapping(value = "joinOk.do", method = RequestMethod.POST)
   public ModelAndView joinOk(MemberDTO dto) {
      
      ModelAndView mav = new ModelAndView();
      int count1=memberDao.emailCheck(dto.getMember_email());
      if(count1>0) {
      mav.addObject("page","joinForm.do");
      mav.addObject("msg","이미 사용중인 아이디 입니다");
      mav.setViewName("member/memberMsg");
      return mav;
      }
         
      
     String hashPassword = BCrypt.hashpw(dto.getMember_pwd(), BCrypt.gensalt());
     dto.setMember_pwd(hashPassword);

       
      
      int count = memberDao.memberJoin(dto);
      String msg = count > 0 ? "이메일 인증대기상태 입니다." : "가입 실패";
      mav.addObject("msg", msg);
      mav.addObject("page", "index.do");
      mav.setViewName("member/memberMsg");
      return mav;
   }

   @RequestMapping(value = "/emailCheckOk.do")
   public ModelAndView idCheck(@RequestParam(value = "email") String member_email) {
      
      ModelAndView mav = new ModelAndView();
      int result = memberDao.emailCheck(member_email);

      String msg = "";
      String key = "";
      if (result == 0) {
         msg = member_email + "는 사용할수 있습니다";
         // key=dto.getId();

      } else {
         msg = member_email + "는 이미 사용중입니다";
         // key=dto.getId();
      }
      mav.addObject("result", result);
      mav.addObject("msg", msg);
      // mav.addObject("key",key);
      mav.setViewName("member/emailCheckOk");
      return mav;

   }

   @RequestMapping("/loginForm.do")
   public ModelAndView loginForm(@RequestParam(value="type",defaultValue="0")int type,@RequestParam(value="shop",defaultValue="0")int idx) {
      ModelAndView mav=new ModelAndView();
      mav.addObject("shop",idx);   
      mav.addObject("type",type);
      
  
      mav.setViewName("member/loginForm");
      
     
      return mav;
   }

   @RequestMapping(value = "/emailStatus.do", method = RequestMethod.GET)
   public ModelAndView mailCheck(@RequestParam("param") String keys) {
      int result = memberDao.mailChk(keys);
      String msg = result > 0 ? "E-mail 인증이 완료되었습니다." : "이미 인증되었습니다.";
      ModelAndView mav = new ModelAndView();
      mav.addObject("msg", msg);
      mav.setViewName("/member/emailStatus");
      return mav;
   }
   
   @RequestMapping(value ="/phoneCheck.do",method = RequestMethod.POST)
   public ModelAndView phoneCheck(@RequestParam("phone")String member_phone) {
      ModelAndView mav = new ModelAndView();
      int result = memberDao.phoneCheck(member_phone);
      String msg = "";
      String key = "";
      if (result == 0) {
         msg = member_phone + "<font color=blue>는 사용할수 있습니다</font>";
         // key=dto.getId();

      } else {
         msg = member_phone + "<font color=red>는 이미 사용중입니다</font>";
         // key=dto.getId();
      }
      mav.addObject("result", result);
      mav.addObject("msg", msg);
      // mav.addObject("key",key);
      mav.setViewName("member/emailCheckOk");
      return mav;
   }
   
   //로그인 관련
   @RequestMapping(value="/loginOk.do" ,method = RequestMethod.POST)
   public ModelAndView loginOk(String member_email,String member_pwd,String checkid,HttpSession session,HttpServletRequest req,HttpServletResponse resp,@RequestParam(value="type",defaultValue="0")int type,@RequestParam(value="shop",defaultValue="0")int idx2) {
      ModelAndView mav=new ModelAndView();
      String msg = "";
      String page="";
      
      
      
      //아이디 없을때 체크하는 문장 확인시켜줘야함
      
      
      
     String pwd=memberDao.getPwd(member_email);
     if(pwd==null||pwd.equals("")) {
        if(type==1) {
         mav.addObject("msg", "이메일 혹은 비밀번호가 틀립니다");
         mav.addObject("page", "loginForm.do?shop="+idx2+"&type="+type);
         mav.setViewName("member/memberMsg");
         return mav;    
        }else {
         mav.addObject("msg", "이메일 혹은 비밀번호가 틀립니다");
         mav.addObject("page", "loginForm.do");
         mav.setViewName("member/memberMsg");
         return mav;
        }
     }
     boolean isValidPassword = BCrypt.checkpw(member_pwd, pwd);
  
     
     if(isValidPassword) {
      int result=memberDao.loginOk(member_email,pwd);
      int result2=memberDao.loginOk2(member_email, pwd);
  
    
      if(result>0) {
       
         if(result2>0) {
             if(type==1) {
               
                 
                 mav.addObject("msg", "주문 로그인완료");
                 mav.addObject("page", "shop_menuList.do?shop="+idx2);
                 mav.addObject("type",type);
                
                 mav.addObject("shop",idx2);   
                 mav.setViewName("member/memberMsg");
                 session.setAttribute("id", member_email);
                 int idx=memberDao.memberIdx(member_email);
                 session.setAttribute("member_idx", idx);
                 return mav;
              }
         //세션 저장
         session.setAttribute("id", member_email);
         int idx=memberDao.memberIdx(member_email);
         session.setAttribute("member_idx", idx);
         
         msg = "로그인 완료";
         page="index.do";
         if(checkid==null||checkid.equals("")) {
            
            Cookie cookie=new Cookie("sid", member_email);
            cookie.setMaxAge(0);
            resp.addCookie(cookie);
            
            
            }else {

            Cookie cookie=new Cookie("sid", member_email);
            cookie.setMaxAge(60*60*60);
            resp.addCookie(cookie);
            
            }
         }else {
            msg="이메일 인증을 완료하여주십시요";
            page="index.do";
         }
      }
     }else {
        if(type==1) {
              msg="이메일 혹은 비밀번호가 틀립니다";
              page="loginForm.do?shop="+idx2+"&type="+type;
        }else {
  
           
         msg="이메일 혹은 비밀번호가 틀립니다";
         page="loginForm.do";
        }
      }   
    

      mav.addObject("msg", msg);
      mav.addObject("page", page);
      mav.setViewName("member/memberMsg");
      return mav;
     
   }
   
   //로그아웃관련 
   @RequestMapping(value="logout.do",method=RequestMethod.GET)
   public ModelAndView logOut(HttpSession session) {
      ModelAndView mav=new ModelAndView();
      session.invalidate();
      //String msg="로그아웃 되었습니다";
      //mav.addObject("msg", msg);
      //mav.setViewName("member/logOutOk");
      mav.setViewName("redirect:/index.do");
      return mav;
      
   }
   @RequestMapping("/idFindForm.do")
   public String idFindForm() {
      return "member/idFindForm";
   }
   
   @RequestMapping("/idFind.do")
   public ModelAndView idFind(@RequestParam("name")String name,@RequestParam("phone")String phone) {
      
      
      ModelAndView mav=new ModelAndView();
      String msg = "";

      MemberDTO dto=memberDao.idFind(name,phone);

      if(dto==null){
         msg=" <font color=red>일치하는 아이디가 없습니다.</font>";
      
      }else {
         
         msg="<font color=blue>찾으시려는 이메일주소는</font>"+dto.getMember_email()+"입니다";
         //mav.setViewName("member/idFindOkMsg");
         //return mav;
      }
      mav.addObject("msg",msg);
      mav.setViewName("member/idFindOkMsg");
      return mav;
   }
   @RequestMapping("/pwdFind.do")
   public ModelAndView pwdFind(String name,String email) {
      ModelAndView mav=new ModelAndView();
      MemberDTO dto=memberDao.pwdCheck(name,email);
      String msg = "";
      String page="";
      if(dto==null) {
         msg="<font color=red>일치하는 아이디가 없습니다</font>";
         mav.addObject("msg",msg);
         mav.setViewName("member/idFindOkMsg");
         return mav;
      }else {
         
         msg="일치";
         mav.addObject("msg",msg);
         mav.setViewName("member/idFindOkMsg");
/*         
   
         mav.addObject("name",name);
         mav.addObject("email",email);*/
         
         
         //mav.addObject("page","pwdFindForm.do");
         //mav.setViewName("member/memberMsg");
         return mav;
      }
      
      
   }
   @RequestMapping("/pwdFindForm.do")
   public ModelAndView pwdFindForm(@RequestParam("member_name")String name,@RequestParam("member_email")String email) {
      ModelAndView mav=new ModelAndView();
      mav.addObject("name", name);
      mav.addObject("email",email);
      mav.setViewName("member/pwdFindForm");
      return mav;
      
   }
   @RequestMapping("/pwdFindOk.do")
   public ModelAndView pwdFindOk(@RequestParam("member_email")String email,@RequestParam("member_pwd")String pwd) {
   
      ModelAndView mav=new ModelAndView();
     String hashPassword = BCrypt.hashpw(pwd, BCrypt.gensalt());

      int result=memberDao.pwdChange(email, hashPassword);
      String msg = "";
      if(result>0) {
         msg = "변경완료";
      }else {
         msg = "변경실패";
      }
         mav.addObject("msg", msg);
         
         //나중에 index.do 수정
         mav.addObject("page","index.do");
         mav.setViewName("member/memberMsg");
      return mav;
      
      
   }
   //마이페이지 이동
   @RequestMapping("/myPageForm.do")
   public ModelAndView myPageForm(@RequestParam("email")String email) {
      
      ModelAndView mav=new ModelAndView();
      MemberDTO dto=memberDao.myPage(email);
      
      mav.addObject("dto",dto);
      mav.setViewName("mypage/myPageForm");
      return mav;
      
   }
   //탈퇴 이동경로
   @RequestMapping("/memberOutForm.do")
   public ModelAndView memberOutForm(@RequestParam("idx")int idx) {
      ModelAndView mav=new ModelAndView();
      mav.setViewName("member/memberOutForm");
      return mav;
   }
   @RequestMapping("/memberOutOk.do")
   public ModelAndView memberOutOk(HttpSession session) {
      ModelAndView mav=new ModelAndView();
      String email=(String) session.getAttribute("id");
      int result=memberDao.memberOut(email);
      String msg = "";
      if(result>0) {
         msg="탈퇴완료";
         session.invalidate();
         
      }else {
         msg="탈퇴실패";
      }
      mav.addObject("msg",msg);
      mav.addObject("page","index.do");
      mav.setViewName("member/memberMsg");
      return mav;
   }
   @RequestMapping("/myPointForm.do")
   public String myPointForm() {
      return "mypage/myPointForm";
   }
   
   //포인트 내역
   @RequestMapping("/myPointList.do")
   public ModelAndView myPointList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp) {
      ModelAndView mav=new ModelAndView();
      //String email=(String) session.getAttribute("id");
      int idx= (Integer) session.getAttribute("member_idx");
   
      int result=pointDao.getPoint(idx);
      int totalCnt=pointDao.getMyPointTotal(idx);
      int ls=10; // 보여줄 리스트수
      int pageSize=5; //보여줄 페이지수
      
      String pagestr=nfc.page.pageMyPoint.makePage("myPointForm.do", totalCnt, ls, pageSize, cp);
      
      List<PointDTO> dto=pointDao.myPoint(idx,ls,cp );
      
      mav.addObject("getPoint",result);
      mav.addObject("dto",dto);
      mav.addObject("pagestr",pagestr);
      mav.addObject("cp",cp);
      mav.setViewName("mypage/myPointFormajax");
      return mav;
      
   }
   
   //포인트 적립
   @RequestMapping("test1.do")
   public ModelAndView savePoint(@RequestParam(value="savePoint",defaultValue="0")int savePoint,HttpSession session) {
      ModelAndView mav=new ModelAndView();
      String email=(String) session.getAttribute("id");
      
      int result=pointDao.savePoint(email,savePoint);
      mav.setViewName("index");
      return mav;
      
   }
   //포인트 적립
   @RequestMapping("test2.do")
   public ModelAndView usePoint(@RequestParam(value="usePoint",defaultValue="0")int usePoint,HttpSession session) {
      ModelAndView mav=new ModelAndView();
      String email=(String) session.getAttribute("id");

      int result=pointDao.usePoint(email,usePoint);
      mav.setViewName("index");
      return mav;
   }
   
   // 주문내역 보기
   @RequestMapping("/beforeOrderListForm.do")
   public ModelAndView beforeOrderListForm(HttpSession session) {
      ModelAndView mav= new ModelAndView();
      int idx= (Integer) session.getAttribute("member_idx");
      List<OrderDTO> dto=orderDao.beforeOrderListForm(idx);   
      mav.addObject("dto",dto);
      mav.setViewName("mypage/myOrderList");
      return mav;
   }
   
   
   
}