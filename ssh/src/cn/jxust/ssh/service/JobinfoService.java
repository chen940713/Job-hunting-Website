package cn.jxust.ssh.service;

import cn.jxust.ssh.model.PageBean;

import java.util.List;

import cn.jxust.ssh.model.Jobinfo;

/**
 *	招聘信息管理的业务层的接口 
 *
 */
public interface JobinfoService {

	PageBean<Jobinfo> findByPageCompany(Integer currPage, Integer company_id);

	PageBean<Jobinfo> findByPage(Integer currPage, String searchWorkplace, String searchPosition);

	PageBean<Jobinfo> findAll(Integer currPage);

	PageBean<Jobinfo> findByPageWithoutTerm(Integer currPage);

	PageBean<Jobinfo> findByPageWithWorkplace(Integer currPage, String searchWorkplace);

	PageBean<Jobinfo> findByPageWithPosition(Integer currPage, String searchPosition);

	Jobinfo showDetail(Integer jobinfo_id);

	void deleteByCompany(Jobinfo jobinfo);

	Jobinfo findByJobinfoId(Integer jobinfo_id);

	void add(Jobinfo jobinfo);

	void update(Jobinfo jobinfo);
	
}
