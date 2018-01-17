package nfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.balju.model.BaljuDAO;
import nfc.inven.model.*;
import nfc.warehousing.model.ShopDTO;


@Controller
public class InvenController {
	
	@Autowired
	private InvenDAO invenDao;//디스패처 서비스 등록
	
	@Autowired
	private BaljuDAO baljuDao;
	
	@RequestMapping("/invenShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=invenDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("inventory/invenShop");
		return mav;
	}
	
	@RequestMapping(value="/invenList.do", method=RequestMethod.GET)
	public ModelAndView invenList(@RequestParam(value="cp", defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx){
		int totalCnt=invenDao.getTotalCnt(shop_idx);
		int listSize=3;
		int pageSize=3;
		
		String pageStr=nfc.page.PageModule.makePage("invenList.do", totalCnt, listSize, pageSize, cp,shop_idx);
		
		ShopDTO dto=baljuDao.baljuList(shop_idx);
		List<InvenDTO> list=invenDao.invenList(cp, listSize,shop_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("listSize",listSize);		
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name",dto.getShop_name());
		mav.setViewName("inventory/invenList");
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	@RequestMapping("/invenSearch.do")
	public ModelAndView search(int cp,String startdate,String enddate,int shop_idx){
		
		List<InvenDTO> list=invenDao.search(startdate, enddate,shop_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("date",startdate);
		mav.addObject("date2",enddate);
		mav.setViewName("inventory/invenList");
		return mav;
	}
	
	
	
	@RequestMapping("/invenDetail.do")
	public ModelAndView invenDetail(int cp, int idx,String state,int shop_idx){
		ModelAndView mav = new ModelAndView();
		InvenDTO dto=invenDao.invenDetail(idx);
		System.out.println(state);
		mav.addObject("idx",idx);
		mav.addObject("cp",cp);
		mav.addObject("state",state);
		mav.addObject("dto",dto);
		mav.addObject("shop_idx",shop_idx);

		mav.setViewName("inventory/invenDetail");
		return mav;
	}
	
	@RequestMapping("/invenUpdate.do")
	public ModelAndView invenUpdate(int idx, String level, int cp, String amount_s, String bigo,int shop_idx){
		System.out.println(shop_idx);
		int amount=Integer.parseInt(amount_s);
		int result=invenDao.invenUpdate(idx, level,amount,bigo,shop_idx);
		String msg=result>0?"수정 성공":"수정 실패";
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("cp",cp);
		mav.addObject("idx",idx);
		mav.addObject("state",level);
		mav.addObject("shop_idx",shop_idx);
		mav.setViewName("inventory/invenMsg");
		return mav;
	}
	
}
