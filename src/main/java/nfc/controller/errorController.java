package nfc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class errorController {
	

	
	//throwable 오류
    @RequestMapping(value="/throwable.do", method=RequestMethod.GET)
    public ModelAndView throwable() throws Exception{
        ModelAndView mv = new ModelAndView();
       
        mv.addObject("MSG", "예외가 발생하였습니다.");
        mv.setViewName("error/errorPage");
        return mv;
    }
    
    //exception 오류
    @RequestMapping(value="/exception.do", method=RequestMethod.GET)
    public ModelAndView exception() throws Exception{
        ModelAndView mv = new ModelAndView();
        
   
        mv.addObject("MSG", "예외가 발생하였습니다.");
        mv.setViewName("error/errorPage");
        return mv;
    }
    
    //400 오류
    @RequestMapping(value="/error400.do", method=RequestMethod.GET)
    public ModelAndView error400() throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.addObject("MSG", "잘못된 요청입니다.");
        mv.setViewName("error/errorPage");
        return mv;
    }
    
    //403 오류
    @RequestMapping(value="/error403.do", method=RequestMethod.GET)
    public ModelAndView error403() throws Exception{
        ModelAndView mv = new ModelAndView();
        
      
        mv.addObject("MSG", "접근이 금지되었습니다.");
        mv.setViewName("error/errorPage");
        return mv;
    }
    
    //404 오류
    @RequestMapping(value="/error404.do", method=RequestMethod.GET)
    public ModelAndView error404() throws Exception{
        ModelAndView mv = new ModelAndView();
      
        mv.addObject("MSG", "서비스를 사용할 수 없습니다.");
        mv.setViewName("error/errorPage");
        return mv;
    }
    
}

