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
<link type="text/css" rel="stylesheet" href="./css/customer.css">
<link rel="stylesheet" type="text/css" href="./css/public.css">



<title>查看招聘信息详情</title>

<script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
<style type="text/css">
	body{
            font: 14px/28px "微软雅黑";
        }
        .contact{
            width: 380px;
            height: auto;
            background:#f6f6f6;
            margin: 40px auto;
            padding:10px;
        }
        .contact ul{width: 380px;}
        .contact *:focus{outline: none}
        .contact ul li{border-bottom:1px solid #DFDFDF;padding: 12px}
        .contact ul li label{width:80px;display: inline-block;float: left;}
        .contact ul li input[type=text]{width: 220px;height: 20px;border:1px solid #AAAAAA;padding: 3px 8px;
        background: url(images/red_asterisk.png) no-repeat #FFF 98%;border-radius:3px;}
        .contact ul li input:focus{border-color: #C00;background-image:url(images/invalid.png);}

        .contact ul li input[type=text]{
            -webkit-transition: padding 0.25s;
            -moz-transition: padding 0.25s;
            -ms-transition: padding 0.25s;
            -o-transition: padding 0.25s;
            transition: padding 0.25s;}
        .contact ul li input:focus{padding-right: 30px;}
        
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
</style>

</head>
<body>
	<div class="container">
		<div class="st-container">
			<div class="st-scroll">
			
				<section class="st-panel" id="st-panel-1">
				<div class="st-desc" data-icon="H"></div>
				<h2 class="title">招 聘 详 情</h2>
				<div class="st-frame">
					<button class="action-button" onclick="javascript:history.back(-1)">返回</button>
					<div style="height:500px;">
						<div class="contact" style="float:left;width:40%;margin-top: 0px;margin-left: 0px">
       				 		<ul>
            					<li>
                					<label>招聘岗位：</label>
                					<span><s:property value="#session.findJobinfo.position"/></span>
            					</li>
            					<li>
                					<label> 薪    资：</label>
                					<span><s:property value="#session.findJobinfo.salary"/></span>
            					</li>
            					<li>
                					<label>工作地点：</label>
                					<span><s:property value="#session.findJobinfo.workplace"/></span>
            					</li>
            					<li>
                					<label>工作经验：</label>
                					<span><s:property value="#session.findJobinfo.experience"/></span>
            					</li>
            					<li>
                					<label> 学    历：</label>
                					<span><s:property value="#session.findJobinfo.education"/></span>
            					</li>
            					<li>
                					<label>具体内容：</label>
                					<span><s:property value="#session.findJobinfo.content"/></span>
            					</li>
            					<li>
 			       					<a href="${ pageContext.request.contextPath }/middle_add.action?customerName=<s:property value="#session.resume.person_name"/>&companyId=<s:property value="#session.findJobinfo.company.company_id"/>&jobinfoId=<s:property value="#session.findJobinfo.jobinfo_id"/>" onclick="if(confirm('是否投递简历 ')==false) return false;">投简历</a>
            					</li>
        					</ul>
						</div>
						<div class="contact" style="float:right;width:480px;margin-top: 0px;margin-right:50px;background:#f6f6f6;height:475px;">
							<ul>
								<li>
									<label>公司名称：</label>
									<span><s:property value="#session.findJobinfo.company.company_name"/></span>
								</li>
								<li>
									<label>公司电话：</label>
									<span><s:property value="#session.findJobinfo.company.company_phone"/></span>
								</li>
								<li>
									<label>公司地址：</label>
									<span><s:property value="#session.findJobinfo.company.company_address"/></span>
								</li>
								<li>
									<label>公司性质：</label>
									<span><s:property value="#session.findJobinfo.company.company_nature"/></span>
								</li>
								<li>
									<label>公司规模：</label>
									<span><s:property value="#session.findJobinfo.company.company_scale"/></span>
								</li>
								<li>
									<label>公司行业：</label>
									<span><s:property value="#session.findJobinfo.company.company_industry"/></span>
								</li>
								<li>
									<label>公司福利：</label>
									<span><s:property value="#session.findJobinfo.company.company_welfare"/></span>
								</li>
								<li>
									<label>公司简介：</label>
									<span><s:property value="#session.findJobinfo.company.company_introduce"/></span>
								</li>
								
							</ul>
						</div>
					</div>
				</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>