package spring.mvc.baobob.vo;

public class hostTChartVO {
	
	private int kind;
	private int sum;
	
	@Override
	public String toString() {
		return Integer.toString(sum);
	}

	public int getKind() {
		return kind;
	}
	
	public void setKind(int kind) {
		this.kind = kind;
	}
	
	public int getSum() {
		return sum;
	}
	
	public void setSum(int sum) {
		this.sum = sum;
	}
	
}
