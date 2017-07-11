package cn.jxust.ssh.model;

import java.util.HashSet;
import java.util.Set;

/**
 * 	求职人员的实体类
 */
public class Customer {
	
	private Integer customer_id;
	private String customer_name;
	private String customer_pwd;
	
	private Set<Resume> resumes = new HashSet<Resume>();
	
	public Integer getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(Integer customer_id) {
		this.customer_id = customer_id;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_pwd() {
		return customer_pwd;
	}

	public void setCustomer_pwd(String customer_pwd) {
		this.customer_pwd = customer_pwd;
	}

	public Set<Resume> getResumes() {
		return resumes;
	}

	public void setResumes(Set<Resume> resumes) {
		this.resumes = resumes;
	}
	
	

}
