package cn.jxust.ssh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxust.ssh.dao.CustomerDao;
import cn.jxust.ssh.model.Customer;

/**
 *	注册用户管理的DAO的实现类
 *
 */
public class CustomerDaoImpl extends HibernateDaoSupport implements CustomerDao{
	
	/**
	 * 根据用户名和密码查询用户的方法：
	 */
	@Override
	public Customer findByUsernameAndPwd(Customer customer) {
		System.out.println("dao login");
		String hql = "from Customer where customer_name = ? and customer_pwd = ?";
		List<Customer> list = (List<Customer>) this.getHibernateTemplate().find(hql,customer.getCustomer_name(),customer.getCustomer_pwd());
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean register(Customer customer) {
		String hql = "from Customer where customer_name = ?";
		List<Customer> list = (List<Customer>) this.getHibernateTemplate().find(hql,customer.getCustomer_name());
		if(list.size() > 0){
			return false;
		}else{
			this.getHibernateTemplate().save(customer);
			return true;
		}
	}

	@Override
	//查询所有用户
	public List<Customer> findAll() {
		return (List<Customer>) this.getHibernateTemplate().find("from Customer");
	}
	
	public Customer checkCustomerName(String customer_name){
		String hql="from Customer where customer_name = ?";
		List<Customer> list = (List<Customer>) this.getHibernateTemplate().find(hql,customer_name);
		if(list.size() > 0){
			return list.get(0);
		}
		return null;
	}
}
