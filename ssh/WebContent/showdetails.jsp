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
<script type="text/javascript">
	
$(function() {
    $('#addJobinfo').click(function() {
        $('#showInfo').show(500);
    });
    $('#backToSearch').click(function(){
        $('#showInfo').hide(500);
    });
    var text=$("#content1").val();
    $("#content2").val(text);
})

</script>
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
        #content2{font: 14px/28px "微软雅黑";}
        .nameTable td{text-align: center;width:80px;}
        .nameTable tr{border-bottom: 1px solid #DFDFDF;padding:5px}
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

			<!-- <input type="radio" name="radio-set" checked="checked">
			<a href="#st-panel-1">所有信息</a> 
			<input type="radio" name="radio-set"> 
			<a href="#st-panel-2">我的简历</a>> -->


			<div class="st-scroll">
				<section class="st-panel" id="st-panel-1">
				<div class="st-desc" data-icon="H"></div>
				<h2 class="title"><s:property value="#session.existCompany.company_name" /></h2>
				<div class="st-frame">
					<button class="action-button" onclick="javascript:history.back(-1)">返回</button>
					<div style="height:500px;">
						<div class="contact" style="float:left;width:40%;margin-top: 50px;margin-left: 50px">
							<s:form action="jobinfo_update" method="post" namespace="/">
       				 		<input type="text" style="display:none" name="jobinfo_id" value="<s:property value="#session.existCompany.company_id"/>">
							<input type="text" style="display:none" name="company.company_id" value="<s:property value="#session.detailJobinfo.jobinfo_id"/>">
       				 		<input id="content1" type="text" style="display:none"  value="<s:property value="#session.detailJobinfo.content"/>">
       				 		<ul>
            					<li>
                					<label>招聘岗位：</label>
                					<input type="text" name="position" required="请输入此字段" value="<s:property value="#session.detailJobinfo.position"/>">
            					</li>
            					<li>
                					<label>薪资：</label>
                					<input type="text" name="salary" required="请输入此字段" value="<s:property value="#session.detailJobinfo.salary"/>">
            					</li>
            					<li>
                					<label>工作地点：</label>
                					<input type="text" name="workplace" required="请输入此字段" value="<s:property value="#session.detailJobinfo.workplace"/>">
            					</li>
            					<li>
                					<label>工作经验：</label>
                					<input type="text" name="experience" required="请输入此字段" value="<s:property value="#session.detailJobinfo.experience"/>">
            					</li>
            					<li>
                					<label>学历：</label>
                					<input type="text" name="education" required="请输入此字段" value="<s:property value="#session.detailJobinfo.education"/>">
            					</li>
            					<li>
                					<label>内容：</label>
                					<textarea id="content2" rows="3" cols="35" name="content" required="请输入此字段"></textarea>
            					</li>
            					<li>
                					<button class="action-button" type="submit">修 改</button>
            					</li>
        					</ul>
    						</s:form>

						</div>
						<div style="float:right;width:480px;margin-top: 50px;margin-right:50px;background:#f6f6f6;height:475px;">
							<h1>投简历人信息</h1>
							<table class="nameTable">
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
					</div>
				</div>
				</section>

				
				
			</div>
		</div>
	</div>
</body>
</html>