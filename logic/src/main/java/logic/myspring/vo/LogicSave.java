package logic.myspring.vo;

public class LogicSave {
	private int saveid;
	private int mapid;
	private String id;
	private String content;
	
	public LogicSave() {}
	public LogicSave(int saveid, int mapid, String id, String content) {
		this.saveid = saveid;
		this.mapid = mapid;
		this.id = id;
		this.content = content;
	}
	public int getSaveid() {
		return saveid;
	}
	public void setSaveid(int saveid) {
		this.saveid = saveid;
	}
	public int getMapid() {
		return mapid;
	}
	public void setMapid(int mapid) {
		this.mapid = mapid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
