package cn.jxust.ssh.model;

import java.util.Date;

/**
 * 	招聘信息的实体类
 *
 */
public class Jobinfo {
	
	private Integer jobinfo_id;
	private String position;
	private Integer salary;
	private String workplace;
	private String publish_date;
	private String experience;
	private String education;
	private String content;

	//属于哪个公司发布的招聘信息
	private Company company;

	public Integer getJobinfo_id() {
		return jobinfo_id;
	}

	public void setJobinfo_id(Integer jobinfo_id) {
		this.jobinfo_id = jobinfo_id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getSalary() {
		return salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getWorkplace() {
		return workplace;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	public String getPublish_date() {
		return publish_date;
	}

	public void setPublish_date(String publish_date) {
		this.publish_date = publish_date;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Jobinfo [jobinfo_id=" + jobinfo_id + ", position=" + position + ", salary=" + salary + ", workplace="
				+ workplace + ", publish_date=" + publish_date + ", experience=" + experience + ", education="
				+ education + ", content=" + content + ", company=" + company + "]";
	}
	
	
}
