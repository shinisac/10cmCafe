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

import nfc.admin_member.model.Admin_memberDAO;
import nfc.admin_member.model.Admin_memberDTO;

@Controller
public class Admin_totalMemberController {
	
	@Autowired
	private Admin_memberDAO adminmemberDao;
	
	@RequestMapping(value = "admin_index.do", method = RequestMethod.GET)
	public String loginForm() {
		return "admin/admin_member/admin_login";
	}
	
	@RequestMapping(value = "admin_index.do", method = RequestMethod.POST)
	public ModelAndView adminLogin(Admin_memberDTO dto, @RequestParam(value="ck", required=false)String ck,HttpSession session, HttpServletResponse resp) { 
		String msg="";
	
		int result=adminmemberDao.adminMemberLogin(dto.getAdmin_member_id(),dto.getAdmin_member_pwd());
		
		ModelAndView mav = new ModelAndView();
		if (result == 1) {
			msg = dto.getAdmin_member_id() + "님 환영합니다.";
			session.setAttribute("admin_member_id",dto.getAdmin_member_id());
			if (ck == null || ck.equals("")) {
				Cookie cookie = new Cookie("ck",dto.getAdmin_member_id());
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("ck", dto.getAdmin_member_id());
				cookie.setMaxAge(60 * 60 * 24 * 30);// 30일동안 아이디 기억하기(쿠키 생성)
				resp.addCookie(cookie);
			}
		}else{
			msg="아이디, 패스워드를 확인해주세요.";
		}
		
		mav.addObject("result", result);
		mav.addObject("msg", msg);
		mav.setViewName("admin/admin_member/admin_loginMsg");

		return mav;
	}
	
	@RequestMapping("/adminLogout.do")
	public ModelAndView adminLogout(HttpServletRequest req) {
		HttpSession session=req.getSession();
		session.invalidate();
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/admin_index.do");
		return mav;
	}
}

