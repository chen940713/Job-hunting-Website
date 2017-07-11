package cn.jxust.ssh.service;

import java.util.List;

import cn.jxust.ssh.model.Customer;

/**
 * 注册用户管理的业务层类
 *
 */
public interface CustomerService {

	Customer login(Customer customer);

	boolean register(Customer customer);

	List<Customer> findAll();

	Customer checkCustomerName(String customer_name);
	
}
