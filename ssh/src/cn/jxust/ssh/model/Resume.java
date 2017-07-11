package cn.jxust.ssh.model;

public class Resume {

	// 简历个人信息
	private Integer resume_id;
	private String person_name;
	private String person_sex;
	private String person_address;
	private String pro_and_hobby;
	private String cellphone;
	private String person_email;
	private String introduce_and_evaluate;
	private String graduation;
	private String experience_date1;
	private String experience_title1;
	private String experience_content1;
	private String experience_date2;
	private String experience_title2;
	private String experience_content2;
	private String experience_date3;
	private String experience_title3;
	private String experience_content3;
	private Integer about_skill1;
	private Integer about_skill2;
	private Integer about_skill3;
	private Integer about_skill4;
	// 简历属于哪个用户
	private Customer customer;
	public Integer getResume_id() {
		return resume_id;
	}

	public void setResume_id(Integer resume_id) {
		this.resume_id = resume_id;
	}

	public String getPerson_name() {
		return person_name;
	}

	public void setPerson_name(String person_name) {
		this.person_name = person_name;
	}

	public String getPerson_sex() {
		return person_sex;
	}

	public void setPerson_sex(String person_sex) {
		this.person_sex = person_sex;
	}

	public String getPerson_address() {
		return person_address;
	}

	public void setPerson_address(String person_address) {
		this.person_address = person_address;
	}

	public String getPro_and_hobby() {
		return pro_and_hobby;
	}

	public void setPro_and_hobby(String pro_and_hobby) {
		this.pro_and_hobby = pro_and_hobby;
	}

	public String getCellphone() {
		return cellphone;
	}

	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}

	public String getPerson_email() {
		return person_email;
	}

	public void setPerson_email(String person_email) {
		this.person_email = person_email;
	}

	public String getIntroduce_and_evaluate() {
		return introduce_and_evaluate;
	}

	public void setIntroduce_and_evaluate(String introduce_and_evaluate) {
		this.introduce_and_evaluate = introduce_and_evaluate;
	}

	public String getGraduation() {
		return graduation;
	}

	public void setGraduation(String graduation) {
		this.graduation = graduation;
	}

	public String getExperience_date1() {
		return experience_date1;
	}

	public void setExperience_date1(String experience_date1) {
		this.experience_date1 = experience_date1;
	}

	public String getExperience_title1() {
		return experience_title1;
	}

	public void setExperience_title1(String experience_title1) {
		this.experience_title1 = experience_title1;
	}

	public String getExperience_content1() {
		return experience_content1;
	}

	public void setExperience_content1(String experience_content1) {
		this.experience_content1 = experience_content1;
	}

	public String getExperience_date2() {
		return experience_date2;
	}

	public void setExperience_date2(String experience_date2) {
		this.experience_date2 = experience_date2;
	}

	public String getExperience_title2() {
		return experience_title2;
	}

	public void setExperience_title2(String experience_title2) {
		this.experience_title2 = experience_title2;
	}

	public String getExperience_content2() {
		return experience_content2;
	}

	public void setExperience_content2(String experience_content2) {
		this.experience_content2 = experience_content2;
	}

	public String getExperience_date3() {
		return experience_date3;
	}

	public void setExperience_date3(String experience_date3) {
		this.experience_date3 = experience_date3;
	}

	public String getExperience_title3() {
		return experience_title3;
	}

	public void setExperience_title3(String experience_title3) {
		this.experience_title3 = experience_title3;
	}

	public String getExperience_content3() {
		return experience_content3;
	}

	public void setExperience_content3(String experience_content3) {
		this.experience_content3 = experience_content3;
	}

	public Integer getAbout_skill1() {
		return about_skill1;
	}

	public void setAbout_skill1(Integer about_skill1) {
		this.about_skill1 = about_skill1;
	}

	public Integer getAbout_skill2() {
		return about_skill2;
	}

	public void setAbout_skill2(Integer about_skill2) {
		this.about_skill2 = about_skill2;
	}

	public Integer getAbout_skill3() {
		return about_skill3;
	}

	public void setAbout_skill3(Integer about_skill3) {
		this.about_skill3 = about_skill3;
	}

	public Integer getAbout_skill4() {
		return about_skill4;
	}

	public void setAbout_skill4(Integer about_skill4) {
		this.about_skill4 = about_skill4;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "Resume [resume_id=" + resume_id + ", person_name=" + person_name + ", person_sex=" + person_sex
				+ ", person_address=" + person_address + ", pro_and_hobby=" + pro_and_hobby + ", cellphone=" + cellphone
				+ ", person_email=" + person_email + ", introduce_and_evaluate=" + introduce_and_evaluate
				+ ", graduation=" + graduation + ", experience_date1=" + experience_date1 + ", experience_title1="
				+ experience_title1 + ", experience_content1=" + experience_content1 + ", experience_date2="
				+ experience_date2 + ", experience_title2=" + experience_title2 + ", experience_content2="
				+ experience_content2 + ", experience_date3=" + experience_date3 + ", experience_title3="
				+ experience_title3 + ", experience_content3=" + experience_content3 + ", about_skill1=" + about_skill1
				+ ", about_skill2=" + about_skill2 + ", about_skill3=" + about_skill3 + ", about_skill4=" + about_skill4
				+ ", customer=" + customer + "]";
	}
	
	
}
