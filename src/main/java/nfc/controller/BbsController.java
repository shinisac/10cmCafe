package nfc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import nfc.bbs.model.BbsDAO;
import nfc.bbs.model.BbsDTO;
import nfc.page.*;
import nfc.shop.model.ShopDTO;

import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class BbsController {

	@Autowired
	private BbsDAO bbsDao;
	private String bookmarkPage;
	
	@RequestMapping("/bbsList.do")
	public ModelAndView bbslist(@RequestParam(value="cp",defaultValue="1")int cp, int shop_idx, HttpSession session) { 
		//defaultValue 가 무조건 값을 넣어주므로 required를 적용할 필요가 없다.
		
		int totalCnt=bbsDao.getTotalCnt();
		int listSize=3;
		int pageSize=3;
		
		String email=(String) session.getAttribute("id");
		ShopDTO dto=bbsDao.shopList(shop_idx);
		System.out.println("id="+email);
		String pageStr=PageModule.makePage("bbsList.do", totalCnt, listSize, pageSize, cp, shop_idx);
		List<BbsDTO> list=bbsDao.bbsList(cp, listSize);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("dto", dto);
		mav.addObject("email", email);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("list", list);
		mav.setViewName("bbs/bbsList");
		return mav;
	}
	
	@RequestMapping(value="/bbsWrite.do",method=RequestMethod.GET)
	public ModelAndView bbsWriteForm(int shop_idx) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("shop_idx",shop_idx);
		mav.setViewName("bbs/bbsWrite");
		return mav;
	}
	
	@RequestMapping(value="/bbsWrite.do",method=RequestMethod.POST)
	public ModelAndView bbsWriteSubmit(BbsDTO dto, @RequestParam(value="star", defaultValue="1")int star,int shop_idx,HttpSession session) {
		int result=bbsDao.bbsWrite(dto,star);
		String msg=result>0?"작성 성공":"실패";
		session.setAttribute("bbsWriter", dto.getReview_writer());
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("gopage", "bbsList.do?shop_idx="+shop_idx);
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
	@RequestMapping("/bbsContent.do")
	public ModelAndView bbsContent(@RequestParam("review_idx")int review_idx) {
		BbsDTO dto=bbsDao.bbsContent(review_idx);
		ModelAndView mav=new ModelAndView();
		
		if(dto==null) {
			mav.addObject("msg", "잘못된 접근 또는 삭제된 게시글 이니다.");
			mav.addObject("gopage", "bbsList.do");
			mav.setViewName("bbs/bbsMsg");
		}else {
			dto.setReview_content(dto.getReview_content().replaceAll("\n", "<br>"));
			mav.addObject("dto", dto);
			mav.setViewName("bbs/bbsContent");
		}
		return mav;
	}
	
//	@RequestMapping("/shopInfo.do")
//	public ModelAndView shopList(@RequestParam("shop_idx")int shop_idx) {
//		
//		ShopDTO dto=bbsDao.shopList(shop_idx);
//		List<BbsDTO> list=bbsDao.shopReview(shop_idx);
//		ModelAndView mav=new ModelAndView();
//		
//		mav.addObject("shop_idx",shop_idx);
//		mav.addObject("dto", dto);
//		mav.addObject("list", list);
//		mav.setViewName("bbs/shopInfo");
//		return mav;
//	}
	@RequestMapping("/shopInfo.do")
	public ModelAndView shopInfo(@RequestParam(value="cp",defaultValue="1")int cp, int shop_idx, HttpSession session) { 
		//defaultValue 가 무조건 값을 넣어주므로 required를 적용할 필요가 없다.
		
		int totalCnt=bbsDao.getTotalCnt();
		int listSize=3;
		int pageSize=3;
		
		String email=(String) session.getAttribute("id");
		ShopDTO dto=bbsDao.shopList(shop_idx);
		System.out.println("id="+email);
		String pageStr=PageModule.makePage("shopInfo.do", totalCnt, listSize, pageSize, cp, shop_idx);
		List<BbsDTO> list=bbsDao.bbsList2(cp, listSize, shop_idx);
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("pageStr", pageStr);
		mav.addObject("dto", dto);
		mav.addObject("email", email);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("list", list);
		mav.setViewName("bbs/shopInfo");
		return mav;
	}

	@RequestMapping("/bbsDel.do")
	public ModelAndView bbsDel(@RequestParam("review_idx")int review_idx,int shop_idx){
		int result=bbsDao.bbsDel(review_idx);
		String msg=result>0?"글 삭제 성공":"글 삭제 실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("gopage", "bbsList.do?shop_idx="+shop_idx);
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
	
	@RequestMapping(value="/bbsUpdateForm.do")
	public ModelAndView bbsUpdateForm(int review_idx,int shop_idx) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("review_idx",review_idx);
		mav.addObject("shop_idx",shop_idx);
		mav.setViewName("bbs/bbsUpdate");
		return mav;
	}

	@RequestMapping(value="/bbsUpdate.do")
	public ModelAndView bbsUpdateSubmit(int review_idx,BbsDTO dto,int shop_idx,@RequestParam(value="star", defaultValue="1")int star){
		System.out.println("1212="+dto.getReview_idx());
		System.out.println("review_idx="+review_idx);
		int result=bbsDao.bbsUpdate(review_idx,dto,star);
		String msg=result>0?"작성 성공":"실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", shop_idx);
		mav.addObject("gopage", "bbsList.do?shop_idx="+shop_idx);
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
	
	@RequestMapping("/bookMark.do")
	public ModelAndView bookMark() {
		
		List<ShopDTO> list=bbsDao.bookList();
		
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("list", list);
		mav.setViewName("bbs/bookMark");
		return mav;
		
	}

	
	@RequestMapping(value="/bookPage.do",method=RequestMethod.GET)
	public ModelAndView bookmarkPage(ShopDTO dto){

		int result=bbsDao.bookmarkPage(dto);
		String msg=result>0?"작성 성공":"실패";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", msg);
		mav.addObject("gopage", "shopInfo.do");
		mav.setViewName("bbs/bbsMsg");
		return mav;
	}
	
	
	
	
	
	//어플리케이션 생성
	@RequestMapping(value="/bookmarkPage.do", method=RequestMethod.GET)
	public String bookmarkPage(HttpServletResponse response,HttpSession session,@RequestParam("Shop_idx")int idx,
			ServletContext app){
	
	session.setAttribute("email", 2);	
	int member_id=(Integer)session.getAttribute("email");	
	HashMap<Integer, ArrayList> map=new HashMap<Integer, ArrayList>();
	ArrayList<Integer> shop=new ArrayList<Integer>();
	shop.add(idx);
	map.put(member_id, shop);
	
	// application = ser.getServletContext();
	
	app.setAttribute("shopf", map);
	app.setAttribute("menuf", map);
	
//	(2) 생성: application = this.getServletContext();
//
//	(3) 추가: application.setAttribute("키","값");
//
//	(4) 삭제:application.removeAttribute("키","값");
//
//	(5) 획득: Object obj = application.getAttribute("키");

	
//	Cookie setCookie = new Cookie("shopf", map); // 쿠키 생성
//	setCookie.setMaxAge(60*60*24); // 기간을 하루로 지정
//	response.addCookie(setCookie);
	return bookmarkPage;
	}
	
	
	
	//특정 쿠키 제거
//	@RequestMapping(value="/bookPage.do", method=RequestMethod.GET)
//	public String bookmarkPage2(HttpServletResponse response){
//	Cookie kc = new Cookie("choiceCookieName", null); // choiceCookieName(쿠키 이름)에 대한 값을 null로 지정
//	kc.setMaxAge(0); // 유효시간을 0으로 설정
//	response.addCookie(kc); // 응답 헤더에 추가해서 없어지도록 함
//	return bookmarkPage;
//	}
	
	
		
	
}













