package cn.jxust.ssh.action;

import com.opensymphony.xwork2.ActionSupport;

import cn.jxust.ssh.service.AdminService;

public class AdminAction extends ActionSupport{
	
	private String adminName;
	private String adminPwd;
	
	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPwd() {
		return adminPwd;
	}

	public void setAdminPwd(String adminPwd) {
		this.adminPwd = adminPwd;
	}
	
	private AdminService adminService;
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public String login(){
		System.out.println(adminName+" -- "+adminPwd);
		if(adminName.equals("admin") && adminPwd.equals("123")){
			return "adminLoginSuccess";
		}else{
			return "adminLoginFaild";
		}
	}
	
	public String logout(){
		
		return "adminLogout";
	}
}
