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
    <link type="text/css" rel="stylesheet" href="./css/style.css">
    <link type="text/css" rel="stylesheet" href="./css/zzsc.css">

    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function() {
            $('#button-login').click(function() {
                $('#customer-register').show(500);
            });
            $('#button-login-back').click(function(){
                $('#customer-register').hide(500);
            });
            $('#button-login-1').click(function(){
                $('#company-register').show(500);
            });
            $('#button-login-back-1').click(function(){
                $('#company-register').hide(500);
            });
            $('#admin').click(function(){
                $('#admin-login').show(500);
            });
            $('#button-admin-back').click(function(){
                $('#admin-login').hide(500);
            });

        })
        
        function checkCustomer(){
        	var pwd = document.getElementById("customer_pwd").value;
        	var checkPwd = document.getElementById("checkPwd").value;
        	if(pwd != checkPwd){
        		alert("两次密码不一致");
        		return false;
        	}
        	alert("注册成功！");
        	return true;
        }
        
        function checkCompany(){
        	var pwd = document.getElementById("company_pwd").value;
        	var checkPwd = document.getElementById("checkPwd2").value;
        	if(pwd != checkPwd){
        		alert("两次密码不一致");
        		return false;
        	}
        	alert("注册成功！");
        	return true;
        }
        
        function checkCustomerName(){
        	var customerName = document.getElementById("customer_name").value;
        	var xhr = createXmlHttp();
        	xhr.onreadystatechange = function(){
        		if(xhr.readyState == 4){
        			if(xhr.status == 200){
        				document.getElementById("span1").innerHTML = xhr.responseText;
        			}
        		}
        	}
        	xhr.open("GET","${ pageContext.request.contextPath }/customer_checkCustomerName.action?time="+new Date().getTime()+"&customer_name="+customerName,true);
        	xhr.send(null);
        }
        
        function checkCompanyName(){
        	var companyName = document.getElementById("company_name").value; 
        	var xhr = createXmlHttp();
        	xhr.onreadystatechange = function(){
        		if(xhr.readyState == 4){
        			if(xhr.status == 200){
        				document.getElementById("span2").innerHTML = xhr.responseText;
        			}
        		}
        	}
        	xhr.open("GET","${ pageContext.request.contextPath }/company_checkCompanyName.action?time="+new Date().getTime()+"&company_name="+companyName,true);
        	xhr.send(null);
        }
        
        function createXmlHttp(){
        	var xmlHttp;
        	try{
        		xmlHttp = new XMLHttpRequest();
        	}
        	catch(e){
        		try{
        			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        		}
        		catch(e){
        			try{
        				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        			}
        			catch(e){
        				
        			}
        		}
        	}
        	return xmlHttp;
        }
    </script>


    <title>大风网</title>
</head>
<body>
<div class="container">

    <div class="st-container">
        <!-- 底部导航栏开始 -->
        <input type="radio" name="radio-set" checked="checked" id="person">
        <a href="#st-panel-1">个 人</a> <input type="radio" name="radio-set"
                                             id="company"> <a href="#st-panel-2">公 司</a>
        <!-- 底部导航栏结束 -->

        <div class="st-scroll">
            <section class="st-panel" id="st-panel-1">
                <div class="st-desc" data-icon="H"></div>
                <h2>求 职</h2>
				<a id="admin" href="#" style="font-size: 12px; margin-left: 1460px; margin-top: 10px;">管理员登录</a>
                <!-- 用户登录功能表单 -->
                <div style="position: relative;">
                    <h3><s:actionerror/></h3>
                    <s:form action="customer_login" method="post" namespace="/">
                        <div class="msform">
                            <h5 class="fs-title">登录</h5>
                            <h3 class="fs-subtitle">welcome</h3>
                            <input type="text" name="customer_name" placeholder="用户名" required="请输入用户名"/>
                            <input type="password" name="customer_pwd" placeholder="密码" required="请输入密码"/>
                            <button type="submit" class="next action-button">登 录</button>
                            <a href="#" id="button-login" style="font-size: 10px;">不是会员？去注册吧</a>
                        </div>
                    </s:form>
                    <!-- 用户注册功能表单 -->
                    <s:form action="customer_register" method="post" namespace="/" onsubmit="return checkCustomer();">
                        <div class="msform" id="customer-register">
                            <h5 class="fs-title">注 册</h5>
                            <h3 class="fs-subtitle">欢迎加入我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           <span id="span1"></span></h3>
                            <input id="customer_name" type="text" name="customer_name" placeholder="用户名" required="请输入用户名" maxlength="10" onblur="checkCustomerName()"/>
                            <span id="span1"></span>
                            <input id="customer_pwd" type="password" name="customer_pwd" placeholder="密码" maxlength="10" required="请输入密码"/>
                            <input id="checkPwd" type="password" name="checkPwd" placeholder="确认密码" maxlength="10" required="请输入确认密码"/>
                            <button type="submit" class="next action-button">注 册</button>
                            <a href="#" id="button-login-back" style="font-size: 10px;">返回登录</a>
                        </div>
                    </s:form>
                    <!-- 管理员登录表单 -->
                    <s:form action="admin_login" method="post" namespace="/">
                        <div class="msform" id="admin-login" style="display:none;">
                            <h5 class="fs-title">登 录</h5>
                            <h3 class="fs-subtitle">请管理员登录！</h3>
                            <input type="text" name="adminName" required="请输入用户名"/>
                            <input type="password" name="adminPwd" required="请输入密码"/>
                            <button type="submit" class="next action-button">登 录</button>
                            <a href="#" id="button-admin-back" style="font-size: 10px;">返回</a>
                        </div>
                    </s:form>
                </div>
            </section>


            <section class="st-panel st-color" id="st-panel-2">
                <div class="st-desc" data-icon="2"></div>
                <h2>招 聘</h2>
                <!-- 公司登录功能表单 -->
                <div style="position: relative;">
                    <s:form action="company_login" method="post" namespace="/" >
                        <div class="msform">
                            <h5 class="fs-title">登录</h5>
                            <h3 class="fs-subtitle">welcome</h3>
                            <input type="text" name="company_name" placeholder="公司名称" required="请输入公司名称"/>
                            <input type="password" name="company_pwd" placeholder="密码" required="请输入密码"/>
                            <button type="submit" class="next action-button">登 录</button>
                            <a href="#" id="button-login-1" style="font-size: 10px;">不是会员？去注册吧</a>
                        </div>
                    </s:form>
                    <!-- 用户注册功能表单 -->
                    <s:form action="company_register" method="post" namespace="/" onsubmit="return checkCompany();">
                        <div class="msform" id="company-register">
                            <h5 class="fs-title">注 册</h5>
                            <h3 class="fs-subtitle">欢迎加入我们&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;           <span id="span2"></span></h3></h3>
                            <input id="company_name" type="text" name="company_name" placeholder="公司名称" required="请输入公司名称" maxlength="20" onblur="checkCompanyName()"/>
                            <input id="company_pwd" type="password" name="company_pwd" placeholder="密码" maxlength="10" required="请输入密码"/>
                            <input id="checkPwd2" type="password" name="checkPwd2" placeholder="确认密码" maxlength="10" required="请输入确认密码"/>
                            <button type="submit" class="next action-button">注 册</button>
                            <a href="#" id="button-login-back-1" style="font-size: 10px;">返回登录</a>
                        </div>
                    </s:form>
                </div>
            </section>

        </div>
    </div>
</div>
</body>
</html>