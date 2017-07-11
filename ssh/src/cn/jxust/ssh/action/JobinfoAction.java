package cn.jxust.ssh.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.jxust.ssh.model.Company;
import cn.jxust.ssh.model.Customer;
import cn.jxust.ssh.model.Jobinfo;
import cn.jxust.ssh.model.Middle;
import cn.jxust.ssh.model.PageBean;
import cn.jxust.ssh.model.Resume;
import cn.jxust.ssh.service.JobinfoService;
import cn.jxust.ssh.service.MiddleService;
import cn.jxust.ssh.service.ResumeService;
import net.sf.json.JSONObject;

/**
 *	招聘信息查询的类 
 *
 */
public class JobinfoAction extends ActionSupport implements ModelDriven<Jobinfo>{
	
	//模型驱动需要使用的对象
	private Jobinfo jobinfo = new Jobinfo();
	@Override
	public Jobinfo getModel() {
		return jobinfo;
	}
	
	//传入的查询条件（工作地点\工作岗位）
	private String searchWorkplace;
	private String searchPosition;
	public void setSearchWorkplace(String searchWorkplace) {
		this.searchWorkplace = searchWorkplace;
	}
	public void setSearchPosition(String searchPosition) {
		this.searchPosition = searchPosition;
	}

	public String getSearchWorkplace() {
		return searchWorkplace;
	}
	public String getSearchPosition() {
		return searchPosition;
	}

	//分页查询，需要接收当前的页数
	private Integer currPage = 1;
	
	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	//注入招聘信息管理的Service层
	private JobinfoService jobinfoService;
	//注入简历信息管理的Service层
	private ResumeService resumeService;
	private MiddleService middleService;

	public void setJobinfoService(JobinfoService jobinfoService) {
		this.jobinfoService = jobinfoService;
	}
	public void setResumeService(ResumeService resumeService) {
		this.resumeService = resumeService;
	}
	public void setMiddleService(MiddleService middleService) {
		this.middleService = middleService;
	}

	private String customerName;
	private int jobinfoId;
	private String companyName;

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public void setJobinfoId(int jobinfoId) {
		this.jobinfoId = jobinfoId;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String findAll(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		Customer customer = (Customer)session.getAttribute("existCustomer");
		
		PageBean<Jobinfo> pageBean = jobinfoService.findAll(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		Resume resume = resumeService.findById(customer.getCustomer_id());
		ActionContext.getContext().getSession().put("resume",resume);
		return "findAllPage";
	}
	
	public String findAllByAdmin(){
		System.out.println("find all by admin");
		PageBean<Jobinfo> pageBean = jobinfoService.findAll(currPage);
		System.out.println(pageBean.toString());
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findAllByAdmin";
	}
	
	public String test(){
		System.out.println("customerName="+customerName+" companyName="+companyName+" jobinfoId="+jobinfoId);
		
		return NONE;
	}
	
	public String showDetail() throws IOException{
		System.out.println("查看招聘信息详情---jobinfo_id="+jobinfo.getJobinfo_id());
		jobinfo = jobinfoService.showDetail(jobinfo.getJobinfo_id());
		System.out.println(jobinfo.toString());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().println("<button id='backToSearch' onclick='backToSearch()'>返回</button>");
		response.getWriter().println("<ul><li>招聘详情："+jobinfo.getContent()+"</li>");
		response.getWriter().println("<li>公司电话："+jobinfo.getCompany().getCompany_phone()+"</li></ul>");
		
		return NONE;
	}
	
	public String findById(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		ActionContext.getContext().getSession().put("detailJobinfo",jobinfo);
		
		List<Middle> middleList = middleService.findList(jobinfo.getJobinfo_id());
		ActionContext.getContext().getValueStack().set("middleList", middleList);
		List<Resume> resumeList = resumeService.findList(middleList);
		return "showdetail";
	}
	
	public String update(){
		System.out.println(jobinfo.toString());
		jobinfoService.update(jobinfo);
		return "jobinfoupdate";
	}
	
	public String findByCustomer(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		ActionContext.getContext().getSession().put("findJobinfo", jobinfo);
		return "findByCustomerSuccess";
	}
	
	public String findJobByAdmin(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		ActionContext.getContext().getSession().put("findJobinfo", jobinfo);
		return "findJobByAdmin";
	}
	
	public String findByAdmin(){
		PageBean<Jobinfo> pageBean = jobinfoService.findAll(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "findByAdmin";
	}
	
	
	/**
	 * 求职用户登录后，主页面查询所有招聘信息的方法
	 * 实现了多条件查询
	 */
	public String find(){
		//方法  得到CustomerAction中存入session中的existCustomer对象的值
		HttpSession session = ServletActionContext.getRequest().getSession();
		Customer customer = (Customer)session.getAttribute("existCustomer");
		System.out.println(customer.getCustomer_id()+"    hello");
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		
		if(searchWorkplace.equals("")&&searchPosition.equals("")){
			//没有选择查询条件，执行下面的查询方法
			System.out.println("searchWorkplace=空 searchPosition=空");
			pageBean = jobinfoService.findByPageWithoutTerm(currPage);
			
		}else if(!searchWorkplace.equals("")&&searchPosition.equals("")){
			//选择了工作地点，没有选择工作岗位，执行下面的查询方法
			System.out.println("searchWorkplace="+searchWorkplace+" searchPosition=空");
			pageBean = jobinfoService.findByPageWithWorkplace(currPage,searchWorkplace);
			
		}else if(searchWorkplace.equals("")&&!searchPosition.equals("")){
			////选择了工作岗位，没有选择工作地点，执行下面的查询方法
			System.out.println("searchWorkplace=空 searchPosition="+searchPosition);
			pageBean = jobinfoService.findByPageWithPosition(currPage,searchPosition);
			
		}else{
			//两个条件都选择了，执行下面的查询方法
			System.out.println("searchWorkplace="+searchWorkplace+" searchPosition="+searchPosition);
			pageBean = jobinfoService.findByPage(currPage,searchWorkplace,searchPosition);	
		}

		System.out.println(pageBean.toString());
		//将返回的pageBean存入值栈中
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "findAll";
	}
	
	/**
	 * 公司用户通过删除招聘信息模块，实现对招聘信息的删除方法
	 */
	public String deleteByCompany(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		jobinfoService.deleteByCompany(jobinfo);

		System.out.println("公司删除了招聘信息 id="+jobinfo.getJobinfo_id()+" 的招聘信息");
		return "deleteSuccess";
	}
	
	/**
	 * 管理员通过删除招聘信息模块，实现对招聘信息的删除方法
	 */
	public String deleteByAdmin(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		jobinfoService.deleteByCompany(jobinfo);

		System.out.println("管理员删除了招聘信息 id="+jobinfo.getJobinfo_id()+" 的招聘信息");
		return "adminDeleteSuccess";
	}
	
	/**
	 * 公司用户通过添加（发布）招聘信息模块，实现对招聘信息的增加方法
	 */
	public String add(){
		jobinfoService.add(jobinfo);	
		System.out.println("公司增加了招聘信息 id="+jobinfo.getJobinfo_id()+" 的招聘信息");
		return "addSuccess";
	}
	
	/**
	 * 公司用户进入主页面后自动查询显示自己发布的所有招聘信息
	 */
	public String findByCompany(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		Company company = (Company)session.getAttribute("existCompany");
		System.out.println("company_id = "+company.getCompany_id());
		PageBean<Jobinfo> pageBean = jobinfoService.findByPageCompany(currPage,company.getCompany_id());
		System.out.println(pageBean.toString());
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "findByCompanySuccess";
	}
	
	public String index(){
		PageBean<Jobinfo> pageBean = jobinfoService.findAll(currPage);
		ActionContext.getContext().getValueStack().push(pageBean);
		return "index";
	}
	public String findIndex(){
		PageBean<Jobinfo> pageBean = new PageBean<Jobinfo>();
		
		if(searchWorkplace.equals("")&&searchPosition.equals("")){
			//没有选择查询条件，执行下面的查询方法
			System.out.println("searchWorkplace=空 searchPosition=空");
			pageBean = jobinfoService.findByPageWithoutTerm(currPage);
			
		}else if(!searchWorkplace.equals("")&&searchPosition.equals("")){
			//选择了工作地点，没有选择工作岗位，执行下面的查询方法
			System.out.println("searchWorkplace="+searchWorkplace+" searchPosition=空");
			pageBean = jobinfoService.findByPageWithWorkplace(currPage,searchWorkplace);
			
		}else if(searchWorkplace.equals("")&&!searchPosition.equals("")){
			////选择了工作岗位，没有选择工作地点，执行下面的查询方法
			System.out.println("searchWorkplace=空 searchPosition="+searchPosition);
			pageBean = jobinfoService.findByPageWithPosition(currPage,searchPosition);
			
		}else{
			//两个条件都选择了，执行下面的查询方法
			System.out.println("searchWorkplace="+searchWorkplace+" searchPosition="+searchPosition);
			pageBean = jobinfoService.findByPage(currPage,searchWorkplace,searchPosition);	
		}

		System.out.println(pageBean.toString());
		//将返回的pageBean存入值栈中
		ActionContext.getContext().getValueStack().push(pageBean);
		
		return "findIndex";
	}
	
	public String findByIndex(){
		jobinfo = jobinfoService.findByJobinfoId(jobinfo.getJobinfo_id());
		ActionContext.getContext().getSession().put("findJobinfo", jobinfo);
		return "findByIndex";
	}
}
