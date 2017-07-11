package cn.jxust.ssh.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxust.ssh.model.Customer;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.service.CustomerService;
import cn.jxust.ssh.service.JobinfoService;
import cn.jxust.ssh.service.ResumeService;

/**
 * 	求职用户管理的action类 
 *	
 */
public class CustomerAction extends ActionSupport implements ModelDriven<Customer>{

	//提交过来的用户名密码就会被封装到customer对象，customer是模型驱动需要使用的对象
	private Customer customer = new Customer();
	/**
	 * 用于接收前端的参数
	 * @return
	 */
	@Override
	public Customer getModel() {
		
		return customer;
	}
	
	//注入业务层的类
	private CustomerService customerService;

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

	/**
	 * 登录执行的方法
	 * @return
	 */
	public String login(){
		
		System.out.println("action login");
		System.out.println(customer.getCustomer_name()+" "+customer.getCustomer_pwd());
		//调用业务层的类
		Customer existCustomer = customerService.login(customer);
		if(existCustomer == null){
			
			//没有查询到数据，表示登录失败
			this.addActionError("用户名或密码错误！");
			return INPUT;
			
		}else{
			System.out.println("登录成功");
			//在session中存入刚登录成功的用户信息
			ActionContext.getContext().getSession().put("existCustomer",existCustomer);
			return SUCCESS;
		}
	}
	
	public String register(){
		if(customerService.register(customer)){
			return "registerSuccess";		
		}else{
			return INPUT;
		}
	}

	public String checkCustomerName() throws IOException{
		Customer existCustomer = customerService.checkCustomerName(customer.getCustomer_name());
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setHeader("Content-type", "text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("UTF-8");
		if(existCustomer != null){
			resp.getWriter().println("<font color='red'>用户名已经存在</font>");
		}else{
			resp.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}
	
	public String logout(){
		
		return "customerLogout";
	}
	
	public String index(){
		return "index";
	}
	public String toIndex(){
		return "toIndex";
	}
}
