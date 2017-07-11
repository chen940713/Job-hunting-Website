package cn.jxust.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.JobinfoDao;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.service.JobinfoService;

/**
 *	招聘信息管理的业务层的实现类 
 *
 */
//事务管理注释
@Transactional
public class JobinfoServiceImpl implements JobinfoService{
	//注入招聘信息管理的dao
	private JobinfoDao jobinfoDao;

	public void setJobinfoDao(JobinfoDao jobinfoDao) {
		this.jobinfoDao = jobinfoDao;
	}
	
	//分页查询招聘信息的方法
	@Override
	public PageBean<Jobinfo> findByPage(Integer currPage,String searchWorkplace, String searchPosition) {
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 8;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findCount(searchWorkplace,searchPosition);
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findByPage(begin,pageSize,searchWorkplace,searchPosition);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Jobinfo> findByPageCompany(Integer currPage, Integer company_id) {
		System.out.println("impl------1");
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 6;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findCountCompany(company_id);
		System.out.println("impl------2");
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findByPageCompany(begin,pageSize,company_id);
		System.out.println("impl------3");
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Jobinfo> findAll(Integer currPage) {
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 8;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findAllCount();
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findAll(begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Jobinfo> findByPageWithoutTerm(Integer currPage) {
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 8;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findAllCount();
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findAll(begin,pageSize);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Jobinfo> findByPageWithWorkplace(Integer currPage, String searchWorkplace) {
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 8;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findByPageWithWorkplace(searchWorkplace);
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findByPageWithWorkplace(begin,pageSize,searchWorkplace);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public PageBean<Jobinfo> findByPageWithPosition(Integer currPage, String searchPosition) {
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		//封装当前的页数
		pageBean.setCurrPage(currPage);
		//封装每页显示的记录数
		int pageSize = 8;
		pageBean.setPageSize(pageSize);
		//封装总记录数
		int totalCount = jobinfoDao.findByPageWithPosition(searchPosition);
		pageBean.setTotalCount(totalCount);
		//封装总的页数
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		//封装每页显示的数据
		int begin = (currPage - 1) * pageSize;
		List<Jobinfo> list = jobinfoDao.findByPageWithPosition(begin,pageSize,searchPosition);
		pageBean.setList(list);
		
		return pageBean;
	}

	@Override
	public Jobinfo showDetail(Integer jobinfo_id) {
		return jobinfoDao.showDetail(jobinfo_id);
	}

	@Override
	public void deleteByCompany(Jobinfo jobinfo) {
		jobinfoDao.deleteByCompany(jobinfo);
	}

	@Override
	public Jobinfo findByJobinfoId(Integer jobinfo_id) {
		return jobinfoDao.findByJobinfoId(jobinfo_id);
	}

	@Override
	public void add(Jobinfo jobinfo) {
		jobinfoDao.add(jobinfo);
		
	}

	@Override
	public void update(Jobinfo jobinfo) {
		jobinfoDao.update(jobinfo);
		
	}
	
}
