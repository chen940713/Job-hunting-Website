package cn.jxust.ssh.model;

public class Middle {
	private Integer middle_id;
	private String  customerName;
	private Integer jobinfoId;
	private Integer companyId;
	public Integer getMiddle_id() {
		return middle_id;
	}
	public void setMiddle_id(Integer middle_id) {
		this.middle_id = middle_id;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Integer getJobinfoId() {
		return jobinfoId;
	}
	public void setJobinfoId(Integer jobinfoId) {
		this.jobinfoId = jobinfoId;
	}
	public Integer getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Integer companyId) {
		this.companyId = companyId;
	}
	@Override
	public String toString() {
		return "Middle [middle_id=" + middle_id + ", customerName=" + customerName + ", jobinfoId=" + jobinfoId
				+ ", companyId=" + companyId + "]";
	}
	

	
	
}
