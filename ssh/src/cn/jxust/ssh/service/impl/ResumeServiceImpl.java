package cn.jxust.ssh.service.impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.jxust.ssh.dao.ResumeDao;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.model.PageBeanResume;
import cn.jxust.ssh.model.Resume;
import cn.jxust.ssh.service.ResumeService;



@Transactional
public class ResumeServiceImpl implements ResumeService{
	private ResumeDao resumeDao;
	public void setResumeDao(ResumeDao resumeDao) {
		this.resumeDao = resumeDao;
	}

	
	
	@Override
	public void save(Resume resume) {
		resumeDao.save(resume);
	}

	@Override
	//根据用户id查询用户的简历
	public Resume findById(Integer about_skill4) {
		return resumeDao.findById(about_skill4);
	}

	@Override
	public void update(Resume resume) {
		resumeDao.update(resume);
	}



	@Override
	public List<Resume> findByJoinfoId(Integer jobinfo_id) {
		
		return resumeDao.findByJobinfoId(jobinfo_id);
	}



	@Override
	public List<Resume> findList(List<Middle> middleList) {
		return resumeDao.findList(middleList);
	}



	@Override
	public Resume findByName(String person_name) {
		
		return resumeDao.findByName(person_name);
	}



	@Override
	public PageBeanResume<Resume> findAll(Integer currPageResume) {
		PageBeanResume<Resume> pageBeanResume = new PageBeanResume<Resume>();
		//封装当前的页数
		pageBeanResume.setCurrPageResume(currPageResume);
		//封装每页显示的记录数
		int pageSizeResume = 8;
		pageBeanResume.setPageSizeResume(pageSizeResume);
		//封装总记录数
		int totalCountResume = resumeDao.findAllCount();
		pageBeanResume.setTotalCountResume(totalCountResume);
		//封装总的页数
		double tc = totalCountResume;
		Double num = Math.ceil(tc / pageSizeResume);
		pageBeanResume.setTotalPageResume(num.intValue());
		//封装每页显示的数据
		int begin = (currPageResume - 1) * pageSizeResume;
		List<Resume> listResume = resumeDao.findAll(begin,pageSizeResume);
		pageBeanResume.setListResume(listResume);
		
		return pageBeanResume;
	}

	
	
	
}
