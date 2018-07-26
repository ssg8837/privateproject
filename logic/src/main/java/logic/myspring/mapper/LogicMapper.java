package logic.myspring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;

import logic.myspring.vo.LogicMap;
import logic.myspring.vo.LogicUser;

public interface LogicMapper 
{
	public int selectLogicUser(LogicUser logicUser);
	public int checkLogicUser_Userid(String userid);
	public int insertLogicUser(LogicUser logicUser);
	public int countLogicMap();
	public List<LogicMap> selectLogicList(String searchText, RowBounds rb);
	public int insertLogicMap(LogicMap logicMap);
	public LogicMap selectLogicMap(int mapid);
}
