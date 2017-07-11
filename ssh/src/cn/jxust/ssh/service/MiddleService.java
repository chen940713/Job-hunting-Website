package cn.jxust.ssh.service;

import java.util.List;

import cn.jxust.ssh.model.Middle;

public interface MiddleService {

	void add(Middle middle);

	List<Middle> findList(Integer jobinfo_id);

}
