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
        Page for book reading
    </title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body class="w3-sand">

<div>
    <div class="w3-container w3-blue-grey w3-opacity w3-right-align">
        <h1>Book shelf Application</h1>
    </div>
</div>

<div class="w3-container w3-padding">
    <div class="w3-card-4">

        <div class="w3-container w3-center w3-green">
            <h1>
                Book reading
            </h1>
        </div>

        <form:form action="readBook" method="post" modelAttribute="book" class="w3-selection w3-light-grey w3-padding">
            <table align="center">
                <form:hidden path="id"/>
                <tr>
                    <td width="150">Title:</td>
                    <td width="500"><form:input type="text" path="title" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 80%" readonly="true"/></td>
                </tr>
                <tr>
                    <td>Description:</td>
                    <td><form:input type="text" path="description" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 80%" readonly="true"/></td>
                </tr>
                <tr>
                    <td>Author:</td>
                    <td>
                        <form:input type="text" path="author" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 80%" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td>ISBN:</td>
                    <td>
                        <form:input type="text" path="isbn" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 80%" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td>Year:</td>
                    <td>
                        <form:input type="text" path="printYear" class="w3-input w3-animate-input w3-border w3-round-large" style="width: 80%" readonly="true"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" height="300">
                        This is where the text of the book could be placed
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">
                            I read this Book.
                        </button>
                    </td>
                </tr>
            </table>
        </form:form>
    </div>
</div>
<div class="w3-container w3-grey w3-opacity w3-right-align w3-padding">
    <button class="w3-btn w3-round-large" onclick="location.href='/'">Back to list of Books</button>
</div>
</body>
</html>