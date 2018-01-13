package spring.mvc.baobob.vo;

import java.sql.Timestamp;

public class EmployeeVO {
	private int employee_index;
	private String member_id;
	private String employee_jumin2;
	private Timestamp employee_date;
	
	public int getEmployee_index() {
		return employee_index;
	}
	public void setEmployee_index(int employee_index) {
		this.employee_index = employee_index;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getEmployee_jumin2() {
		return employee_jumin2;
	}
	public void setEmployee_jumin2(String employee_jumin2) {
		this.employee_jumin2 = employee_jumin2;
	}
	public Timestamp getEmployee_date() {
		return employee_date;
	}
	public void setEmployee_date(Timestamp employee_date) {
		this.employee_date = employee_date;
	}
}
