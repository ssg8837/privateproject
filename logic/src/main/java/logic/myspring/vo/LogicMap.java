package logic.myspring.vo;

public class LogicMap {
	private int mapid;
	private String mapname;
	private int width;
	private int height;
	private String userid;
	private String content;
	
	public LogicMap(){ }
	public LogicMap(int mapid, String mapname, int width, int height, String userid, String content) {
		this.mapid = mapid;
		this.mapname =mapname;
		this.width = width;
		this.height = height;
		this.userid = userid;
		this.content = content;
	}
	public LogicMap(String mapname, int width, int height, String userid, String content) {
		this.mapname =mapname;
		this.width = width;
		this.height = height;
		this.userid = userid;
		this.content = content;
	}
	
	public LogicMap(int mapid, String mapname, int width, int height, String id) {
		this.mapid = mapid;
		this.mapname = mapname;
		this.width = width;
		this.height = height;
	}
	public int getMapid() {
		return mapid;
	}
	public void setMapid(int mapid) {
		this.mapid = mapid;
	}
	public String getMapname() {
		return mapname;
	}
	public void setMapname(String mapname) {
		this.mapname = mapname;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
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
		return "LogicMap [mapid=" + mapid + ", mapname=" + mapname + ", width=" + width + ", height=" + height
				+ ", userid=" + userid + ", content=" + content + "]";
	}
	
	
}
