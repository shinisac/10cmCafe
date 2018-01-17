package nfc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.admin.category.model.CategoryDTO;
import nfc.book.model.BookDAO;
import nfc.book.model.BookDTO;
import nfc.book.model.BookMenuDAO;
import nfc.book.model.BookMenuDTO;
import nfc.member.model.MemberDAO;
import nfc.point.model.PointDTO;
import nfc.shop.model.ShopDAO;
import nfc.shop.model.ShopDTO;

@Controller
public class BookController {

   @Autowired
   private MemberDAO memberDao;	
   @Autowired
   private BookDAO bookDao;	
   @Autowired
   private BookMenuDAO bookmenuDao;
   @Autowired
   private ShopDAO shopDao;
   
   
   @RequestMapping("/bookMarkForm.do")
   public String bookMarkForm() {
      return "book/bookMarkForm";
   }
   
	@RequestMapping("/bookMarkList.do")
	public ModelAndView bookMarkList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="shop_idx",defaultValue="0")int shop_idx) {
		ModelAndView mav=new ModelAndView();
		int chk=0;
		int member_idx=(Integer) session.getAttribute("member_idx");
		
		int totalCnt=bookDao.getMyBookMark(member_idx);
		int ls=10; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수

		String pagestr=nfc.page.pageBookMark.makePage("bookMarkForm.do", totalCnt, ls, pageSize, cp);
	    
		List<BookDTO> bookList=bookDao.bookMark(member_idx,ls,cp );	
		
		ArrayList check=new ArrayList();
		
		for (int i = 0; i < bookList.size(); i++) {
			check.add(bookList.get(i).getShop_idx());
		
			
		}

		//System.out.println(check);
		mav.addObject("chk",check);
        mav.addObject("dto",bookList);
        mav.addObject("pagestr",pagestr);
        mav.addObject("cp",cp);
        mav.setViewName("book/bookMarkajax");
		
		
		return mav;
	}
	
	   @RequestMapping("/bookMarkAdd.do")
	   public void bookMarkAdd(HttpSession session,@RequestParam(value="shop_idx",defaultValue="1")int shop_idx,@RequestParam(value="cp",defaultValue="1")int cp,HttpServletResponse res) throws IOException {
	      res.setCharacterEncoding("utf-8");
	       PrintWriter pw = res.getWriter();
	      int result=0;
	      String msg="";
	      int ls=100; 
	      int member_idx=(Integer) session.getAttribute("member_idx");
	      //즐겨찾기 검증(기존이 있나 ,없나)
	      int check=bookDao.bookMarkCheck(member_idx,shop_idx);  
	      if(check>0) {
	      //0보다 크면 이미 즐겨찾기된 매장 == 즐겨찾기 삭제     
	      result=bookDao.bookMarkDel(member_idx, shop_idx);
	      msg = result > 0 ?"즐겨찾기 삭제":"즐겨찾기  삭제 실패";
	      //mav.addObject("msg",msg);
	      }else {
	      //그외 즐겨찾기 추가   
	      result=bookDao.bookMarkAdd(member_idx, shop_idx);
	      msg = result > 0 ?"즐겨찾기 성공":"즐겨찾기 실패";
	      //mav.addObject("msg",msg);      
	      }
	      pw.print(msg);
	      pw.close();	      
	   }
	   
	      @RequestMapping("/bookMenuForm.do")
	      public ModelAndView bookMenuForm(@RequestParam(value="shop_idx",defaultValue="0")int shop_idx) {
	    	
	    	List<ShopDTO> list=shopDao.shopcategory();
	    	 
	        ModelAndView mav=new ModelAndView();
	        mav.addObject("shop",shop_idx);
	        mav.addObject("list", list);
	        mav.setViewName("book/bookMenuForm");
	        
	        return mav;
	      }
	   
	   
		@RequestMapping("/bookMarkMenuList.do")
		public ModelAndView bookMarkMenuList(HttpSession session,@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="shop_idx",defaultValue="0")int shop_idx,@RequestParam(value="menu_idx",defaultValue="0")int menu_idx) {
			ModelAndView mav=new ModelAndView();
			int chk=0;
			int member_idx=(Integer) session.getAttribute("member_idx");
			
			int totalCnt=bookmenuDao.getMyBookMarkMenu(member_idx);
			int ls=10; // 보여줄 리스트수
			int pageSize=5; //보여줄 페이지수

		//	String pagestr=nfc.page.pageBookMarkMenu.makePage("bookMarkMenuForm.do", totalCnt, ls, pageSize, cp);
		    
			List<BookMenuDTO> bookListMenu=bookmenuDao.bookMarkMenu(member_idx,ls,cp );	
			
			ArrayList check=new ArrayList();
			
			for (int i = 0; i < bookListMenu.size(); i++) {
				check.add(bookListMenu.get(i).getShop_idx());
				
			}

			mav.addObject("chk",check);
	        mav.addObject("dto",bookListMenu);
	        mav.addObject("shop",shop_idx);
	        mav.setViewName("book/bookMarkMenuajax");

			return mav;
		}
		
		@RequestMapping("/bookMenuAdd.do")
		public void bookMenuAdd(HttpSession session,@RequestParam(value="menu_idx",defaultValue="1")int menu_idx,@RequestParam(value="cp",defaultValue="1")int cp,HttpServletResponse res) throws IOException {
			res.setCharacterEncoding("utf-8");
			PrintWriter pw = res.getWriter();
			int result=0;
			String msg="";
			int ls=100;
			
			int member_idx=(Integer) session.getAttribute("member_idx");
			
			//즐겨찾기 검증(기존이 있나 ,없나)
			int check=bookmenuDao.bookMarkMenuCheck(member_idx,menu_idx);
			if(check>0) {
			//0보다 크면 이미 즐겨찾기된 매장 == 즐겨찾기 삭제
				
			result=bookmenuDao.bookMarkMenuDel(member_idx, menu_idx);
			msg = result > 0 ?" 메뉴 즐겨찾기 삭제":" 즐겨찾기  삭제 실패";

			

			}else {
			//그외 즐겨찾기 추가	
			result=bookmenuDao.bookMarkMenuAdd(member_idx, menu_idx);
			msg = result > 0 ?" 메뉴 즐겨찾기 성공":" 즐겨찾기 실패";
			
			}
			pw.print(msg);
			pw.close(); 

		}
		
}
