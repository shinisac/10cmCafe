package nfc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.book.model.BookDAO;
import nfc.book.model.BookDTO;
import nfc.book.model.BookMenuDAO;
import nfc.book.model.BookMenuDTO;
import nfc.order.model.Order_menuDTO;
import nfc.admin.category.model.*;
import nfc.balju.model.BaljuDAO;
import nfc.shop.model.MenuDTO;
import nfc.shop.model.ShopDAO;
import nfc.shop.model.ShopDTO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@Controller
public class ShopController {
   
   @Autowired
   private ShopDAO shopDao;
    @Autowired
    private BookDAO bookDao;      
    @Autowired
    private BookMenuDAO bookmenuDao;
   
    
   @RequestMapping(value="/shopfind.do")
   public ModelAndView shopfind(HttpSession session) {
      ModelAndView mav = new ModelAndView();
      
      if(session.getAttribute("member_idx")==null) {
            List<ShopDTO> arr = shopDao.mapcode();
            mav.addObject("shoplist",arr); 
            mav.setViewName("shop/shopfind_area");
            
            return mav;
      }
      int ls=10;
      int cp=1;
      int member_idx=(Integer) session.getAttribute("member_idx");
      List<BookDTO> bookList=bookDao.bookMark(member_idx,ls,cp );   

      ArrayList check=new ArrayList();
      
      for (int i = 0; i < bookList.size(); i++) {
         check.add(bookList.get(i).getShop_idx());
      
      }
      mav.addObject("check",check); 
      List<ShopDTO> arr = shopDao.mapcode();
      mav.addObject("shoplist",arr); 
      mav.setViewName("shop/shopfind_area");
      return mav;
      
   }
   
   @RequestMapping(value="/shop_menuCate.do")
	public ModelAndView shopmenu2(@RequestParam(value="shop", defaultValue="1")int idx,@RequestParam(value="cate", defaultValue="1")int cate,HttpSession session) {
	   
	   ShopDTO dto=shopDao.shopnameFind(idx);
		ModelAndView mav = new ModelAndView();
		List<ShopDTO> arr = shopDao.shopcategory();
		List<MenuDTO> menulist = shopDao.loadmenuList();
		ArrayList<Order_menuDTO> cartlist = shopDao.loadCartList(session, idx);
		int cartcount=0;
		int tprice = 0;
		if(cartlist!=null) {
			cartcount = cartlist.size();
			for(int i=0;i<cartlist.size();i++) {
				tprice += cartlist.get(i).getOrder_menu_amount()*cartlist.get(i).getOrder_menu_price();
			}
		}
		mav.addObject("shop_name", dto.getShop_name());
		mav.addObject("shop",idx); 
		mav.addObject("cate",cate); 
		mav.addObject("shopcategory",arr); 
		mav.addObject("menuList",menulist);
		mav.addObject("cartcnt",cartcount);
		mav.addObject("cartList",cartlist);
		mav.addObject("cartprice",tprice);
		mav.setViewName("menu/shop_menuCate");
		return mav;
	}
   
   @RequestMapping(value="/shopfind_map.do")
   public ModelAndView shopfind_map() {
      ModelAndView mav = new ModelAndView();
      List<ShopDTO> arr = shopDao.mapcode();
      mav.addObject("shoplist",arr); 
      mav.setViewName("shop/shopfind_map");
      return mav;
   }   
   @RequestMapping(value="/shopfind_name.do")
   public String shopname() {
      return "shop/shopfind_name";
   }   
   @RequestMapping(value="/search_area.do")
   public  String findaera(@RequestParam("addr")String addr,HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");
      PrintWriter pw = res.getWriter();
      String list = shopDao.shoparea(addr);
      
      if(list==null) {
         pw.print("no");
      }else {
         pw.print(list);
         
   
      }
      //System.out.println(list);
      
      pw.close(); 
      return null;
   }
   @RequestMapping(value="/search_name.do")
   public String findname(@RequestParam("name")String name,HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");
      PrintWriter pw = res.getWriter();
      String list = shopDao.shopname(name);
      if(list==null) {
         pw.print("no");
      }else {
         pw.print(list);
      }
      //System.out.println(list);
      
      pw.close();
      return null;
   }
   @RequestMapping(value="/lookshop.do")
   public  String lookshop(@RequestParam("idx")int idx,HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");
      PrintWriter pw = res.getWriter();
      String list = shopDao.lookshop(idx);
      System.out.println(list);
      pw.print(list);
      pw.close();
      return null;
   }
   @RequestMapping(value="/shop_menuList.do")
   public ModelAndView shopmenu(@RequestParam(value="shop")int idx,HttpSession session,@RequestParam(value="type", defaultValue="0")int type ) {
	  
	  ShopDTO dto=shopDao.shopnameFind(idx);
	   
      ModelAndView mav = new ModelAndView();
      if(session.getAttribute("member_idx")==null) {
      mav.addObject("shop",idx);   
      mav.addObject("type",type);   
      mav.addObject("shop_name", dto.getShop_name());
      mav.setViewName("member/loginForm");
      return mav;
   }
      
      List<ShopDTO> arr = shopDao.shopcategory();
      List<MenuDTO> menulist = shopDao.loadmenuList();
      ArrayList<Order_menuDTO> cartlist = shopDao.loadCartList(session, idx);
      int cartcount=0;
      int tprice = 0;
      if(cartlist!=null) {
         cartcount = cartlist.size();
         for(int i=0;i<cartlist.size();i++) {
            tprice += cartlist.get(i).getOrder_menu_amount()*cartlist.get(i).getOrder_menu_price();
         }
      }
      
      mav.addObject("shop_name", dto.getShop_name());
      mav.addObject("shop",idx);
      mav.addObject("shopcategory",arr); 
      mav.addObject("menuList",menulist);
      mav.addObject("cartcnt",cartcount);
      mav.addObject("cartList",cartlist);
      mav.addObject("cartprice",tprice);
      mav.setViewName("menu/shop_menuList");
      return mav;
   
   }
   
   @RequestMapping(value="/shop_cartAjax.do")
   public ModelAndView cartlist(@RequestParam(value="shop")int idx,HttpSession session) {
      ModelAndView mav = new ModelAndView();

      ArrayList<Order_menuDTO> cartlist = shopDao.loadCartList(session, idx);
      int cartcount=0;
      if(cartlist!=null) {
         cartcount = cartlist.size();      
      }
      mav.addObject("shop",idx);
      mav.addObject("cartcnt",cartcount);
      mav.addObject("cartList",cartlist);
      mav.setViewName("menu/cartListAjax");
      return mav;
   }   
   @RequestMapping(value="/shop_menu.do")
   public ModelAndView menucontent(@RequestParam(value="idx")int idx,HttpSession session,@RequestParam(value="cart",defaultValue="0")int cart) {
      ModelAndView mav = new ModelAndView();
      int member_idx=(Integer) session.getAttribute("member_idx");
      MenuDTO dto = shopDao.menuContent(idx,member_idx);
      
      System.out.println(cart);
      
      //type 로 주문인지 북마크에서 온지 확인하기
      mav.addObject("cart",cart);
      
      mav.addObject("menucontent",dto); 
      
      mav.setViewName("menu/shop_menuAjax");
      
      return mav;
   }
   @RequestMapping(value="/cartIn.do")
   public void cartIn(@RequestParam("shop_idx")int idx,Order_menuDTO dto,HttpServletResponse res,HttpSession session) throws IOException {
      res.setCharacterEncoding("utf-8");
      shopDao.cartIn(idx, dto, session, res);

   }
   

//   @RequestMapping(value="/category_menu.do")
//   public String menuList(@RequestParam("idx")int idx,HttpServletResponse res) throws IOException {
//      res.setCharacterEncoding("utf-8");
//      PrintWriter pw = res.getWriter();
//      String list = shopDao.menuList(idx);
//      if(list==null) {
//         pw.print("no");
//      }else {
//         pw.print(list);
//      }
//      //System.out.println(list);
//      
//      pw.close();
//      return null;
//   }
   @RequestMapping(value="/category_menu.do")
   public ModelAndView menuList(@RequestParam("idx")int idx,HttpServletResponse res) throws IOException {
      ModelAndView mav = new ModelAndView();
      List<MenuDTO> dto = shopDao.menuList(idx);
      CategoryDTO cdto = shopDao.menuCategory(idx);
      mav.addObject("cate",cdto);
      mav.addObject("list",dto);
      mav.setViewName("menu/shop_menuListAjax");
      return mav;
   }
   @RequestMapping(value="/category_menu2.do")
   public ModelAndView menuList2(@RequestParam("idx")int idx,HttpServletResponse res) throws IOException {
      ModelAndView mav = new ModelAndView();
      List<MenuDTO> dto = shopDao.menuList(idx);
      CategoryDTO cdto = shopDao.menuCategory(idx);
      mav.addObject("cate",cdto);
      mav.addObject("list",dto);
      mav.setViewName("menu/shop_menuCateajax");
      return mav;
   }
   @RequestMapping(value="/go_cart.do")
   public ModelAndView gocart(@RequestParam("shop")int idx) throws IOException {
      ModelAndView mav = new ModelAndView();
      mav.addObject("shop",idx); 
      mav.setViewName("menu/cartList");
      return mav;
   }
   @RequestMapping(value="/menu_cart.do")
   public String cartList(@RequestParam("shop")int idx,HttpSession session, HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");

      PrintWriter pw = res.getWriter();
      String list = shopDao.cartjson(idx,session,res);

      if(list==null) {
         pw.print("no");
      }else {
         pw.print(list);
      }
      //System.out.println(list);
      
      pw.close();
      return null;
   }
   @RequestMapping(value="/cart_del.do")
   public String cartDel(@RequestParam("shop")int idx,Order_menuDTO dto,HttpSession session, HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");

      PrintWriter pw = res.getWriter();
      String list = shopDao.cartdel(idx,dto,session,res);

      return null;
   }
   @RequestMapping(value="/cart_amount.do")
   public String cartAmount(@RequestParam("shop")int idx,Order_menuDTO dto,HttpSession session, HttpServletResponse res) throws IOException {
      res.setCharacterEncoding("utf-8");

      PrintWriter pw = res.getWriter();
      String list = shopDao.cartamount(idx,dto,session,res);

      return null;
   }
   
   @RequestMapping(value="cart_count.do")
   public ModelAndView cartcount(@RequestParam("shop")int idx,HttpSession session) throws IOException {
      ModelAndView mav = new ModelAndView();
      ArrayList<Order_menuDTO> cartlist = shopDao.loadCartList(session, idx);
      int cartcount=0;
      int tprice = 0;
      if(cartlist!=null) {
         cartcount = cartlist.size();
         for(int i=0;i<cartlist.size();i++) {
            tprice += cartlist.get(i).getOrder_menu_amount()*cartlist.get(i).getOrder_menu_price();
         }
      }
      mav.addObject("shop",idx); 
      mav.addObject("cartcount",cartcount); 
      mav.addObject("tprice",tprice); 
      mav.setViewName("nfcJson");
      return mav;
   }
   

}