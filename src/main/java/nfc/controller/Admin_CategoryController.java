package nfc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Timestamp;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import nfc.admin.category.model.CategoryDAO;
import nfc.admin.category.model.CategoryDTO;
import nfc.file.rename.FileRenamePolicy;
import nfc.warehousing.model.ShopDTO;


@Controller
public class Admin_CategoryController {
	
	@Autowired
	private CategoryDAO cateDao;
	
	@RequestMapping("categoryListForm.do")
	public String categoryListForm(){
		return "admin/categoryListForm";
	}
	
	@RequestMapping("categoryList.do")
	public ModelAndView invenList(@RequestParam(value="cp", defaultValue="1")int cp){
		int totalCnt=cateDao.getTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		String pageStr=nfc.page.CategoryPageModuleAjax.makePage("categoryList.do", totalCnt, listSize, pageSize, cp);
		
		List<CategoryDTO> list=cateDao.categoryList(cp, listSize);
		ModelAndView mav = new ModelAndView();
		mav.addObject("list",list);
		mav.addObject("cp",cp);
		mav.setViewName("admin/categoryList");
		mav.addObject("pageStr",pageStr);
		return mav;
	}
	
	@RequestMapping("categoryDel.do")
	public ModelAndView cateDel(@RequestParam(value="ck")int ck[],@RequestParam(value="cp", defaultValue="1")int cp){
		int result=0;
		for(int i=0; i<ck.length; i++){
			result=cateDao.categoryDel(ck[i]);
		}

		String msg=result>0?"삭제성공":"삭제실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("msg",msg);
		mav.addObject("cp",cp);
		mav.setViewName("admin/categoryMsg");
		return mav;
	
	}
	
	@RequestMapping("cateWrite.do")
	public ModelAndView cateWrite(){
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/cateWrite");
		return mav;
	}
	
	@RequestMapping(value="cateWrite_Ok.do",method=RequestMethod.POST)
	public ModelAndView cateWriteOk(CategoryDTO dto,@RequestParam("img") MultipartFile img){
		String msg="";
		copyInto(img,dto);
		
		//dto.setCategory_img(img.getOriginalFilename());
		int result=cateDao.categoryAdd(dto);
		msg=result>0?"등록성공":"등록실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("msg",msg);
		mav.setViewName("admin/cateWrite_Ok");
		return mav;
	}
	
	@RequestMapping("cateReWrite.do")
	public ModelAndView cateReWrite(int idx){
		CategoryDTO dto=cateDao.categoryContent(idx);
		ModelAndView mav=new ModelAndView();
		mav.addObject("dto",dto);
		mav.addObject("idx",idx);
		mav.setViewName("admin/cateReWrite");
		return mav;
	}
	
	@RequestMapping(value="cateReWrite_Ok.do",method=RequestMethod.POST)
	public ModelAndView cateReWriteOk(CategoryDTO dto, int idx,@RequestParam("img") MultipartFile img){
		copyInto(img,dto);
		//dto.setCategory_img(img.getOriginalFilename());
		int result=cateDao.categoryReWrite(dto, idx);
		String msg=result>0?"수정성공":"수정실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("result",result);
		mav.addObject("msg",msg);
		mav.setViewName("admin/cateReWrite_Ok");
		return mav;
	}
	
	public void copyInto(MultipartFile upload,CategoryDTO dto){
		
		try {
			byte bytes[]=upload.getBytes();//내가올린파일에 정보를 가져올수 있다.
			
	        String savaPath="D:/10CMCAFE/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/nfc/img/"+upload.getOriginalFilename();
			File newFile=new File(savaPath);
			newFile = new FileRenamePolicy().rename(newFile);
			dto.setCategory_img(newFile.getName());
			FileOutputStream fos=new FileOutputStream(newFile);//내가써야될 대상에 파일정보를 가지면서 실제파일을 저장
			fos.write(bytes);//내가올린 파일을 복사하는  코드
			fos.close();//파일 자원 반환(쓰면 반환해라)
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}























