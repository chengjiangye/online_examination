<!DOCTYPE html><%@ page pageEncoding="UTF-8"%><%@ include file="/common/inc.jsp"%>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>student list page</title>
        <script>
            function del() { return confirm('REMOVE?'); }
        </script>
    </head>
    <body>
        <h1>Student List</h1>
        <hr/>
        <c:import url="${ctx}/student/register.jsp"/>
        <hr/>
        <table border="1">
            <tr>
                <th>INDEX</th>
                <th>ID</th>
                <th>EMAIL</th>
                <th>USERNAME</th>
                <th>PASSWORD</th>
                <th>GENDER</th>
                <th>DOB</th>
                <th>PHONE</th>
                <th>EDUCATION</th>
                <th>MAJOR</th>
                <th>ACADEMY</th>
                <th>GRADUATION</th>
                <th>TRAINING</th>
                <th>EXPERIENCE</th>
                <th>PHOTO</th>
                <th>REMARK</th>
                <th>CARD</th>
                <th>LASTIP</th>
                <th>LASTLOGIN</th>
                <th>CLASSID</th>
                <th colspan="2">OPERATION</th>
            </tr>
            <c:forEach var="student" items="${sessionScope.list}" varStatus="vs">
            <tr>
                <td>${vs.count}</td>
                <td>${student.id}</td>
                <td>${student.email}</td>
                <td>${student.username}</td>
                <td>${student.password}</td>
                <td>${student.gender}</td>
                <td>${student.dob}</td>
                <td>${student.phone}</td>
                <td>${student.education}</td>
                <td>${student.major}</td>
                <td>${student.academy}</td>
                <td>${student.graduation}</td>
                <td>${student.training}</td>
                <td>${student.experience}</td>
                <td>${student.photo}</td>
                <td>${student.remark}</td>
                <td>${student.card}</td>
                <td>${student.lastIp}</td>
                <td>${student.lastLogin}</td>
                <td>${student.classId}</td>
                <td><a href="${ctx}/student/queryById/${student.id}">MODIFY</a></td>
                <td><a class="delete" href="${ctx }/student/remove/${student.id}" onclick="return del()">REMOVE</a></td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>