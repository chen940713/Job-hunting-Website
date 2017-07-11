package cn.jxust.ssh.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxust.ssh.dao.JobinfoDao;
import cn.jxust.ssh.model.Jobinfo;

/**
 *	招聘信息管理的dao层的实现类  
 *
 */
public class JobinfoDaoImpl extends HibernateDaoSupport implements JobinfoDao{
	
	/**
	 * 分页查询招聘信息
	 */
	@Override
	public List<Jobinfo> findByPage(int begin, int pageSize,String searchWorkplace, String searchPosition) {
		if(searchWorkplace.equals("")){
			 
		}
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Jobinfo.class);
		criteria.add(Restrictions.eq("workplace", searchWorkplace));
		criteria.add(Restrictions.eq("position", searchPosition));
		List<Jobinfo> list = (List<Jobinfo>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	@Override
	public int findCount(String searchWorkplace, String searchPosition) {
		String hql = "select count(*) from Jobinfo where workplace = ? and position = ?";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,searchWorkplace,searchPosition);
		System.out.println("findCount  "+list.size());
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public int findCountCompany(Integer company_id) {
		System.out.println("----findCountCompany  " +company_id);
		String hql = "select count(*) from Jobinfo where company.company_id = ?";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,company_id);
		System.out.println("findCountCompany  "+list.size());
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Jobinfo> findByPageCompany(int begin, int pageSize, Integer company_id) {
		System.out.println("---findByPageCompany");
		DetachedCriteria criteria = DetachedCriteria.forClass(Jobinfo.class);
		criteria.add(Restrictions.eq("company.company_id", company_id));
		List<Jobinfo> list = (List<Jobinfo>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	@Override
	public int findAllCount() {
		String hql = "select count(*) from Jobinfo";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		System.out.println("findAllCount  "+list.size());
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Jobinfo> findAll(int begin, int pageSize) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Jobinfo.class);
		List<Jobinfo> list = (List<Jobinfo>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	@Override
	public int findByPageWithWorkplace(String searchWorkplace) {
		String hql = "select count(*) from Jobinfo where workplace = ?";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,searchWorkplace);
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Jobinfo> findByPageWithWorkplace(int begin, int pageSize, String searchWorkplace) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Jobinfo.class);
		criteria.add(Restrictions.eq("workplace", searchWorkplace));
		List<Jobinfo> list = (List<Jobinfo>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	@Override
	public int findByPageWithPosition(String searchPosition) {
		String hql = "select count(*) from Jobinfo where position = ?";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,searchPosition);
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Jobinfo> findByPageWithPosition(int begin, int pageSize, String searchPosition) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Jobinfo.class);
		criteria.add(Restrictions.eq("position", searchPosition));
		List<Jobinfo> list = (List<Jobinfo>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSize);
		return list;
	}

	@Override
	public Jobinfo showDetail(Integer jobinfo_id) {
		Jobinfo jobinfo = this.getHibernateTemplate().get(Jobinfo.class, jobinfo_id);
		return jobinfo;
	}

	@Override
	public void deleteByCompany(Jobinfo jobinfo) {
		this.getHibernateTemplate().delete(jobinfo);
	}

	@Override
	public Jobinfo findByJobinfoId(Integer jobinfo_id) {
		return this.getHibernateTemplate().get(Jobinfo.class, jobinfo_id);
	}

	@Override
	public void add(Jobinfo jobinfo) {
		this.getHibernateTemplate().save(jobinfo);
	}

	@Override
	public void update(Jobinfo jobinfo) {
		this.getHibernateTemplate().update(jobinfo);
		
	}
	
}
