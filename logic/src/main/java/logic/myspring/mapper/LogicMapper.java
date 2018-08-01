package logic.myspring.mapper;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import logic.myspring.vo.LogicEnd;
import logic.myspring.vo.LogicMap;
import logic.myspring.vo.LogicSave;
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
	public int insertLogicSave(LogicSave save);
	public int deleteLogicSave(LogicSave save);
	public LogicSave selectLogicSave(LogicSave save);
	public void deleteLogicEnd(LogicEnd end);
	public int insertLogicEnd(LogicEnd end);
	public LogicEnd selectLogicEnd(LogicEnd logicEnd);
	public List<LogicEnd> selectLogicEndList(String userid);
}
