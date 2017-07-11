package cn.jxust.ssh.model;

import java.util.HashSet;
import java.util.Set;

/**
 * 注册公司的实体类
 *
 */
public class Company {
	
	private Integer company_id;
	private String company_name;
	private String company_pwd;
	private Integer company_phone;
	private String company_address;
	private String company_nature;
	private String company_scale;
	private String company_industry;
	private String company_introduce;
	private String company_welfare;
	
	//所发布的招聘信息的集合
	private Set<Jobinfo> jobinfo = new HashSet<Jobinfo>();

	public Integer getCompany_id() {
		return company_id;
	}

	public void setCompany_id(Integer company_id) {
		this.company_id = company_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getCompany_pwd() {
		return company_pwd;
	}

	public void setCompany_pwd(String company_pwd) {
		this.company_pwd = company_pwd;
	}

	public Integer getCompany_phone() {
		return company_phone;
	}

	public void setCompany_phone(Integer company_phone) {
		this.company_phone = company_phone;
	}

	public String getCompany_address() {
		return company_address;
	}

	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}

	public String getCompany_nature() {
		return company_nature;
	}

	public void setCompany_nature(String company_nature) {
		this.company_nature = company_nature;
	}

	public String getCompany_scale() {
		return company_scale;
	}

	public void setCompany_scale(String company_scale) {
		this.company_scale = company_scale;
	}

	public String getCompany_industry() {
		return company_industry;
	}

	public void setCompany_industry(String company_industry) {
		this.company_industry = company_industry;
	}

	public String getCompany_introduce() {
		return company_introduce;
	}

	public void setCompany_introduce(String company_introduce) {
		this.company_introduce = company_introduce;
	}

	public String getCompany_welfare() {
		return company_welfare;
	}

	public void setCompany_welfare(String company_welfare) {
		this.company_welfare = company_welfare;
	}

	public Set<Jobinfo> getJobinfo() {
		return jobinfo;
	}

	public void setJobinfo(Set<Jobinfo> jobinfo) {
		this.jobinfo = jobinfo;
	}
	
	
	
	
}
