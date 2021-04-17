<!DOCTYPE html>
<%@ page pageEncoding="UTF-8" %>
<%@ include file="/common/inc.jsp" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>注册 - 学生</title>
</head>
<body>
<h1>注册</h1>
<form action="${ctx}/student/register" method="post" enctype="multipart/form-data">
    班级
    <select name="classId">
    <c:forEach var="clazz" items="${sessionScope.classes}">
        <option value="${clazz.id}">${clazz.title}</option>
    </c:forEach>
    </select><br>
    <input name="email" placeholder="EMAIL" value="student@tsinghua.edu.cn"><br>
    <input name="username" placeholder="USERNAME" value="学生"><br>
    <input type="password" name="password" placeholder="密码" value="123"><br>
    <input type="password" name="repassword" placeholder="重复密码" value="123"><br>
    <input type="radio" name="gender" value="男" checked="checked">男
    <input type="radio" name="gender" value="女">女<br>
    出生日期 <input name="dob" placeholder="DOB" value="1990-1-1"><br>
    <input name="phone" placeholder="PHONE" value="13512345678"><br>
    <input name="education" placeholder="EDUCATION" value="清华大学"><br>
    <input name="major" placeholder="MAJOR" value="计算机"><br>
    <input name="academy" placeholder="ACADEMY" value="清华大学"><br>
    毕业日期 <input name="graduation" placeholder="GRADUATION" value="2012-7-1"><br>
    <textarea name="training" placeholder="TRAINING">无</textarea><br>
    <textarea name="experience" placeholder="EXPERIENCE">无</textarea><br>
    上传照片 <input type="file" name="photoFile" placeholder="PHOTO">（不能超过1M，jpg,png格式）<br>
    <textarea name="remark" placeholder="REMARK">备注信息</textarea><br>
    <input name="card" placeholder="CARD" value="20160001"><br>
    <input type="submit" value="注册">
</form>
${requestScope.message}
</body>
</html>