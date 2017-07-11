package cn.jxust.ssh.model;

import java.util.List;

/**
 * 	分页封装的类
 * 
 */

public class PageBeanResume<T> {
	private int currPageResume; //当前页数
	private int pageSizeResume; //每页显示的记录数
	private int totalCountResume; //总的记录数
	private int totalPageResume; //总的页数
	private List<T> listResume;  //每页显示的数据
	
	public int getCurrPageResume() {
		return currPageResume;
	}
	public void setCurrPageResume(int currPageResume) {
		this.currPageResume = currPageResume;
	}
	public int getPageSizeResume() {
		return pageSizeResume;
	}
	public void setPageSizeResume(int pageSizeResume) {
		this.pageSizeResume = pageSizeResume;
	}
	public int getTotalCountResume() {
		return totalCountResume;
	}
	public void setTotalCountResume(int totalCountResume) {
		this.totalCountResume = totalCountResume;
	}
	public int getTotalPageResume() {
		return totalPageResume;
	}
	public void setTotalPageResume(int totalPageResume) {
		this.totalPageResume = totalPageResume;
	}
	public List<T> getListResume() {
		return listResume;
	}
	public void setListResume(List<T> listResume) {
		this.listResume = listResume;
	}
	
	
	
}
