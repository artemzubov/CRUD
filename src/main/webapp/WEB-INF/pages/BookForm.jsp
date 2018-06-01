<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>
    <c:if test="${!empty book.title}">
        Update book
    </c:if>
    <c:if test="${empty book.title}">
        Add new book
    </c:if>
</title>
</head>
<body>
    <div align="center">
        <h1>
            <c:if test="${!empty book.title}">
                Update book
            </c:if>
            <c:if test="${empty book.title}">
                Add new book
            </c:if>
        </h1>
        <form:form action="saveBook" method="post" modelAttribute="book">
        <table border="1">
            <form:hidden path="id"/>
            <tr>
                <td>Title:</td>
                <td><form:input path="title" /></td>
            </tr>
            <tr>
                <td>Description:</td>
                <td><form:input path="description" /></td>
            </tr>
            <tr>
                <td>Author:</td>
                <td>
                    <%--The same page for creating and editing
                     and if book already exist we cannot let anybody change author--%>
                    <c:if test="${!empty book.author}">
                        <form:input path="author" readonly="true"/>
                    </c:if>
                    <c:if test="${empty book.author}">
                        <form:input path="author"/>
                    </c:if>
                </td>
            </tr>
            <tr>
                <td>ISBN:</td>
                <td><form:input path="isbn" /></td>
            </tr>
            <tr>
                <td>Year:</td>
                <td><form:input path="printYear" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>