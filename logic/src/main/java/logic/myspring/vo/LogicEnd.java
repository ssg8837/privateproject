package logic.myspring.vo;

public class LogicEnd {
	private String mapid;
	private String userid;
	private int howwrong;
	private String content;
	
	public LogicEnd() {
	}
	public LogicEnd(String mapid, String userid) {
		this.mapid = mapid;
		this.userid = userid;
	}
	public LogicEnd(String mapid,  int howwrong) {
		this.mapid = mapid;
		this.howwrong = howwrong;
	}
	public LogicEnd(String mapid, String userid, int howwrong,String content) {
		this.mapid = mapid;
		this.userid = userid;
		this.howwrong = howwrong;
		this.content=content;
	}
	public String getMapid() {
		return mapid;
	}
	public void setMapid(String mapid) {
		this.mapid = mapid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getHowwrong() {
		return howwrong;
	}
	public void setHowwrong(int howwrong) {
		this.howwrong = howwrong;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	

}
