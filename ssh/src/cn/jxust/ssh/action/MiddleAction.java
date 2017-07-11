package cn.jxust.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.service.MiddleService;

public class MiddleAction extends ActionSupport implements ModelDriven<Middle>{
	
	private Middle middle = new Middle();
	@Override
	public Middle getModel() {
		return middle;
	}
	
	//注入MiddleService的类
	private MiddleService middleService;
	public void setMiddleService(MiddleService middleService) {
		this.middleService = middleService;
	}
	
	
	public String add(){
		System.out.println(middle.getCompanyId());
		System.out.println(middle.getCustomerName());
		System.out.println(middle.getJobinfoId());
		middleService.add(middle);
		return "addSuccess";
	}
}
