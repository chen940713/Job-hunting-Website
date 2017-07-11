package cn.jxust.ssh.service;

import cn.jxust.ssh.model.Company;

public interface CompanyService {

	Company login(Company company);

	void update(Company company);

	boolean register(Company company);

	Company checkCompanyName(String company_name);

}
