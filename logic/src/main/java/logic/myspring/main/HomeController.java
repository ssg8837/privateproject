package logic.myspring.main;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import logic.myspring.mapper.LogicMapper;
import logic.myspring.vo.LogicUser;



/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	HttpSession httpSession;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) 
	{		
		return "home";
	}
	@RequestMapping(value = "/openMenu", method = RequestMethod.POST)
	public @ResponseBody boolean login(LogicUser logicUser) 
	{
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		Boolean forreturn=false;
		LogicUser result=null;
		result=mapper.selectLogicUser(logicUser);
		if(result!=null)
		{
			forreturn=true;
			httpSession.setAttribute("loginid", result.getUserid());
			System.out.println(String.format("id:%s pw:%s", result.getUserid(),result.getUserpwd()));
		}
		return forreturn;
	}
}
