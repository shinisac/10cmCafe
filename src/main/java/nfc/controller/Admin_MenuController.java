package nfc.controller;

import java.util.List;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import nfc.admin.category.model.CategoryDAO;
import nfc.admin.category.model.CategoryDTO;
import nfc.admin.menu.model.MenuDAO;
import nfc.admin.menu.model.MenuDTO;
import nfc.file.rename.FileRenamePolicy;
import nfc.warehousing.model.ShopDTO;

@Controller
public class Admin_MenuController {
	@Autowired
	private CategoryDAO cateDao;
	@Autowired
	private MenuDAO menuDao;
		
	@RequestMapping("/menuList.do")
	public ModelAndView menuList(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam("shop_idx")int shop_idx,@RequestParam("shop_name")String shop_name) {
		
		int totalCnt=menuDao.getTotalCnt();
		int listSize=10;
		int pageSize=10;
		
		String pageStr=nfc.page.PageModule3.makePage("menuList.do", totalCnt, listSize, pageSize, cp, shop_idx, shop_name);
		
		List<MenuDTO> list=menuDao.menuList(cp, listSize, shop_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("pageStr", pageStr);
		mav.addObject("cp", cp);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("shop_name", shop_name);
		mav.setViewName("admin/menuList");
		return mav;
	}
	
	@RequestMapping(value="/menuAddForm.do", method=RequestMethod.GET)
	public ModelAndView menuAddForm(@RequestParam("shop_idx")int shop_idx) {
		List<CategoryDTO> list=cateDao.cateMenu();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.addObject("shop_idx", shop_idx);
		mav.setViewName("admin/menuAdd");
		return mav;
	}
	
	@RequestMapping(value="/menuAdd.do", method=RequestMethod.POST)
	public ModelAndView menuAddSubmit(MenuDTO dto,@RequestParam("img")MultipartFile img, @RequestParam("shop_idx")int shop_idx) {
		
		copyInto(img,dto);
		int result=menuDao.menuAdd(dto,shop_idx);
		String msg=result>0?"메뉴가 등록되었습니다.":"메뉴등록 실패했습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("msg", msg);
		mav.setViewName("admin/menuPopupMsg");
		return mav;
	}
	
	@RequestMapping("menuDel.do")
	   public ModelAndView cateDel(@RequestParam(value="ck")int ck[],@RequestParam(value="cp", defaultValue="1")int cp, @RequestParam("shop_idx")int shop_idx,@RequestParam("shop_name") String shop_name){
	      int result=0;
	      for(int i=0; i<ck.length; i++){
	         result=menuDao.menuDel(ck[i]);
	      }
	      
	      String msg=result>0?"삭제성공":"삭제실패";
	      ModelAndView mav=new ModelAndView();
	      mav.addObject("result",result);
	      mav.addObject("msg",msg);
	      mav.addObject("cp",cp);
	      mav.addObject("shop_idx", shop_idx);
	      mav.addObject("shop_name", shop_name);
	      mav.setViewName("admin/menuMsg");
	      return mav;
	   
	   }
	
	@RequestMapping(value="/menuUpdate.do", method=RequestMethod.GET)
	public ModelAndView menuDetailList(int menu_idx,@RequestParam(value="cp",defaultValue="1")int cp) {
		
		List<CategoryDTO> list=cateDao.cateMenu();
		MenuDTO dto=menuDao.menuDetailList(menu_idx);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto", dto);
		mav.addObject("cp", cp);
		mav.addObject("list", list);
		mav.setViewName("admin/menuUpdate");
		return mav;
	}
	
	@RequestMapping(value="/menuUpdate.do", method=RequestMethod.POST)
	public ModelAndView menuUpdate(MenuDTO dto, @RequestParam("img")MultipartFile img) {
		copyInto(img,dto);
		
		int result=menuDao.menuUpdate(dto);
		String msg=result>0?"수정 되었습니다.":"수정 실패했습니다.";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
	    mav.setViewName("admin/menuPopupMsg");
		return mav;
	}
	
	public void copyInto(MultipartFile upload,MenuDTO dto){

	      
	      try {
	         byte bytes[]=upload.getBytes();//내가올린파일에 정보를 가져올수 있다.
	         String savaPath="D:/10CMCAFE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nfc/img/"+upload.getOriginalFilename();
	         File newFile=new File(savaPath);
	         newFile = new FileRenamePolicy().rename(newFile);
	         dto.setMenu_img(newFile.getName());
	         FileOutputStream fos=new FileOutputStream(newFile);//내가써야될 대상에 파일정보를 가지면서 실제파일을 저장
	         fos.write(bytes);//내가올린 파일을 복사하는  코드
	         fos.close();//파일 자원 반환(쓰면 반환해라)
	      } catch (IOException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	  }
	@RequestMapping("/menuShop.do")
	public ModelAndView shopList() {
		
		List<ShopDTO> list=menuDao.shopList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("admin/menuShop");
		return mav;
	}
}























