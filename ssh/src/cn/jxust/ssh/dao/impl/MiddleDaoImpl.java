package cn.jxust.ssh.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.jxust.ssh.dao.MiddleDao;
import cn.jxust.ssh.model.Middle;

public class MiddleDaoImpl extends HibernateDaoSupport implements MiddleDao{

	@Override
	public void add(Middle middle) {
		System.out.println(middle.toString());
		String hql = "from Middle where customerName = ? and jobinfoId = ? and companyId = ?";
		List<Middle> mList = (List<Middle>) this.getHibernateTemplate().find(hql,middle.getCustomerName(),middle.getJobinfoId(),middle.getCompanyId());
		if(mList.size() > 0){
			return;
		}else{
			this.getHibernateTemplate().save(middle);
		}
	}

	@Override
	public List<Middle> findList(Integer jobinfo_id) {
		String hql = "from Middle where jobinfoId = ?";
		List<Middle> middleList = (List<Middle>) this.getHibernateTemplate().find(hql,jobinfo_id);
		return middleList;
	}

}
