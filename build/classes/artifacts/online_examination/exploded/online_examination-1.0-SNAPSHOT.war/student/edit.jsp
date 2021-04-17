<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>student edit page</title>
    </head>
    <body>
        <h1>Student Edit</h1>
        <form action="${ctx}/student/modify" method="post">
            <input type="hidden" name="id" value="${sessionScope.student.id}">
            EMAIL: <input name="email" value="${sessionScope.student.email}"><br>
            USERNAME: <input name="username" value="${sessionScope.student.username}"><br>
            PASSWORD: <input name="password" value="${sessionScope.student.password}"><br>
            GENDER: <input name="gender" value="${sessionScope.student.gender}"><br>
            DOB: <input name="dob" value="${sessionScope.student.dob}"><br>
            PHONE: <input name="phone" value="${sessionScope.student.phone}"><br>
            EDUCATION: <input name="education" value="${sessionScope.student.education}"><br>
            MAJOR: <input name="major" value="${sessionScope.student.major}"><br>
            ACADEMY: <input name="academy" value="${sessionScope.student.academy}"><br>
            GRADUATION: <input name="graduation" value="${sessionScope.student.graduation}"><br>
            TRAINING: <input name="training" value="${sessionScope.student.training}"><br>
            EXPERIENCE: <input name="experience" value="${sessionScope.student.experience}"><br>
            PHOTO: <input name="photo" value="${sessionScope.student.photo}"><br>
            REMARK: <input name="remark" value="${sessionScope.student.remark}"><br>
            CARD: <input name="card" value="${sessionScope.student.card}"><br>
            LASTIP: <input name="lastIp" value="${sessionScope.student.lastIp}"><br>
            LASTLOGIN: <input name="lastLogin" value="${sessionScope.student.lastLogin}"><br>
            CLASSID: <input name="classId" value="${sessionScope.student.classId}"><br>
            <input type="submit" value="MODIFY">
        </form>
    </body>
</html>