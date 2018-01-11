package spring.mvc.baobob.vo;

public class ParkingFee {
//park_fee
	private int p_fee_exc_price;
	private int p_fee_exc_time;
	private int p_fee_base_price;
	private int p_fee_base_time;

	public int getP_fee_exc_price() {
		return p_fee_exc_price;
	}

	public void setP_fee_exc_price(int p_fee_exc_price) {
		this.p_fee_exc_price = p_fee_exc_price;
	}

	public int getP_fee_exc_time() {
		return p_fee_exc_time;
	}

	public void setP_fee_exc_time(int p_fee_exc_time) {
		this.p_fee_exc_time = p_fee_exc_time;
	}

	public int getP_fee_base_price() {
		return p_fee_base_price;
	}

	public void setP_fee_base_price(int p_fee_base_price) {
		this.p_fee_base_price = p_fee_base_price;
	}

	public int getP_fee_base_time() {
		return p_fee_base_time;
	}

	public void setP_fee_base_time(int p_fee_base_time) {
		this.p_fee_base_time = p_fee_base_time;
	}

	@Override
	public String toString() {
		return "ep" + p_fee_exc_price + "/et" + p_fee_exc_time + "/bp" + p_fee_base_price+ "/bt=" + p_fee_base_time;
	}
}
