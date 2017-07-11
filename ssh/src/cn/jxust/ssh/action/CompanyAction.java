package cn.jxust.ssh.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxust.ssh.model.Company;
import cn.jxust.ssh.model.Customer;
import cn.jxust.ssh.service.CompanyService;

public class CompanyAction extends ActionSupport implements ModelDriven<Company>{
	
	private Company company = new Company();
	@Override
	public Company getModel() {
		
		return company;
	}

	//注入业务层的类
	private CompanyService companyService;
	public void setCompanyService(CompanyService companyService) {
		this.companyService = companyService;
	}
	
	/**
	 * 登录执行的方法
	 * @return
	 */
	public String login(){
		System.out.println("companyaction login");
		System.out.println(company.getCompany_name()+" "+company.getCompany_pwd());
		//调用业务层的类
		Company existCompany = companyService.login(company);
		if(existCompany == null){
			
			//没有查询到数据，表示登录失败
			this.addActionError("用户名或密码错误！");
			return INPUT;
			
		}else{
			System.out.println("登录成功");
			//在session中存入刚登录成功的用户信息
			ActionContext.getContext().getSession().put("existCompany",existCompany);
			return SUCCESS;
		}
	}
	
	public String update(){
		companyService.update(company);
		return "update";
	}
	
	public String register(){
		if(companyService.register(company)){
			return "companyRegister";
		}else{
			return INPUT;
		}
	}
	
	public String checkCompanyName() throws IOException{
		if(company.getCompany_name().equals("")){
			System.out.println("kkkkkkkk");
		}
		Company existCompany = companyService.checkCompanyName(company.getCompany_name());
		HttpServletResponse resp = ServletActionContext.getResponse();
		resp.setHeader("Content-type", "text/html;charset=UTF-8");
		resp.setCharacterEncoding("UTF-8");
//		resp.setContentType("UTF-8");
		if(existCompany != null){
			resp.getWriter().println("<font color='red'>用户名已经存在</font>");
		}else{
			resp.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}
	
	public String logout(){
		
		return "companyLogout";
	}
}
