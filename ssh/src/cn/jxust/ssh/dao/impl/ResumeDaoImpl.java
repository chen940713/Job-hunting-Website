package cn.jxust.ssh.dao.impl;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxust.ssh.dao.ResumeDao;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.model.Resume;

public class ResumeDaoImpl extends HibernateDaoSupport implements ResumeDao{

	@Override
	public void save(Resume resume) {
		this.getHibernateTemplate().save(resume);
	}

	@Override
	public Resume findById(Integer about_skill4) {
		return this.getHibernateTemplate().get(Resume.class, about_skill4);
	}

	@Override
	public void update(Resume resume) {
		this.getHibernateTemplate().update(resume);
	}

	@Override
	public List<Resume> findByJobinfoId(Integer jobinfo_id) {
		String hql="from Resume r where r.about_skill4 in (1,2)";
		List<Resume> list = (List<Resume>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public List<Resume> findList(List<Middle> middleList) {
		
		return null;
	}

	@Override
	public Resume findByName(String person_name) {
		Resume resume = new Resume();
		String hql = "from Resume where person_name = ?";
		List<Resume> list =  (List<Resume>) this.getHibernateTemplate().find(hql,person_name);
		if(list.size() > 0){
			resume = list.get(0);
			System.out.println(resume.toString());
		}
		return resume;
	}

	@Override
	public int findAllCount() {
		String hql = "select count(*) from Resume";
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
		System.out.println("findAllCount  "+list.size());
		if(list.size() > 0){
			//转成整型
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Resume> findAll(int begin, int pageSizeResume) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Resume.class);
		List<Resume> listResume = (List<Resume>) this.getHibernateTemplate().findByCriteria(criteria,begin,pageSizeResume);
		return listResume;
	}
	
}
