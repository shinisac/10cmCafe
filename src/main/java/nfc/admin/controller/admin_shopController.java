package nfc.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import nfc.file.rename.FileRenamePolicy;
import nfc.shop.model.ShopDAO;
import nfc.shop.model.ShopDTO;

@Controller
public class admin_shopController {
	
	@Autowired
	private ShopDAO shopDao;
	
	@RequestMapping("storeAdd.do")
	public ModelAndView storeAdd(ShopDTO dto) {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	
	@RequestMapping("admin_shop.do")
	public ModelAndView admin_shop_go() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/shop/admin_shopList");
		return mav;
	}
	@RequestMapping("admin_shopList_Ajax.do")
	public ModelAndView admin_shopList(@RequestParam(value="cp",defaultValue="1")int cp) {
		int totalCnt=shopDao.adminshoptotalList();
		int ls=5; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수
		
		String pagestr=nfc.page.pageModuleShop.shopPage("admin_shop.do", totalCnt, ls, pageSize, cp);
		ModelAndView mav = new ModelAndView();
		
		List<ShopDTO> list = shopDao.adminshopList(cp,ls);
		mav.addObject("shopList",list);
		mav.addObject("page",pagestr);
		mav.setViewName("admin/shop/shopAllList_ajax");
		return mav;
		
	}
	@RequestMapping(value = "admin_shopAdd.do",method=RequestMethod.GET)
	public ModelAndView admin_shopaddForm() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/shop/admin_shopAdd");
		return mav;
	}
	
	@RequestMapping(value = "admin_shopAdd.do",method=RequestMethod.POST)
	public ModelAndView admin_shopAdd(ShopDTO dto,@RequestParam("imgfile")MultipartFile file,HttpServletRequest rs) {
		ModelAndView mav = new ModelAndView();
		copyInto(file,rs,dto);
		int result = shopDao.storeAdd(dto);
		
		String msg = "알수없는 오류";
		if(result>0) {
			msg="등록이 완료되었습니다.";
		}
		mav.addObject("msg",msg);
		mav.addObject("page","opener.location.href='admin_shop.do';close();");
		mav.setViewName("admin/shop/shopMsg");
		return mav;
	}
	@RequestMapping("admin_content.do")
	public ModelAndView admin_content(@RequestParam("idx")int idx) {
		ModelAndView mav = new ModelAndView();
		ShopDTO dto = shopDao.shopContent(idx);
		mav.addObject("dto", dto);
		
		mav.setViewName("admin/shop/shop_content");
		return mav;
		
	}
	
	@RequestMapping("shop_del_Ajax.do")
	public void admin_shop_del(@RequestParam("idx")int idx,HttpServletResponse res) throws IOException{
		res.setCharacterEncoding("utf-8");
		PrintWriter pw = res.getWriter();
		int result = shopDao.shopDel(idx);
		String msg = "";
		if(result>0) {
			msg="해당 매장 정보가 삭제되었습니다.";
		}
		pw.print(msg);
	}
	@RequestMapping(value="admin_shopupdate.do",method=RequestMethod.GET)
	public ModelAndView admin_updateForm(@RequestParam("idx")int idx) {
		ModelAndView mav = new ModelAndView();
		ShopDTO dto = shopDao.shopContent(idx);
		mav.addObject("dto", dto);
		
		mav.setViewName("admin/shop/shop_update");
		return mav;
		
	}
	@RequestMapping(value="admin_shopupdate.do",method=RequestMethod.POST)
	public ModelAndView admin_update(ShopDTO dto,@RequestParam("imgfile")MultipartFile file,HttpServletRequest rs) {
		ModelAndView mav = new ModelAndView();
		String msg="[오류]";
		String page="location.href='admin_content.do?idx="+dto.getShop_idx()+"';opener.location.reload();";
		int result = shopDao.shopupdate(dto);
		if(result>0) {
			if(file!=null) {
				copyInto(file,rs,dto);
			}
			
			msg = "수정이 완료되었습니다.";
			
		}
		mav.addObject("msg",msg);
		mav.addObject("page",page);
		mav.setViewName("admin/shop/shopMsg");
		return mav;
		
	}	
	
	public void copyInto(MultipartFile upload,HttpServletRequest re,ShopDTO dto){

        String paths=re.getSession().getServletContext().getRealPath("/");
        
        try {
           byte bytes[]=upload.getBytes();//내가올린파일에 정보를 가져올수 있다.
           String savaPath=paths+"img/"+upload.getOriginalFilename();
           File newFile=new File(savaPath);
           newFile = new FileRenamePolicy().rename(newFile);
           dto.setShop_img(newFile.getName());
           FileOutputStream fos=new FileOutputStream(newFile);//내가써야될 대상에 파일정보를 가지면서 실제파일을 저장
           fos.write(bytes);//내가올린 파일을 복사하는  코드
           fos.close();//파일 자원 반환(쓰면 반환해라)
        } catch (IOException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        }
    }
	
	
}
