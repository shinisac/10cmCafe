package nfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.admin.balju.model.BaljuDAO;
import nfc.admin.balju.model.BaljuDTO;
import nfc.balju.model.Balju_MaterialDTO;
import nfc.warehousing.model.ShopDTO;

@Controller
public class Admin_BaljuController {
	
	@Autowired
	private BaljuDAO adBaljuDao;
	
	@RequestMapping("/baljuShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=adBaljuDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/baljuShop");
		return mav;
	}
	
	@RequestMapping("/baljuList.do")
	public ModelAndView baljuList(@RequestParam(value="cp", defaultValue="1")int cp,@RequestParam(value="cp2", defaultValue="1")int cp2,@RequestParam("shop_idx")int shop_idx){
		int totalCnt=adBaljuDao.getTotalCnt(shop_idx);
		int listSize=5;
		int pageSize=5;
		String pageStr=nfc.page.PageModuleAjax.makePage("baljuList.do", totalCnt, listSize, pageSize, cp, shop_idx);
		List<BaljuDTO> list=adBaljuDao.baljuList(cp, listSize, shop_idx);
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("pageStr",pageStr);
		
		mav.setViewName("admin/baljuList");
		
		return mav;
	}
	
	@RequestMapping("/baljuList2.do")
	public ModelAndView baljuList(@RequestParam(value="cp", defaultValue="1")int cp,int shop_idx){
		int totalCnt=adBaljuDao.getTotalCnt2(shop_idx);
		int listSize=5;
		int pageSize=5;
		
		String pageStr=nfc.page.PageModuleAjax2.makePage("baljuList.do", totalCnt, listSize, pageSize, cp, shop_idx);
		List<BaljuDTO> list2=adBaljuDao.baljuList2(cp, listSize, shop_idx);
		
		ModelAndView mav=new ModelAndView();

		mav.addObject("list2",list2);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("pageStr",pageStr);

		mav.setViewName("admin/baljuList2");
		
		return mav;
	}
	
	@RequestMapping("/baljuListForm.do")
	public ModelAndView baljuListForm(int shop_idx,@RequestParam("shop_name")String shop_name){
		ModelAndView mav=new ModelAndView();
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name", shop_name);
		mav.setViewName("admin/baljuListForm");
		return mav;
	}
	
	
	
	@RequestMapping("/baljuContent.do")
	public ModelAndView baljuContent(int balju_idx){
		System.out.println("발주번호="+balju_idx);
		List<nfc.admin.balju.model.Balju_MaterialDTO> list=adBaljuDao.baljuContent(balju_idx);
		int totalPrice=0;
		for(int i=0; i<list.size(); i++){
			totalPrice += list.get(i).getMaterial_amount()*list.get(i).getMaterial_price();
		}
		System.out.println("총금액:"+totalPrice);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("balju_idx",balju_idx);
		mav.addObject("totalPrice",totalPrice);
		mav.setViewName("admin/baljuContent");
		return mav;
	}
	
	@RequestMapping("baljuOk.do")
	public ModelAndView baljuOk(int balju_idx){
		int result=adBaljuDao.baljuOk(balju_idx);
		String msg=result>0?"출고완료":"출고실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("result",result);
		mav.addObject("balju_idx",balju_idx);
		mav.setViewName("admin/baljuOk");
		return mav;
	}
	
}
