package cn.jxust.ssh.service;

import java.util.List;

import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.model.PageBeanResume;
import cn.jxust.ssh.model.Resume;

public interface ResumeService {

	void save(Resume resume);

	Resume findById(Integer about_skill4);

	void update(Resume resume);

	List<Resume> findByJoinfoId(Integer jobinfo_id);

	List<Resume> findList(List<Middle> middleList);

	Resume findByName(String person_name);

	PageBeanResume<Resume> findAll(Integer currPageResume);


}
