package nfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.shop.model.ShopDAO;
import nfc.shop.model.ShopDTO;

@Controller
public class testController {

	@Autowired
	private ShopDAO shopDao;
	
	@RequestMapping(value="/map.do")
	public ModelAndView shopfind_map() {
		ModelAndView mav = new ModelAndView();
		List<ShopDTO> arr = shopDao.mapcode();
		mav.addObject("shoplist",arr); 
		mav.setViewName("test/map");
		return mav;
	}	
	
	@RequestMapping(value="/test_map.do")
	public ModelAndView test_map(@RequestParam("name")String addr) {
		ModelAndView mav = new ModelAndView();
		List<ShopDTO> arr = shopDao.mapcode();
		mav.addObject("shoplist",arr); 
		mav.setViewName("test/map");
		return mav;
	}		
	
}
