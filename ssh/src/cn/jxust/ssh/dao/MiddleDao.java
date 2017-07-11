package cn.jxust.ssh.dao;

import java.util.List;

import cn.jxust.ssh.model.Middle;

public interface MiddleDao {

	void add(Middle middle);

	List<Middle> findList(Integer jobinfo_id);

}
