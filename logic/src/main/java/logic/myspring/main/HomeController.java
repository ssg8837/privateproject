package logic.myspring.main;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import logic.myspring.mapper.LogicMapper;
import logic.myspring.util.PageReader;
import logic.myspring.vo.LogicEnd;
import logic.myspring.vo.LogicMap;
import logic.myspring.vo.LogicSave;
import logic.myspring.vo.LogicUser;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	final int BLANK='0';
	final int CORRECT='1';
	final int WRONG='2';
	final int XCHECK='3';

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	HttpSession httpSession;
	

	final int countPerPage = 10;
	final int pagePerGroup = 5;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home()
	{		
		return "home";
	}
	@RequestMapping(value = "/howplay", method = RequestMethod.GET)
	public String howplay()
	{		
		return "howplay";
	}
	@RequestMapping(value = "/openNewUser", method = RequestMethod.GET)
	public String openNewUser()
	{		
		return "newUser";
	}
	@RequestMapping(value = "/openLogin", method = RequestMethod.GET)
	public String openLogin()
	{		
		return "login";
	}
	//openCreateLogic
	@RequestMapping(value = "/openCreateLogic", method = RequestMethod.POST)
	public String openCreateLogic(Model model,String width, String height)
	{	
		String loginid=(String)httpSession.getAttribute("loginid");
		if(loginid!=null)
		{
			model.addAttribute("width", Integer.parseInt(width));
			model.addAttribute("height", Integer.parseInt(height));
			model.addAttribute("loginid",loginid);
			return "createLogic";
		}
		else
		{
			return "home";
		}
	}
	//openLogicPlay
	@RequestMapping(value = "/openLogicPlay", method = RequestMethod.POST)
	public String openLogicPlay(Model model,int mapid)
	{	
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		LogicMap map=mapper.selectLogicMap(mapid);
		model.addAttribute("map", map);
		String loginid=(String)httpSession.getAttribute("loginid");
		LogicSave save=mapper.selectLogicSave(new LogicSave(mapid,loginid));
		if(save!=null)
		{
			model.addAttribute("savedlogic", save.getContent());
			model.addAttribute("saved", "true");
		}
		else
		{
			
			model.addAttribute("saved", "false");
		}
		model.addAttribute("loginid",loginid);
		return "logicPlay";
	}
	
	@RequestMapping(value = "/openLogicShow", method = RequestMethod.POST)
	public String openLogicShow(Model model, String userid,String mapid)
	{	
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);		
		LogicEnd result=mapper.selectLogicEnd(new LogicEnd(mapid, userid));

		LogicMap map=mapper.selectLogicMap(Integer.parseInt(mapid));
		if(result!=null)
		{
			model.addAttribute("userid", userid);
			model.addAttribute("width", map.getWidth());
			model.addAttribute("title", map.getMapname());
			model.addAttribute("height", map.getHeight());
			model.addAttribute("logic", result.getContent());
			return "showLogic";
		}
		else
		{
			return "home";
		}
	}
	
	@RequestMapping(value = "/openShowClear", method = RequestMethod.POST)
	public String openShowClear(Model model, String userid)
	{	
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);		
		List<LogicEnd> result=mapper.selectLogicEndList(userid);
		if(result!=null)
		{
			String[] title=new String[result.size()];
			String[] maker=new String[result.size()];
			int[] howwrong=new int[result.size()];
			String[] mapid=new String[result.size()];
			for(int i=0;i<result.size();i++)
			{
				LogicEnd temp=result.get(i);
				LogicMap map=mapper.selectLogicMap(Integer.parseInt(temp.getMapid()));
				howwrong[i]=temp.getHowwrong();
				title[i]=map.getMapname();
				maker[i]=map.getUserid();
				mapid[i]=temp.getMapid();
			}
			model.addAttribute("howwrong", howwrong);
			model.addAttribute("title", title);
			model.addAttribute("maker", maker);
			model.addAttribute("mapid", mapid);
			return "ShowClear";
		}
		else
		{
			return "home";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout()
	{
		httpSession.invalidate();
		return "home";
	}
	@RequestMapping(value = "/openLogicList", method = RequestMethod.GET)
	public String openLogicList(Model model, @RequestParam(value="page", defaultValue="1") int page, String searchText)
	{
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		
		PageReader reader = new PageReader(countPerPage, pagePerGroup, page, mapper.countLogicMap());
		RowBounds rb = new RowBounds(reader.getStartRecord(), reader.getCountPerPage());

		List<LogicMap> mapList=mapper.selectLogicList(searchText, rb);
		model.addAttribute("maplist", mapList);
		model.addAttribute("pageNum", page);
		model.addAttribute("reader", reader);
		model.addAttribute("searchText", searchText);
		return "logicList";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public @ResponseBody boolean login(LogicUser logicUser) 
	{
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		Boolean forreturn=false;
		int result=mapper.selectLogicUser(logicUser);
		if(result!=0)
		{
			forreturn=true;
			httpSession.setAttribute("loginid", logicUser.getUserid());
		}
		return forreturn;
	}
	//checkAndInsertUser
	@RequestMapping(value = "/checkAndInsertUser", method = RequestMethod.POST)
	public @ResponseBody boolean checkAndInsertUser(LogicUser logicUser) 
	{
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		Boolean forreturn=false;
		int result=mapper.checkLogicUser_Userid(logicUser.getUserid());
		if(result==0&&logicUser.getUserpwd().length()>0)
		{
			result=mapper.insertLogicUser(logicUser);
			if(result!=0)
			{
				forreturn=true;
			}
		}
		return forreturn;
	}
	//로직 퍼즐 만들기
	@RequestMapping(value = "/createLogic", method = RequestMethod.POST)
	public @ResponseBody boolean createLogic(LogicMap map) 
	{
		
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		int result=mapper.insertLogicMap(map);
		if(result>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@RequestMapping(value = "/saveLogic", method = RequestMethod.POST)
	public @ResponseBody boolean saveLogic(LogicSave save) 
	{
		
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		mapper.deleteLogicSave(save);
		int result=mapper.insertLogicSave(save);
		if(result>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	@RequestMapping(value = "/deleteLogicSave", method = RequestMethod.POST)
	public @ResponseBody boolean deleteLogicSave(LogicSave save) 
	{
		
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		int result=mapper.deleteLogicSave(save);
		if(result>0)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	//endLogicGame
	@RequestMapping(value = "/endLogicGame", method = RequestMethod.POST)
	public @ResponseBody int endLogicGame(LogicEnd end) 
	{
		
		LogicMapper mapper=sqlSession.getMapper(LogicMapper.class);
		String corretAns=mapper.selectLogicMap(Integer.parseInt(end.getMapid())).getContent();
		String content=end.getContent();
		int howWrong=end.getHowwrong();
		for(int i=0;i<content.length();i++)
		{
			char num=content.charAt(i);
			char correctNum=corretAns.charAt(i);
			if(correctNum==CORRECT&&num!=CORRECT)
			{
				howWrong++;
			}
		}
		end.setHowwrong(howWrong);
		mapper.deleteLogicEnd(end);
		mapper.insertLogicEnd(end);
		return howWrong;
	}
}
