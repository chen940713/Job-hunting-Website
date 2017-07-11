package cn.jxust.ssh.service.impl;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.AdminDao;
import cn.jxust.ssh.service.AdminService;

@Transactional
public class AdminServiceImpl implements AdminService{
	private AdminDao adminDao;

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
	
}
