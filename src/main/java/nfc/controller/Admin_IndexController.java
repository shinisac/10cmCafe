package nfc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nfc.order.model.MonthDTO;
import nfc.order.model.OrderDAO;

@Controller
public class Admin_IndexController {

	@Autowired
	private OrderDAO orderDao;
	
	@RequestMapping("/admin_indexForm.do")
	public ModelAndView adminIndex() {
		MonthDTO dto=orderDao.monthTotalPrice1();
		MonthDTO dto2=orderDao.monthTotalPrice2();
		MonthDTO dto3=orderDao.monthTotalPrice3();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("dto2",dto2);
		mav.addObject("dto3",dto3);
		mav.setViewName("admin/admin_index");
		return mav;
	}
}
