<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>student add page</title>
    </head>
    <body>
        <h1>Student Create</h1>
        <form action="${ctx}/student/create" method="post">
            <input name="email" placeholder="EMAIL"><br>
            <input name="username" placeholder="USERNAME"><br>
            <input type="password" name="password" placeholder="PASSWORD"><br>
            <input name="gender" placeholder="GENDER"><br>
            <input type="date" name="dob" placeholder="DOB"><br>
            <input name="phone" placeholder="PHONE"><br>
            <input name="education" placeholder="EDUCATION"><br>
            <input name="major" placeholder="MAJOR"><br>
            <input name="academy" placeholder="ACADEMY"><br>
            <input type="date" name="graduation" placeholder="GRADUATION"><br>
            <input name="training" placeholder="TRAINING"><br>
            <input name="experience" placeholder="EXPERIENCE"><br>
            <input type="file" name="photo" placeholder="PHOTO"><br>
            <input name="remark" placeholder="REMARK"><br>
            <input name="card" placeholder="CARD"><br>
            <select name="classId">
                <c:forEach var="clazz" items="${sessionScope.classes}">
                    <option value="${clazz.id}">${clazz.title}</option>
                </c:forEach>
            </select><br>
            <input type="submit" value="注册">
        </form>
    </body>
</html>