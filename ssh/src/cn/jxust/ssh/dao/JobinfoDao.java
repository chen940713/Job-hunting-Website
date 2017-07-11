package cn.jxust.ssh.dao;

import java.util.List;

import cn.jxust.ssh.model.Jobinfo;


/**
 *	招聘信息管理的Dao层的接口  
 *
 */
public interface JobinfoDao {

	int findCountCompany(Integer company_id);

	List<Jobinfo> findByPageCompany(int begin, int pageSize, Integer company_id);

	int findCount(String searchWorkplace, String searchPosition);

	List<Jobinfo> findByPage(int begin, int pageSize, String searchWorkplace, String searchPosition);

	int findAllCount();

	List<Jobinfo> findAll(int begin, int pageSize);

	int findByPageWithWorkplace(String searchWorkplace);

	List<Jobinfo> findByPageWithWorkplace(int begin, int pageSize, String searchWorkplace);

	int findByPageWithPosition(String searchPosition);

	List<Jobinfo> findByPageWithPosition(int begin, int pageSize, String searchPosition);

	Jobinfo showDetail(Integer jobinfo_id);

	void deleteByCompany(Jobinfo jobinfo);

	Jobinfo findByJobinfoId(Integer jobinfo_id);

	void add(Jobinfo jobinfo);

	void update(Jobinfo jobinfo);
	
}
