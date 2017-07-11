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



<title>大风网</title>

<script type="text/javascript" src="./js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	
	//与window.onload作用一样，不过可以同时加载多个函数	
	function addLoadEvent(func) {
		var oldonload = window.onload;
		if (typeof window.onload != 'function') {
			window.onload = func;
		} else {
			window.onload = function() {
				oldonload();
				func();
			}
		}
	}
	function getDom(id) {
		return document.getElementById(id);
	}
	function showProvince() {
		getDom("selectProvince").onclick = showAllProvince;
	}
	function showPro() {
		getDom("selectPro").onclick = showAllPro;
	}
	//显示所有的省份
	function showAllProvince() {
		
		getDom("allProvince").style.display = "block";
		getDom("selectProvince").style.color = "#CCCCCC";
		selectProvince();
	}
	function showAllPro() {
		getDom("allPro").style.display = "block";
		getDom("selectPro").style.color = "#CCCCCC";
		selectPro();
	}
	//隐藏所有的省份
	function hideAllProvince() {
		getDom("allProvince").style.display = "none";
		getDom("selectProvince").style.color = "#000000";
	}
	function hideAllPro() {
		getDom("allPro").style.display = "none";
		getDom("selectPro").style.color = "#000000";
	}
	//选择省份时触发的事件
	function selectProvince() {
		var province = getDom("allProvince").getElementsByTagName("li");
		var links;
		for (var i = 0; i < province.length; i++) {
			links = province[i].getElementsByTagName("span");
			for (var j = 0; j < links.length; j++) {
				links[j].onclick = function() {
					getDom("selectProvince").innerHTML = this.innerHTML;
					getDom("searchWorkplace").value = getDom("selectProvince").innerHTML;
					hideAllProvince();
				}
			}
		}
	}
	function selectPro() {
		var pro = getDom("allPro").getElementsByTagName("li");
		var links;
		for (var i = 0; i < pro.length; i++) {
			links = pro[i].getElementsByTagName("span");
			for (var j = 0; j < links.length; j++) {
				links[j].onclick = function() {
					getDom("selectPro").innerHTML = this.innerHTML;
					getDom("searchPosition").value = getDom("selectPro").innerHTML;
					hideAllPro();
				}
			}
		}
	}
	addLoadEvent(showProvince);
	addLoadEvent(showPro);
	
	/* function showInfo_1(){
		var xhr = createXmlHttp();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){

					getDom("showInfo").innerHTML = xhr.responseText;
					getDom("showInfo").style.display = "block";
				}
			}
		}
		xhr.open("GET","${ pageContext.request.contextPath }/jobinfo_showDetail.action?jobinfo_id=1",true);
		xhr.send(null);
	}
	function createXmlHttp(){
		var xmlHttp;
		try{
			xmlHttp = new XMLHttpRequest();
		}
		catch(e){
			try{
				xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
			}
			catch(e){
				try{
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				catch(e){}
			}
		}
		return xmlHttp;
	} */
	function backToSearch(){
		getDom("showInfo").style.display = "none";
	}

	
</script>
<style type="text/css">
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
.divleft{
	width:30%;
	margin-top: 180px;
	margin-left: 180px;
}
.divright{
	width:50%;
	margin-top: 180px;
	margin-left: 0px;
	
}
#indexResume{
	position: absolute;
	top: 40%;
	left: 40%;
}
.resumediv ul{width: 400px;}
        .resumediv *:focus{outline: none}
        .resumediv ul li{border-bottom:1px solid #DFDFDF;padding: 12px}
        .resumediv ul li label{width:80px;display: inline-block;float: left;}
        .resumediv ul li input[type=text]{width: 220px;height: 20px;border:1px solid #AAAAAA;padding: 3px 8px;
        background: url(images/red_asterisk.png) no-repeat #FFF 98%;border-radius:3px;}
        .resumediv ul li input:focus{border-color: #C00;background-image:url(images/invalid.png);}

        .resumediv ul li input[type=text]{
            -webkit-transition: padding 0.25s;
            -moz-transition: padding 0.25s;
            -ms-transition: padding 0.25s;
            -o-transition: padding 0.25s;
            transition: padding 0.25s;}
        .resumediv ul li input:focus{padding-right: 30px;}
</style>

</head>
<body>
	<div class="container">

		<div class="st-container">
			<!-- 底部导航栏开始 -->
			<input type="radio" name="radio-set" checked="checked" id="person">
			<a href="#st-panel-1">所有信息</a> 
			<input type="radio" name="radio-set" id="company"> 
			<a href="#st-panel-2">我的简历</a>
			<!-- <input type="radio" name="radio-set" id="updateResume"> 
			<a href="#st-panel-3">修改简历</a> -->
			<!-- 底部导航栏结束 -->

			<div class="st-scroll">
				<section class="st-panel" id="st-panel-1">
				<div class="st-desc" data-icon="H"></div>
				<h2 class="title">所 有 招 聘</h2>
				<div class="st-frame">
				<s:form action="jobinfo_findIndex" method="post" namespace="/">
					<div class="province">
						<strong>工作地点：</strong> <span id="selectProvince"></span>
						<ul id="allProvince">
							<li><b>A</b><span>安徽</span><span>澳门</span></li>
							<li><b>B</b><span>北京</span></li>
							<li><b>C</b><span>重庆</span></li>
							<li><b>F</b><span>福建</span></li>
							<li><b>G</b><span>广东</span><span>广西</span><span>甘肃</span><span>贵州</span></li>
							<li><b>H</b><span>湖南</span><span>湖北</span><span>河南</span><span>河北</span></li>
							<li><b> </b><span>黑龙江</span><span>海南</span></li>
							<li><b>J</b><span>江苏</span><span>江西</span><span>吉林</span></li>
							<li><b>L</b><span>辽宁</span></li>
							<li><b>N</b><span>内蒙古</span><span>宁夏</span></li>
							<li><b>Q</b><span>青海</span></li>
							<li><b>S</b><span>上海</span><span>四川</span><span>山东</span><span>山西</span><span>陕西</span></li>
							<li><b>T</b><span>天津</span><span>台湾</span></li>
							<li><b>X</b><span>香港</span><span>新疆</span><span>西藏</span></li>
							<li><b>Y</b><span>云南</span></li>
							<li><b>Z</b><span>浙江</span></li>
						</ul>
					</div>
					<div class="profession">
						<strong>职业:</strong> <span id="selectPro"></span>
						<ul id="allPro">
							<li><b></b><span>架构师</span></li>
							<li><b></b><span>UI设计师</span></li>
							<li><b></b><span>Web程序员</span></li>
							<li><b></b><span>嵌入式</span></li>
							<li><b></b><span>网络通信</span></li>
						</ul>
					</div>
					<input id="searchWorkplace" type="text" name="searchWorkplace" style="display:none" placeholder="工作地点"/>
					<input id="searchPosition" type="text" name="searchPosition" style="display:none" placeholder="职位"/>
					<button class="chaxun" type="submit">查 询</button>
					</s:form>
					
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
									<td><a href="${ pageContext.request.contextPath }/jobinfo_findByIndex.action?jobinfo_id=<s:property value="#d.jobinfo_id"/>"><s:property value="#d.position"/></a></td>
									<td><s:property value="#d.company.company_name"/></td>
									<td><s:property value="#d.salary"/></td>
									<td><s:property value="#d.workplace"/></td>
									<td><s:property value="#d.experience"/></td>
									<td><a href="${ pageContext.request.contextPath }/customer_toIndex.action?" onclick="if(confirm('您还未登录，去登录吗？ ')==false) return false;">投简历</a></td>
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
											<a href="${ pageContext.request.contextPath }/jobinfo_findIndex.action?searchWorkplace=<s:property value="searchWorkplace"/>&searchPosition=<s:property value="searchPosition"/>&currPage=1">[首页]</a>&nbsp;&nbsp;
											<a href="${ pageContext.request.contextPath }/jobinfo_findIndex.action?searchWorkplace=<s:property value="searchWorkplace"/>&searchPosition=<s:property value="searchPosition"/>&currPage=<s:property value="currPage-1"/>">[上一页]</a>&nbsp;&nbsp;
										</s:if>
										<s:if test="currPage != totalPage && totalPage != 0">
											<a href="${ pageContext.request.contextPath }/jobinfo_findIndex.action?searchWorkplace=<s:property value="searchWorkplace"/>&searchPosition=<s:property value="searchPosition"/>&currPage=<s:property value="currPage+1"/>">[下一页]</a>&nbsp;&nbsp;
											<a href="${ pageContext.request.contextPath }/jobinfo_findIndex.action?searchWorkplace=<s:property value="searchWorkplace"/>&searchPosition=<s:property value="searchPosition"/>&currPage=<s:property value="totalPage"/>">[尾页]</a>
										</s:if>
									</span>
								</td>
							</tr>
							
						</table>
					</div>
						<div id="showInfo"style="display:none;background:#CCC">
							<button id="backToSearch">返回</button>
							
						</div>		
				</div>
				</section>

				<section class="st-panel" id="st-panel-2">
				<div class="st-desc" data-icon="2"></div>
				<h2 class="title">简&nbsp;&nbsp;&nbsp;历</h2>
				<div id="indexResume">
					<a href="${ pageContext.request.contextPath }/customer_toIndex.action?">您还没有登录，去登录吧！</a>
				</div>
				</section>
			</div>
		</div>
	</div>
</body>
</html>