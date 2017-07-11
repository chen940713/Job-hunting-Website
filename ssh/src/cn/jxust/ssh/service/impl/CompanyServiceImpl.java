package cn.jxust.ssh.service.impl;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.CompanyDao;
import cn.jxust.ssh.model.Company;
import cn.jxust.ssh.service.CompanyService;

@Transactional
public class CompanyServiceImpl implements CompanyService{
	private CompanyDao companyDao;
	
	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}


	@Override
	public Company login(Company company) {
		
		Company existCompany = companyDao.findByNameAndPwd(company);
		return existCompany;
	}


	@Override
	public void update(Company company) {
		companyDao.update(company);
	}


	@Override
	public boolean register(Company company) {
		if(companyDao.register(company)){
			return true;
		}else{
			return false;
		}
	}


	@Override
	public Company checkCompanyName(String company_name) {
		return companyDao.checkCompanyName(company_name);
	}

}
