package cn.jxust.ssh.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxust.ssh.model.Customer;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.model.PageBeanResume;
import cn.jxust.ssh.model.Resume;
import cn.jxust.ssh.service.CustomerService;
import cn.jxust.ssh.service.ResumeService;

public class ResumeAction extends ActionSupport implements ModelDriven<Resume>{
	private Resume resume = new Resume();
	@Override
	public Resume getModel() {
		return resume;
	}
	
	//分页查询，需要接收当前的页数
	private Integer currPageResume = 1;
	public void setCurrPageResume(Integer currPageResume) {
		this.currPageResume = currPageResume;
	}
	
	private ResumeService resumeService;
	private CustomerService customerService;
	public void setResumeService(ResumeService resumeService) {
		this.resumeService = resumeService;
	}
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}


	public String saveResume(){
		List<Customer> list = customerService.findAll();
		String name = (String) ActionContext.getContext().getSession().get("customer_name");
		System.out.println(name);
		resumeService.save(resume);
		return "saveResume";
	}
	
	public String edit(){
		resume = resumeService.findById(resume.getAbout_skill4());
		ActionContext.getContext().getSession().put("resume",resume);
		System.out.println(resume.getResume_id());
		return "editSuccess";
	}
	
	public void update(){
		System.out.println(resume.getPerson_name());
		resumeService.update(resume);
	}
	public String show(){
		resume = resumeService.findById(resume.getAbout_skill4());
		ActionContext.getContext().getSession().put("resume",resume);
		return "showSuccess";
	}
	public String showResume(){
		System.out.println(resume.getPerson_name());
		resume = resumeService.findByName(resume.getPerson_name());
		System.out.println(resume.toString());
		ActionContext.getContext().getSession().put("resume",resume);
		return "showResumeSuccess";
	}
	
	public String findAll(){
		System.out.println("resume find all");
		PageBeanResume<Resume> pageBeanResume = resumeService.findAll(currPageResume);
		ActionContext.getContext().getValueStack().push(pageBeanResume);
		return "findAll";
	}
}
