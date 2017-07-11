package cn.jxust.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.MiddleDao;
import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.service.MiddleService;

@Transactional
public class MiddleServiceImpl implements MiddleService{
	private MiddleDao middleDao;

	public void setMiddleDao(MiddleDao middleDao) {
		this.middleDao = middleDao;
	}

	@Override
	public void add(Middle middle) {
		middleDao.add(middle);
	}

	@Override
	public List<Middle> findList(Integer jobinfo_id) {
		
		return middleDao.findList(jobinfo_id);
	}
	
	

}
