package cn.jxust.ssh.dao;

import cn.jxust.ssh.model.Company;

public interface CompanyDao {

	Company findByNameAndPwd(Company company);

	void update(Company company);

	boolean register(Company company);

	Company checkCompanyName(String company_name);

}
