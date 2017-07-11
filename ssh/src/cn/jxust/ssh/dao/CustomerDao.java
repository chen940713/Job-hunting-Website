package cn.jxust.ssh.dao;

import java.util.List;

import cn.jxust.ssh.model.Customer;

/**
 *	注册用户管理的DAO的接口 
 *
 */
public interface CustomerDao {

	Customer findByUsernameAndPwd(Customer customer);

	boolean register(Customer customer);

	List<Customer> findAll();

	Customer checkCustomerName(String customer_name);

}
