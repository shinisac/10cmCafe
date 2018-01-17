package nfc.admin.controller;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import nfc.member.model.MemberDAO;
import nfc.member.model.MemberDTO;


@Controller
public class admin_memberController {

	@Autowired
	private MemberDAO memberDao;
	
	
	
	//회원 리스트 폼
	@RequestMapping("/admin_memberListForm.do")
	public String admin_memberListForm() {
		return "admin/admin_memberList";
	}
	
	@RequestMapping("/admin_memberList.do")
	public ModelAndView admin_memberList(@RequestParam(value="cp",defaultValue="1")int cp) {
		
		ModelAndView mav=new ModelAndView();
		int totalCnt=memberDao.getMemberTotal();
		int ls=5; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수
		
		String pagestr=nfc.page.pageModuleMember.makePage("admin_memberListForm.do", totalCnt, ls, pageSize, cp);
		
		String sel="null";
		String key="";
		//List<MemberDTO> dto=memberDao.admin_memberList();
		List<MemberDTO> allList=memberDao.admin_memberFind(sel,key,ls,cp);
		mav.addObject("allList",allList);
		mav.addObject("pagestr",pagestr);
		mav.addObject("cp",cp);
		mav.addObject("sel",sel);
		
		mav.setViewName("admin/admin_memberAllListajax");
		return mav;
	}
	//회원검색
	@RequestMapping("/admin_member_find.do")
	public ModelAndView admin_memberFind(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="sel")String sel ,@RequestParam(value="tx",defaultValue="not")String keyword) {
		ModelAndView mav=new ModelAndView();
	
		int totalCnt=memberDao.getMemberFindTotal(sel,keyword);
		int ls=5; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수
		String pagestr=nfc.page.pageModuleMember.makePage("admin_memberListForm.do", totalCnt, ls, pageSize, cp);
		List<MemberDTO> findList=memberDao.admin_memberFind(sel, keyword,ls,cp);	
		mav.addObject("findList",findList);
		mav.addObject("pagestr",pagestr);
		mav.addObject("cp",cp);
		mav.addObject("sel",sel);
		mav.addObject("tx",keyword);
		mav.setViewName("admin/admin_memberFindajax");
		return mav;
	}
	
	//회원 탈퇴 리스트 폼
	@RequestMapping("admin_memberOutListForm.do")
	public String admin_memberOutListForm() {
		return "admin/admin_memberOutList";
	}
	@RequestMapping("/admin_memberOutList.do")
	public ModelAndView admin_memberOutList(@RequestParam(value="cp",defaultValue="1")int cp) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=memberDao.getMemberOutTotal();
		int ls=5; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수
		
		String sel="null";
		String pagestr=nfc.page.pageModuleMember.makePage("admin_memberOutListForm.do", totalCnt, ls, pageSize, cp);
		List<MemberDTO> outList=memberDao.memberOutList(ls,cp);
		mav.addObject("outList",outList);
		mav.addObject("pagestr",pagestr);
		mav.addObject("cp",cp);
		mav.addObject("sel",sel);
		mav.setViewName("admin/admin_memberOutAllListajax");
		return mav;
	}
	//탈퇴 회원검색
	@RequestMapping("/admin_member_outFind.do")
	public ModelAndView admin_memberOutFind(@RequestParam(value="cp",defaultValue="1")int cp,@RequestParam(value="sel")String sel ,@RequestParam(value="tx",defaultValue="not")String keyword) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=memberDao.getMemberOutFindTotal(sel,keyword);
		int ls=5; // 보여줄 리스트수
		int pageSize=5; //보여줄 페이지수
		String pagestr=nfc.page.pageModuleMember.makePage("admin_memberOutListForm.do", totalCnt, ls, pageSize, cp);
		List<MemberDTO> findList=memberDao.admin_memberOutFind(sel, keyword,ls,cp);
		mav.addObject("findList",findList);
		mav.addObject("pagestr",pagestr);
		mav.addObject("cp",cp);
		mav.addObject("sel",sel);
		mav.addObject("tx",keyword);
		mav.setViewName("admin/admin_memberFindajax");
		
		return mav;
	}
	@RequestMapping("/member_info.do")
	public ModelAndView member_info(HttpSession session,@RequestParam(value="idx")int idx) {
		ModelAndView mav=new ModelAndView();
		
		MemberDTO info=memberDao.member_info(idx);
		mav.addObject("info",info);
		mav.setViewName("admin/admin_memberInfo");
		return mav;
	}
	
	@RequestMapping("/admin_pointGiveForm.do")
	public ModelAndView pointGiveForm(@RequestParam(value="idx" ,defaultValue="0")int idx) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("idx",idx);
		mav.setViewName("admin/admin_pointGiveForm");
		return mav;
	}
	@RequestMapping("/pointGive.do")
	public ModelAndView pointGive(@RequestParam(value="point")int point,@RequestParam(value="idx")int idx,@RequestParam(value="point_content")String point_content) {
		ModelAndView mav=new ModelAndView();
		int result=0;
		int result2=0;
		
		if(idx==0) {
			List<MemberDTO> dto=memberDao.getMemberIdxTotal();
			for(int i=0;i<dto.size();i++) {
			idx=dto.get(i).getMember_idx();

			// 전체 포인트 변경
			result=memberDao.member_PointGive(point,idx);
			//포인트 내역변경 
			result2=memberDao.member_pointUpdate(point, idx,point_content);
			
			}
		}else {
			result=memberDao.member_PointGive(point,idx);
			result2=memberDao.member_pointUpdate(point, idx,point_content);
		
		}
		String msg="";
		if(result>0) {
			if(result2>0) {
				msg="포인트 변경성공";
			}
		}else {
				msg="변경실패";
		}
		mav.addObject("msg",msg);
		mav.setViewName("admin/admin_msg");
		return mav;
	}
	//탈퇴회원 완전삭제
	@RequestMapping("/admin_memberDel.do")
	public ModelAndView admin_memberDel(@RequestParam(value="ck")int ck[]) {
		int result=0;
	      for(int i=0; i<ck.length; i++){
	    	  result=memberDao.admin_memberDel(ck[i]);
	      }
		
		ModelAndView mav=new ModelAndView();
		String msg=result>0?"삭제성공":"삭제실패";
		mav.addObject("msg",msg);
		mav.addObject("page","admin_memberOutListForm.do");
		mav.setViewName("admin/admin_delMsg");
		
		return mav;
	}
}










