package logic.myspring.vo;

public class LogicSave {
	private int mapid;
	private String userid;
	private String content;
	
	public LogicSave() {}
	public LogicSave(int mapid, String userid) {
		this.mapid = mapid;
		this.userid = userid;
	}
	public LogicSave(int mapid, String userid, String content) {
		this.mapid = mapid;
		this.userid = userid;
		this.content = content;
	}
	public int getMapid() {
		return mapid;
	}
	public void setMapid(int mapid) {
		this.mapid = mapid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "LogicSave [mapid=" + mapid + ", userid=" + userid + ", content=" + content + "]";
	}
	
	
}
