package cn.jxust.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.CustomerDao;
import cn.jxust.ssh.model.Customer;
import cn.jxust.ssh.service.CustomerService;

/**
 * 注册用户管理的业务层的实现类
 *
 */
//事务管理注释
@Transactional
public class CustomerServiceImpl implements CustomerService{
	private CustomerDao customerDao;

	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	/**
	 *  业务层登录的方法
	 */
	@Override
	public Customer login(Customer customer) {
		System.out.println("service login");
		Customer existCustomer = customerDao.findByUsernameAndPwd(customer);
		return existCustomer;
	}

	@Override
	public boolean register(Customer customer) {
		if(customerDao.register(customer)){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<Customer> findAll() {
		return customerDao.findAll();
	}

	@Override
	public Customer checkCustomerName(String customer_name) {
		return customerDao.checkCustomerName(customer_name);
	}
	
	
}
