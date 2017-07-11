package cn.jxust.ssh.dao;

import java.util.List;

import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.model.Resume;

public interface ResumeDao {

	void save(Resume resume);

	Resume findById(Integer about_skill4);

	void update(Resume resume);

	List<Resume> findByJobinfoId(Integer jobinfo_id);

	List<Resume> findList(List<Middle> middleList);

	Resume findByName(String person_name);

	int findAllCount();

	List<Resume> findAll(int begin, int pageSizeResume);

}
