package spring.mvc.baobob.vo;

public class HostMovieChartVO {
	private String kind;
	private int value;
	
	@Override
	public String toString() {
		return Integer.toString(value);
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	

}
