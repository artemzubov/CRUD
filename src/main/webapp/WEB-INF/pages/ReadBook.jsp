<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Read Book</title>
</head>
<body>
    <div align="center">
        <h1>Read Book</h1>
        <form:form action="readBook" method="post" modelAttribute="book">
        <table>
            <form:hidden path="id"/>
            <tr>
                <td>Title:</td>
                <td><form:input path="title" readonly="true"/></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><form:input path="description" readonly="true"/></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td><form:input path="author" readonly="true"/></td>
            </tr>
            <tr>
                <td>ISBN:</td>
                <td><form:input path="isbn" readonly="true"/></td>
            </tr>
            <tr>
                <td>Year:</td>
                <td><form:input path="printYear" readonly="true"/></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="I read it. Good."></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>