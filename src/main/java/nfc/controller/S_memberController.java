package nfc.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.s_member.model.s_memberDAO;
import nfc.s_member.model.s_memberDTO;
import nfc.order.model.OrderDAO;
import nfc.warehousing.model.ShopDTO;

@Controller
public class S_memberController {

	@Autowired
	private OrderDAO orderDao;
	
	@Autowired
	public s_memberDAO smemberDao;

	@RequestMapping(value = "shopPageindex.do", method = RequestMethod.GET)
	public String loginForm() {
		return "shop_member/login";
	}

	@RequestMapping(value = "shopPageindex.do", method = RequestMethod.POST)
	public ModelAndView login(s_memberDTO dto, String ck, HttpSession session, HttpServletResponse res) {
		int result = 0;
		String msg = "";
		if(dto.equals("")==true){
			msg = "아이디, 패스워드 또는 매장번호를  확인해주세요.";
		}
		result = smemberDao.memberLogin(dto.getShop_idx(), dto.getShop_member_id(), dto.getShop_member_pwd());
		
		ShopDTO dto2=orderDao.wshopName(dto.getShop_idx());
		
		
		if (result == 1) {
			msg = dto.getShop_member_id() + "님 환영합니다.";
			session.setAttribute("id", dto.getShop_member_id());
			if (ck == null || ck.equals("")) {
				Cookie cookie = new Cookie("ck", dto.getShop_member_id());
				cookie.setMaxAge(0);
				res.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("ck", dto.getShop_member_id());
				cookie.setMaxAge(60 * 60 * 24 * 30);// 30일동안 아이디 기억하기(쿠키 생성)
				res.addCookie(cookie);
			}
		} else {
			msg = "아이디, 패스워드 또는 매장번호를  확인해주세요.";
		}

		ModelAndView mav = new ModelAndView();
		mav.addObject("result", result);
		mav.addObject("msg", msg);
		mav.addObject("shop_idx", dto.getShop_idx());
		mav.addObject("shop_name", dto2.getShop_name());
		mav.setViewName("shop_member/loginMsg");

		return mav;
	}

	@RequestMapping("/smemberLogout.do")
	public ModelAndView logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();// 세션 삭제

		ModelAndView mav = new ModelAndView();

		mav.setViewName("redirect:/shopPageindex.do");
		return mav;
	}

}
