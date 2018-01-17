package nfc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.balju.model.BaljuDAO;
import nfc.inven.model.InvenDTO;
import nfc.warehousing.model.ShopDTO;
import nfc.warehousing.model.WarehousingDAO;
import nfc.warehousing.model.WarehousingDTO;

@Controller
public class WarehousingController {
	
	@Autowired
	private WarehousingDAO wharehousingDao;
	
	@Autowired
	private BaljuDAO baljuDao;
	
	@RequestMapping("/whShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=wharehousingDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("warehousing/whShop");
		return mav;
	}
	
	@RequestMapping("/whList.do")
	public ModelAndView whList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx) {
		
		int totalCnt=wharehousingDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=nfc.page.PageModule.makePage("whList.do", totalCnt, listSize, pageSize, cp, shop_idx);
		
		ShopDTO dto=baljuDao.baljuList(shop_idx);
		List<WarehousingDTO> list=wharehousingDao.whList(cp, listSize, shop_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name",dto.getShop_name());
		mav.addObject("cp", cp);
		mav.setViewName("warehousing/whList");
		return mav;
	}
	
	@RequestMapping("/whSearch.do")
	public ModelAndView search(int cp,String startdate,String enddate,int shop_idx){
		
		List<WarehousingDTO> list=wharehousingDao.search(startdate, enddate,shop_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("date",startdate);
		mav.setViewName("warehousing/whList");
		return mav;
	}
	
	@RequestMapping("/whContent.do")
	public ModelAndView whContent(@RequestParam("idx")int idx,int cp, int shop_idx) {
		
		WarehousingDTO dto=wharehousingDao.whContent(idx);
		
		ModelAndView mav=new ModelAndView();
		if(dto==null) {
			mav.addObject("msg", "잘못된 접근 또는 삭제된 입고 내역입니다.");
			mav.addObject("gopage", "whList.do");
			mav.setViewName("warehousing/whMsg");
		}else {
			mav.addObject("dto", dto);
			mav.addObject("cp", cp);
			mav.addObject("shop_idx", shop_idx);
			mav.setViewName("warehousing/whContent");
		}
		return mav;
	}
	
	@RequestMapping("/whWriteForm.do")
	public ModelAndView whWrite(int shop_idx,int cp) {
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("cp",cp);
		mav.setViewName("warehousing/whWrite");
		
		return mav;
	}
	
	@RequestMapping("/whWrite.do")
	public ModelAndView whWriteSubmit(WarehousingDTO dto,int cp,int shop_idx){
		
		int result=wharehousingDao.whWrite(dto);
		String msg=result>0?"입고내역이 저장되었습니다.":"입고내역 저장 실패했습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("msg", msg);
		mav.setViewName("warehousing/whMsg");
		return mav;
	}
	
	@RequestMapping(value="/whUpdate.do", method=RequestMethod.GET)
	public ModelAndView whUpdate1(int wh_idx, int cp, int shop_idx) {
		
		WarehousingDTO dto=wharehousingDao.whUpdate1(wh_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("cp", cp);
		mav.addObject("shop_idx", shop_idx);
		mav.setViewName("warehousing/whUpdate");
		return mav;
	}
	
	@RequestMapping(value="/whUpdate.do", method=RequestMethod.POST)
	public ModelAndView whUpdate2(WarehousingDTO dto, int cp, int shop_idx) {
		
		int result=wharehousingDao.whUpdate2(dto);
		String msg=result>0?"수정 되었습니다.":"수정 실패했습니다.";
		System.out.println("aaaaaa"+dto.getWh_idx());
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("wh_idx", dto.getWh_idx());
		mav.addObject("cp", cp);
		mav.addObject("shop_idx", shop_idx);
	    mav.setViewName("warehousing/whUpdateOk");
		return mav;
	}
	
	@RequestMapping("whDel.do")
	public ModelAndView whDel(int wh_idx, @RequestParam(value="cp", defaultValue="1")int cp, @RequestParam("shop_idx")int shop_idx) {
		
		int result=wharehousingDao.whDel(wh_idx);
	    String msg=result>0?"삭제성공":"삭제실패";
	    
	    ModelAndView mav=new ModelAndView();
	    mav.addObject("msg",msg);
	    mav.addObject("cp",cp);
	    mav.addObject("shop_idx", shop_idx);
	    mav.setViewName("warehousing/whMsg");
	    return mav;
	   
	}
}



























