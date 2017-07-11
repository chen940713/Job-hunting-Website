<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看详情</title>
</head>
<body>
	<div>
		<s:form action="jobinfo_update" method="post" namespace="/">
		<ul>
			<li><input type="text" style="display:none" name="jobinfo_id" value="<s:property value="#session.existCompany.company_id"/>"></li>
			<li><input type="text" style="display:none" name="company.company_id" value="<s:property value="#session.detailJobinfo.jobinfo_id"/>"></li>
			<li>招聘岗位：<input type="text" name="position" value="<s:property value="#session.detailJobinfo.position"/>"></li>
			<li>薪资：<input type="text" name="salary" value="<s:property value="#session.detailJobinfo.salary"/>"></li>
			<li>工作地点：<input type="text" name="workplace" value="<s:property value="#session.detailJobinfo.workplace"/>"></li>
			<li>工作经验：<input type="text" name="experience" value="<s:property value="#session.detailJobinfo.experience"/>"></li>
			<li>学历：<input type="text" name="education" value="<s:property value="#session.detailJobinfo.education"/>"></li>
			<li>内容：<input type="text" name="content" value="<s:property value="#session.detailJobinfo.content"/>"></li>
		</ul>
		<button type="submit">修改</button>
		</s:form>
	</div>
	<div>
		<h2>投简历人信息</h2>
		<table>
			<thead>
				<tr>
					<td>姓名</td>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="middleList" var="m">
				<tr>
					<td><a href="${pageContext.request.contextPath}/resume_showResume.action?person_name=<s:property value="#m.customerName"/>"><s:property value="#m.customerName"/></a></td>
				</tr>
				</s:iterator>
			</tbody>
		</table>
	</div>
</body>
</html>