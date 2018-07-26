package logic.myspring.vo;

public class MapForAjax {
	String userid;
	String mapname;
	int height; 
	int width;
	String[][] logic;
	public MapForAjax() {
	}

	public MapForAjax(String userid, String mapname, int height, int width, String[][] logic) {
		this.userid = userid;
		this.mapname = mapname;
		this.height = height;
		this.width = width;
		this.logic = logic;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getMapname() {
		return mapname;
	}

	public void setMapname(String mapname) {
		this.mapname = mapname;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public String[][] getLogic() {
		return logic;
	}

	public void setLogic(String[][] logic) {
		this.logic = logic;
	}

}
