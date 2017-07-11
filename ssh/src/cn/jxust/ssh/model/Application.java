package cn.jxust.ssh.model;

public class Application {
	
	private Integer appli_id;
	private String appli_name;
	private String appli_profession;
	private String appli_position;
	private String wanted_salary_first;
	private String wanted_salary_second;
	private String period;
	private String work_place;

	//属于哪个用户发布的求职信息
	private Customer customer;
	
	
	
	public Integer getAppli_id() {
		return appli_id;
	}
	public void setAppli_id(Integer appli_id) {
		this.appli_id = appli_id;
	}
	public String getAppli_name() {
		return appli_name;
	}
	public void setAppli_name(String appli_name) {
		this.appli_name = appli_name;
	}
	public String getAppli_profession() {
		return appli_profession;
	}
	public void setAppli_profession(String appli_profession) {
		this.appli_profession = appli_profession;
	}
	public String getAppli_position() {
		return appli_position;
	}
	public void setAppli_position(String appli_position) {
		this.appli_position = appli_position;
	}
	public String getWanted_salary_first() {
		return wanted_salary_first;
	}
	public void setWanted_salary_first(String wanted_salary_first) {
		this.wanted_salary_first = wanted_salary_first;
	}
	public String getWanted_salary_second() {
		return wanted_salary_second;
	}
	public void setWanted_salary_second(String wanted_salary_second) {
		this.wanted_salary_second = wanted_salary_second;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getWork_place() {
		return work_place;
	}
	public void setWork_place(String work_place) {
		this.work_place = work_place;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	
	
}
