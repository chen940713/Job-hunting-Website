<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 防止网页不兼容CSS渲染 -->
<meta http-equiv="X-UA-Compatible" content="IE-edge,chrome=1">
<!-- 使网页能跟着窗口改变宽度（width=device-width），不能缩放 （initial-scale=1）-->
<meta name="viewport" content="width=device-width,initial-scale=1">
<!-- 字体 -->
<link href="http://fonts.googleapis.com/css?family=Josefin+Slab:400,700"
	rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="./css/normal.css">
<link type="text/css" rel="stylesheet" href="./css/customer.css">
<link rel="stylesheet" type="text/css" href="css/style1.css" />
<link type="text/css" rel="stylesheet" href="./css/zzsc.css">
<link rel="stylesheet" type="text/css" href="./css/public.css">
<link rel="stylesheet" type="text/css" href="./css/button.css">


<title>大风网</title>

<script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
$(function() {
    $('#addJobinfo').click(function() {
        $('#showInfo').show(500);
    });
    $('#backToSearch').click(function(){
        $('#showInfo').hide(500);
    });
})

</script>

<style type="text/css">
	.showInfo{margin-top: 40px;margin-left: 50px;}
	.formAdd{margin-top:40px;margin-left: 50px;}
	.formAdd ul{width: 380px;}
        .formAdd *:focus{outline: none}
        .formAdd ul li{border-bottom:1px solid #DFDFDF;padding: 12px}
        .formAdd ul li label{width:80px;display: inline-block;float: left;}
        .formAdd ul li input[type=text]{width: 220px;height: 20px;border:1px solid #AAAAAA;padding: 3px 8px;
        background: url(images/red_asterisk.png) no-repeat #FFF 98%;border-radius:3px;}
        .formAdd ul li input:focus{border-color: #C00;background-image:url(images/invalid.png);}

        .formAdd ul li input[type=text]{
            -webkit-transition: padding 0.25s;
            -moz-transition: padding 0.25s;
            -ms-transition: padding 0.25s;
            -o-transition: padding 0.25s;
            transition: padding 0.25s;}
        .formAdd ul li input:focus{padding-right: 30px;}
        
        /*buttons*/
.action-button {
	width: 80px;
	background: #27AE60;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 1px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px;
}
.action-button:hover,
.action-button:focus {
	box-shadow: 0 0 0 2px white, 0 0 0 3px #27AE60;
}
#logout{
	position: absolute;
	right:200px;
	top:150px;
}
.company_info{
            width: 500px;
            height: auto;
            position:absolute;
            top:20%;
            left:200px;
            background:#f6f6f6;
            margin: 40px auto;
            padding:10px;
        }
        .company_info ul{width: 380px;}
        .company_info *:focus{outline: none}
        .company_info ul li{border-bottom:1px solid #DFDFDF;padding: 12px}
        .company_info ul li label{width:80px;display: inline-block;float: left;}
        .company_info ul li input[type=text]{width: 220px;height: 20px;border:1px solid #AAAAAA;padding: 3px 8px;
        background: url(images/red_asterisk.png) no-repeat #FFF 98%;border-radius:3px;}
        .company_info ul li input:focus{border-color: #C00;background-image:url(images/invalid.png);}

        .company_info ul li input[type=text]{
            -webkit-transition: padding 0.25s;
            -moz-transition: padding 0.25s;
            -ms-transition: padding 0.25s;
            -o-transition: padding 0.25s;
            transition: padding 0.25s;}
        .company_info ul li input:focus{padding-right: 30px;}
</style>
</head>
<body>
	<div class="container">

		<div class="st-container">
			<!-- 底部导航栏开始 -->
			<input type="radio" name="radio-set" checked="checked" id="person">
			<a href="#st-panel-1">招聘信息</a> 
			<input type="radio" name="radio-set" id="company"> 
			<a href="#st-panel-2">公司信息</a>
			<!-- <input type="radio" name="radio-set" id="updateResume"> 
			<a href="#st-panel-3">修改简历</a> -->
			<!-- 底部导航栏结束 -->

			<div class="st-scroll">
				<section class="st-panel" id="st-panel-1">
				<div class="st-desc" data-icon="H"></div>
				<h2 class="title"><s:property value="#session.existCompany.company_name" /></h2>
				<a id="logout" href="${ pageContext.request.contextPath }/admin_logout.action">退出登录</a>
				<div class="st-frame">
				
					<button id="addJobinfo" class="action-button">发布招聘</button>
					
					
					<div id="page" class="tables">
						<table id="table">
							<thead>
								<tr>
									<th>工作岗位</th>
									<th>公司名称</th>
									<th>薪资</th>
									<th>工作地点</th>
									<th>经验</th>
									<th>学历</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="list" var="d">
								<tr style="text-align:center;">
									<td><a href="${ pageContext.request.contextPath }/jobinfo_findById.action?jobinfo_id=<s:property value="#d.jobinfo_id"/>"><s:property value="#d.position"/></a></td>
									<td><s:property value="#d.company.company_name"/></td>
									<td><s:property value="#d.salary"/></td>
									<td><s:property value="#d.experience"/></td>
									<td><s:property value="#d.education"/></td>
									<td><a href="${ pageContext.request.contextPath }/jobinfo_deleteByCompany.action?jobinfo_id=<s:property value="#d.jobinfo_id"/>" onclick="javascript:if(confirm('确定删除？')==false) return false">删除</a></td>
								</tr>
								</s:iterator>
							</tbody>
						</table>
						<table border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td align="right">
									<span>第<s:property value="currPage"/>/<s:property value="totalPage"/>页</span>&nbsp;&nbsp;
									<span>总记录数：<s:property value="totalCount"/>&nbsp;&nbsp;每页显示：<s:property value="pageSize"/></span>
									<span>
										<s:if test="currPage != 1">
											<a href="${ pageContext.request.contextPath }/jobinfo_findByCompany.action?currPage=1">[首页]</a>&nbsp;&nbsp;
											<a href="${ pageContext.request.contextPath }/jobinfo_findByCompany.action?currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
										</s:if>
										<s:if test="currPage != totalPage && totalPage != 0">
											<a href="${ pageContext.request.contextPath }/jobinfo_findByCompany.action?currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
											<a href="${ pageContext.request.contextPath }/jobinfo_findByCompany.action?currPage=<s:property value="totalPage"/>">[尾页]</a>
										</s:if>
									</span>
								</td>
							</tr>
							
						</table>
					</div>
						<div class="showInfo" id="showInfo"style="display:none;background:#f6f6f6">
							<button id="backToSearch" class="action-button">返回</button>
							<div class="formAdd">
							<s:form action="jobinfo_add" method="post" namespace="/">
								<input type="text" style="display:none" name="company.company_id" value="<s:property value="#session.existCompany.company_id"/>">
								<ul>
									<li>
										<label>岗位：</label>
										<input type="text" name="position" required="请输入此字段">
									</li>
									<li>
										<label>薪资：</label>
										<input type="text" name="salary" required="请输入此字段">
									</li>
									<li>
										<label>工作地点：</label>
										<input type="text" name="workplace" required="请输入此字段">
									</li>
									<li>
										<label>工作经验：</label>
										<input type="text" name="experience" required="请输入此字段">
									</li>
									<li>
										<label>学历：</label>
										<input type="text" name="education" required="请输入此字段">
									</li>
									<li>
										<label>具体内容：</label>
										<input type="text" name="content" required="请输入此字段">
									</li>
									<li>
                						<button type="submit" class="action-button">发 布</button>
            						</li>
								</ul>
							</s:form>
							</div>
						</div>
				</div>
				</section>

				<section class="st-panel" id="st-panel-2">
				<div class="st-desc" data-icon="2"></div>
				<h2 class="title"><s:property value="#session.existCompany.company_name" /></h2>
				<s:form action="company_update" method="post" namespace="/" target="nm_iframe">
					<div class="company_info">
						<input type="text" style="display:none" name="company_id" value="<s:property value="#session.existCompany.company_id"/>">
						<input type="text" style="display:none" name="company_pwd" value="<s:property value="#session.existCompany.company_pwd"/>">
								<input type="text" name="company_name" value="<s:property value="#session.existCompany.company_name"/>" required="请输入此字段" style="display:none;">
								<ul>
									<li>
										<label>公司电话：</label>
										<input type="text" name="company_phone" value="<s:property value="#session.existCompany.company_phone"/>" required="请输入此字段">
									</li>
									<li>
										<label>公司地址：</label>
										<input type="text" name="company_address" value="<s:property value="#session.existCompany.company_address"/>" required="请输入此字段">
									</li>
									<li>
										<label>公司性质：</label>
										<input type="text" name="company_nature" value="<s:property value="#session.existCompany.company_nature"/>" required="请输入此字段">
									</li>
									<li>
										<label>公司规模：</label>
										<input type="text" name="company_scale" value="<s:property value="#session.existCompany.company_scale"/>" required="请输入此字段">
									</li>
									<li>
										<label>所属行业：</label>
										<input type="text" name="company_industry" value="<s:property value="#session.existCompany.company_industry"/>" required="请输入此字段">
									</li>
									<li>
										<label>公司介绍：</label>
										<input type="text" name="company_introduce" value="<s:property value="#session.existCompany.company_introduce"/>" required="请输入此字段">
									</li>
									<li>
										<label>公司福利：</label>
										<input type="text" name="company_welfare" value="<s:property value="#session.existCompany.company_welfare"/>" required="请输入此字段">
									</li>
									<li>
                						<button type="submit" class="action-button" onclick="alert('修改成功')">修 改</button>
            						</li>
								</ul>
					</div>
				</s:form>
				
				<!-- 使用隐藏的iframe实现表单提交不刷新页面 -->
				<iframe id="nm_iframe" name="nm_iframe" style="display:none"></iframe>
				</section>
				
			</div>
		</div>
	</div>
</body>
</html>