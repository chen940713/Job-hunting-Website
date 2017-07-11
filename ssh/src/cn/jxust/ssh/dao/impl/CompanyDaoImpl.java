package cn.jxust.ssh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxust.ssh.dao.CompanyDao;
import cn.jxust.ssh.model.Company;
import cn.jxust.ssh.model.Customer;

public class CompanyDaoImpl extends HibernateDaoSupport implements CompanyDao{

	@Override
	public Company findByNameAndPwd(Company company) {
		String hql="from Company where company_name = ? and company_pwd = ?";
		List<Company> list = (List<Company>) this.getHibernateTemplate().find(hql,company.getCompany_name(),company.getCompany_pwd());
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public void update(Company company) {
		this.getHibernateTemplate().update(company);
	}

	@Override
	public boolean register(Company company) {
		String hql = "from Company where company_name = ?";
		List<Company> list = (List<Company>) this.getHibernateTemplate().find(hql,company.getCompany_name());
		if(list.size() > 0){
			return false;
		}else{
			this.getHibernateTemplate().save(company);
			return true;
		}
	}

	@Override
	public Company checkCompanyName(String company_name) {
		String hql="from Company where company_name = ?";
		List<Company> list = (List<Company>) this.getHibernateTemplate().find(hql,company_name);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	
	
}
