package nfc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.order.model.MonthDTO;
import nfc.order.model.OrderDAO;
import nfc.order.model.OrderDTO;
import nfc.order.model.Order_menuDTO;
import nfc.point.model.PointDTO;
import nfc.shop.model.ShopDTO;


@Controller
public class OrderController {
	
	
	@Autowired
	private OrderDAO orderDao;
	
	
	@RequestMapping(value="order.do",method=RequestMethod.GET)
	public ModelAndView cartorderpage(@RequestParam("shop")int idx,HttpSession session,HttpServletResponse res) {
		ArrayList<Order_menuDTO> menu=orderDao.orderpage(idx,session);
		List<ShopDTO> shop = orderDao.lookshop(idx);
		ModelAndView mav = new ModelAndView();
		int point = orderDao.memberPoint(session);
		if(point>=0) {
			mav.addObject("point",point);
		}
		mav.addObject("menulist",menu);
		mav.addObject("shopinfo",shop);
		mav.setViewName("order/shop_order");
		return mav;
	}
	@RequestMapping(value="order.do",method=RequestMethod.POST)
	public ModelAndView orderpage(@RequestParam("shop")int idx,Order_menuDTO dto,HttpSession session,HttpServletResponse res) {
		ArrayList<Order_menuDTO> menu = new ArrayList<Order_menuDTO>();
		menu.add(dto);
		HashMap maps = new HashMap();
		maps.put(idx, menu);

		List<ShopDTO> shop = orderDao.lookshop(idx);
		if(session.getAttribute("orderList")!=null) {
			session.removeAttribute("orderList");
		}
		ModelAndView mav = new ModelAndView();
		int point = orderDao.memberPoint(session);
		if(point>=0) {
			mav.addObject("point",point);
		}
		session.setAttribute("orderList", maps);
		
		mav.addObject("menulist",menu);
		mav.addObject("shopinfo",shop);
		mav.setViewName("order/shop_order");
		return mav;
	}	
	@RequestMapping(value="orders.do",method=RequestMethod.POST)
	public ModelAndView orderOk(@RequestParam("point_use") int point_use,OrderDTO dto,HttpSession session,HttpServletResponse res) {
		
		PointDTO pdto=new PointDTO();
		pdto.setPoint_use(point_use);
		System.out.println("여기옴");
		int result = orderDao.orderinfo(pdto,dto,session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("order/order_ok");
		
		return mav;
	}
	
	@RequestMapping("/salesShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=orderDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/salesShop");
		return mav;
	}
	
	@RequestMapping(value="/salesList.do", method=RequestMethod.GET)
	public ModelAndView orderTotalList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		int totalCnt=orderDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		String pageStr=nfc.page.PageModule2.makePage("salesList.do", totalCnt, listSize, pageSize, cp);
		
		List<OrderDTO> list=orderDao.salesTotalList(cp, listSize);
		int price=orderDao.todayTotalPrice();
		int count=orderDao.todayTotalCount();
		MonthDTO dto=orderDao.monthTotalPrice1();
		MonthDTO dto2=orderDao.monthTotalPrice2();
		MonthDTO dto3=orderDao.monthTotalPrice3();
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("cp", cp);
		mav.addObject("pageStr", pageStr);
		mav.addObject("todayPrice", price);
		mav.addObject("todayCount", count);
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("dto3",dto3);
		mav.setViewName("admin/salesTotal");
		return mav;
	}
	
	@RequestMapping(value="/salesList.do", method=RequestMethod.POST)
	public ModelAndView totalSearch(int cp,String startdate,String enddate){
		
		List<OrderDTO> list=orderDao.salesTotalSearch(startdate, enddate);
		
		OrderDTO dto=orderDao.salesTotalSearchPrice(startdate, enddate);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("date",startdate);
		mav.addObject("date2",enddate);
		if(dto!=null) {
			mav.addObject("totalPrice", dto.getOrder_price());
		}
		
		mav.setViewName("admin/salesTotalSearch");
		return mav;
	}
	
	@RequestMapping(value="/sales.do", method=RequestMethod.GET)
	public ModelAndView orderList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx,@RequestParam("shop_name")String shop_name) {
		
		int totalCnt=orderDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		String pageStr=nfc.page.PageModule3.makePage("sales.do", totalCnt, listSize, pageSize, cp, shop_idx, shop_name);
		
		List<OrderDTO> list=orderDao.salesList(cp, listSize, shop_idx);
	
		int price=orderDao.todayPrice(shop_idx);
		int count=orderDao.todayCount(shop_idx);
		MonthDTO dto=orderDao.monthPrice1(shop_idx);
		MonthDTO dto2=orderDao.monthPrice2(shop_idx);
		MonthDTO dto3=orderDao.monthPrice3(shop_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("cp", cp);
		mav.addObject("pageStr", pageStr);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name", shop_name);
		mav.addObject("todayPrice", price);
		mav.addObject("todayCount", count);
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("dto3",dto3);
		mav.setViewName("sales/salesMain");
		return mav;
	}
	
	@RequestMapping(value="/sales.do", method=RequestMethod.POST)
	public ModelAndView search(int cp,String startdate,String enddate,int shop_idx,@RequestParam("shop_name")String shop_name){
		
		List<OrderDTO> list=orderDao.salesSearch(startdate, enddate, shop_idx);
		OrderDTO dto=orderDao.salesSearchPrice(startdate, enddate, shop_idx);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name",shop_name);
		mav.addObject("date",startdate);
		mav.addObject("date2",enddate);
		if(dto!=null) {
			mav.addObject("totalPrice", dto.getOrder_price());
		}
		mav.setViewName("sales/salesSearch");
		return mav;
	}
	
	@RequestMapping(value="/AdminSales.do", method=RequestMethod.GET)
	public ModelAndView adminOrderList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx,@RequestParam("shop_name")String shop_name) {
		
		int totalCnt=orderDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		String pageStr=nfc.page.PageModule3.makePage("AdminSales.do", totalCnt, listSize, pageSize, cp, shop_idx, shop_name);
		
		List<OrderDTO> list=orderDao.salesList(cp, listSize, shop_idx);
	
		int price=orderDao.todayPrice(shop_idx);
		int count=orderDao.todayCount(shop_idx);
		MonthDTO dto=orderDao.monthPrice1(shop_idx);
		MonthDTO dto2=orderDao.monthPrice2(shop_idx);
		MonthDTO dto3=orderDao.monthPrice3(shop_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("cp", cp);
		mav.addObject("pageStr", pageStr);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name", shop_name);
		mav.addObject("todayPrice", price);
		mav.addObject("todayCount", count);
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("dto3",dto3);
		mav.setViewName("admin/admin_salesMain");
		return mav;
	}
	
	@RequestMapping(value="/AdminSales.do", method=RequestMethod.POST)
	public ModelAndView adminOrdersearch(int cp,String startdate,String enddate,int shop_idx,@RequestParam("shop_name")String shop_name){
		
		List<OrderDTO> list=orderDao.salesSearch(startdate, enddate, shop_idx);
		OrderDTO dto=orderDao.salesSearchPrice(startdate, enddate, shop_idx);
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name",shop_name);
		mav.addObject("date",startdate);
		mav.addObject("date2",enddate);
		if(dto!=null) {
			mav.addObject("totalPrice", dto.getOrder_price());
		}
		mav.setViewName("admin/admin_salesSearch");
		return mav;
	}
}
