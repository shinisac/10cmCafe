package nfc.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.balju.model.BaljuDAO;
import nfc.balju.model.BaljuDTO;
import nfc.balju.model.Balju_MaterialDTO;
import nfc.balju.model.MaterialDTO;
import nfc.warehousing.model.ShopDTO;

@Controller
public class BaljuController {
	
	@Autowired
	private BaljuDAO baljuDao;
	
	
	
	@RequestMapping("/baljuAdd.do")
	public ModelAndView baljuAdd(int shop_idx){
		ShopDTO dto=baljuDao.baljuList(shop_idx);
		List<MaterialDTO> list= baljuDao.materialList();//재료
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("shop_name",dto.getShop_name());
		
		mav.setViewName("balju/baljuAdd");
		return mav;
	}

	
	@RequestMapping("/materialList.do")
	public ModelAndView materialList(int shop_idx){
		
		List<MaterialDTO> list= baljuDao.materialList();//재료
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		
		mav.addObject("shop_idx",shop_idx);
		
		mav.setViewName("balju/baljuAdd");
		return mav;
	}
	
	@RequestMapping("/materialAdd.do")
	public ModelAndView materialAdd(int shop_idx,@RequestParam(value="ck")int ck[]){
		
		List<MaterialDTO> list = new ArrayList<MaterialDTO>();
		
		for(int i=0; i<ck.length; i++){
			list.add(baljuDao.chk_material(ck[i]));
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("shop_idx",shop_idx);
		mav.setViewName("nfcJson");
		return mav;
	}
	
	@RequestMapping("/baljuAdd_ok.do")
	public ModelAndView baljuAdd_ok(int shop_idx, Balju_MaterialDTO dto2){
		int result1=baljuDao.baljuAdd(shop_idx);
		
		int result2=0;
		
		if(result1>0){
			for(int i=0; i<dto2.getBalju_list().size(); i++){
				Balju_MaterialDTO dto=dto2.getBalju_list().get(i);
				result2=baljuDao.materialAdd(dto);
			}
		}
		String msg=result2>0?"신청완료":"신청실패";
	
		ModelAndView mav=new ModelAndView();
		mav.addObject("result1",result1);
		mav.addObject("result2",result2);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("msg",msg);
		mav.setViewName("balju/baljuMsg");
		return mav;
	}
	@RequestMapping(value="/baljuDetailList.do", method=RequestMethod.GET)
	public ModelAndView baljuList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx) {
		
		int totalCnt=baljuDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		String pageStr=nfc.page.PageModule.makePage("baljuDetailList.do", totalCnt, listSize, pageSize, cp, shop_idx);
		
		List<BaljuDTO> list=baljuDao.baljuMainList(cp, listSize, shop_idx);
		ShopDTO dto=baljuDao.baljuList(shop_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("cp", cp);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name",dto.getShop_name());
		mav.setViewName("balju/baljuList");
		return mav;
	}
	
	@RequestMapping(value="/baljuDetailList.do", method=RequestMethod.POST)
	public ModelAndView baljuSearch(int cp,String startdate,String enddate,int shop_idx) {
		
		List<BaljuDTO> list=baljuDao.baljuSearch(startdate, enddate, shop_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.addObject("date",startdate);
		mav.addObject("date2",enddate);
		mav.setViewName("balju/baljuList");
		return mav;
	}
	
	@RequestMapping("/baljuDetail.do")
	public ModelAndView baljuDetailList(int balju_idx, int cp, int shop_idx ) {
		
		List<MaterialDTO> list=baljuDao.baljuDetailList(balju_idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("cp",cp);
		mav.addObject("shop_idx",shop_idx);
		mav.setViewName("balju/baljuDetail");
		return mav;
	}
}
