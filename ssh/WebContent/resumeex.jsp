<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><s:property value="#session.resume.person_name"/>的简历</title>
    <link rel="stylesheet" type="text/css" href="./css/1.css">
</head>
<body>
<div class="wrap">
    <div class="title" id="top">
        <div class="topic">
            <h2><s:property value="#session.resume.person_name"/></h2>
            <span><s:property value="#session.resume.graduation"/> 毕业</span>
            <span><s:property value="#session.resume.pro_and_hobby"/></span>
        </div>
        <div class="contacts">
            <ul>
                <li>电话:<s:property value="#session.resume.cellphone"/></li>
                <li>邮箱:<s:property value="#session.resume.person_email"/></li>
            </ul>
        </div>
    </div>
    <div class="mainbody">
        <div class="profile">
            <h3>关于我</h3>
            <p><s:property value="#session.resume.introduce_and_evaluate"/></p>
        </div>
        <div class="experience">
            <h3>经历</h3>
            <div class="timeline">
                <div class="timeline_left">
                    <img src="images/timeline.png" alt="">
                </div>
                <div class="timeline_right">
                    <span style="margin-bottom:110px"><s:property value="#session.resume.experience_date1"/></span>
                    <span style="margin-top: 100px"><s:property value="#session.resume.experience_date2"/></span>
                    <span style="margin-top: 140px"><s:property value="#session.resume.experience_date3"/></span>
                </div>
            </div>
            <div class="content">
                <div class="jobExperience">
                    <h3><s:property value="#session.resume.experience_title1"/></h3>
                    <p><s:property value="#session.resume.experience_content1"/></p>
                </div>
                	<br>
                	<br>
                <div class="education">
                    <div style="margin-bottom: 60px">
                        <h3><s:property value="#session.resume.experience_title2"/></h3>
                        <p><s:property value="#session.resume.experience_content2"/></p>
                    </div>
                    <br>
                    <br>

                    <div style="margin-bottom: 90px">
                        <h3><s:property value="#session.resume.experience_title3"/></h3>
                        <p><s:property value="#session.resume.experience_content3"/></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="skill">
            <h3>技能</h3>
            <div class="skill_box">
                <ul>
                    <li>
                        <div class="skill_left">前端:</div>
                        <div class="skill_right">
                        	<s:property value="#session.resume.about_skill1"/>颗星
                            <img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt="">
                        </div>
                    </li>
                    <li>
                        <div class="skill_left">后台:</div>
                        <div class="skill_right">
                        	<s:property value="#session.resume.about_skill2"/>颗星
                            <img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt="">
                        </div>
                    </li>
                    <li>
                        <div class="skill_left">英语:</div>
                        <div class="skill_right">
                        	<s:property value="#session.resume.about_skill3"/>颗星
                            <img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt=""><img src="images/star.png" alt="">
                        </div>
                    </li>
                    
                </ul>

            </div>
        </div>
        <div class="backTop">
            <a href="#top"><img src="images/top.png" alt="返回顶部"></a>
        </div>
    </div>
</div>



</body>
</html>