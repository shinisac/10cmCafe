package nfc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.order.model.MonthDTO;
import nfc.order.model.OrderDAO;
import nfc.warehousing.model.*;


@Controller
public class IndexController {
	
	@Autowired
	private OrderDAO orderDao;
	
	@RequestMapping("index.do")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/shopPageMain.do")
	public ModelAndView indexMain(@RequestParam(value="shop_idx", defaultValue="0")int shop_idx,@RequestParam(value="shop_name", defaultValue="0")String shop_name){
		
		MonthDTO dto=orderDao.monthTotalPrice1();
		MonthDTO dto2=orderDao.monthTotalPrice2();
		MonthDTO dto3=orderDao.monthTotalPrice3();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name",shop_name);
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("dto3",dto3);
		mav.setViewName("/shopPageIndex");
		return mav;
	}
}
