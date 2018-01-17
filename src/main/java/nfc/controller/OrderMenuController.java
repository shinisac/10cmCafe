package nfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.balju.model.BaljuDAO;
import nfc.ordermenu.model.OrderMenuDAO;
import nfc.ordermenu.model.OrderMenuDTO;
import nfc.warehousing.model.ShopDTO;

@Controller
public class OrderMenuController {
	
	@Autowired
	private OrderMenuDAO ordermenuDao;
	
	@Autowired
	private BaljuDAO baljuDao;
	
	@RequestMapping("/orderShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=ordermenuDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("order/orderShop");
		return mav;
	}
	
	@RequestMapping("/orderList.do")
	public ModelAndView orderList(@RequestParam("shop_idx")int shop_idx) {
		
		List<OrderMenuDTO> list = ordermenuDao.orderList(shop_idx);
		ShopDTO dto=baljuDao.baljuList(shop_idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name",dto.getShop_name());
		mav.setViewName("order/orderList");
		return mav;
	}
	
	@RequestMapping("/orderDetail.do")
	public ModelAndView orderDetailList(@RequestParam("idx")int idx) {
		
		List<OrderMenuDTO> list=ordermenuDao.detailList(idx);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("nfcJson");
		return mav;
	}
	
	@RequestMapping("/reserveOk.do")
	public ModelAndView reserveOk(@RequestParam(value = "idx", required = false) int idx,@RequestParam(value = "shop_idx", required = false) int shop_idx) {
		
		int result=ordermenuDao.reserveOk(idx, shop_idx);

		String msg = result > 0 ? "주문접수 완료!" : "선택된 주문이 없습니다!";
		ModelAndView mav = new ModelAndView();

		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.setViewName("order/orderMsg");
		return mav;
	}

	@RequestMapping("/orderOk.do")
	public ModelAndView orderOk(@RequestParam(value = "idx", required = false) int idx,@RequestParam(value = "shop_idx", required = false) int shop_idx) {
		
		int result=ordermenuDao.orderOk(idx, shop_idx);

		String msg = result > 0 ? "주문완료!" : "선택된 주문이 없습니다!";
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.setViewName("order/orderMsg");
		return mav;
	}
	
	@RequestMapping("/orderDel.do")
	public ModelAndView orderDel(@RequestParam(value = "idx", required = false) int idx,@RequestParam(value = "shop_idx", required = false) int shop_idx) {
		
		int result=ordermenuDao.orderDel(idx, shop_idx);
		
		String msg=result>0?"주문삭제 되었습니다.":"주문삭제 실패했습니다.";
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.setViewName("order/orderMsg");
		return mav;
	}
}














