<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Book Shelf</title>
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
                    List of books
                </h1>
            </div>

            <div class="w3-responsive">
                <table class="w3-table w3-bordered w3-border w3-small w3-hoverable w3-centered w3-striped">

                    <tr class="w3-blue">
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Author</th>
                        <th>ISBN</th>
                        <th>Year</th>
                        <th>ReadAlready</th>
                        <th width="350">Action</th>
                    </tr>

                    <tr>
                        <form action="">
                            <td>
                                This line is for searching.
                            </td>
                            <td>
                                Title:<input type="text" size="12" name="title" value="${title}">
                            </td>
                            <td>
                                Description contains:<input type="text" size="15" name="description" value="${description}">
                            </td>
                            <td>
                                Author:<input type="text" size="15" name="author" value="${author}">
                            </td>
                            <td>
                                ISBN:<input type="text" size="10" name="isbn" value="${isbn}">
                            </td>
                            <td>
                                Date from:<br> <input type="text" size="8" name="yearFrom" value="${yearFrom}"><br>
                                Date to:<br> <input type="text" size="8" name="yearTo" value="${yearTo}">
                            </td>
                            <td>
                                Was it read?<br>
                                true = read already<br>
                                any other = unread still
                                <br>
                                <input type="text" name="readAlready" list="list" value="${readAlready}">
                                <datalist id="list">
                                    <option value="true">
                                    <option value="false">
                                </datalist>
                            </td>
                            <td>
                                <button type="submit" class="w3-btn w3-green w3-round-large w3-margin-bottom">Find</button>
                                <br>
                                <a class="w3-btn w3-red w3-round-large" href="http://localhost:8080/?title=&description=&author=&isbn=&yearFrom=&yearTo=&readAlready=">Drop filters</a>
                            </td>
                        </form>
                    </tr>

                    <c:forEach var="book" items="${listBook}">
                        <tr>

                            <td>${book.id}</td>
                            <td>${book.title}</td>
                            <td>${book.description}</td>
                            <td>${book.author}</td>
                            <td>${book.isbn}</td>
                            <td>${book.printYear}</td>
                            <td>
                                <c:choose>
                                    <c:when test="${book.readAlready}">
                                        Read already
                                    </c:when>
                                    <c:otherwise>
                                        Unread still
                                    </c:otherwise>
                                </c:choose>
                            </td>

                            <td>
                                <a class="w3-btn w3-green w3-round-large" href="readBook?id=${book.id}">Read</a>
                                &nbsp;&nbsp;
                                <a class="w3-btn w3-yellow w3-round-large" href="editBook?id=${book.id}">Edit</a>
                                &nbsp;&nbsp;
                                <a class="w3-btn w3-red w3-round-large" href="deleteBook?id=${book.id}">Delete</a>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <div class="w3-container w3-center">
            <h3>
                <a class="w3-btn w3-green w3-round-large" href="newBook" style="width:30%">Add new Book</a>
            </h3>
        </div>

	</div>

    <div class="w3-center">
        <div class="w3-bar w3-border w3-round">

            <c:url value="/" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
                <a class="w3-button" href="<c:out value="${prev}&title=${param.title}&description=${param.description}&author=${param.author}&isbn=${param.isbn}&yearFrom=${param.yearFrom}&yearTo=${param.yearTo}&readAlready=${param.readAlready}" />">&#10094; Previous</a>
            </c:if>

            <c:forEach begin="1" end="${pageCount}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${page == i.index}">
                        <a class="w3-button w3-green">${i.index}</a>
                    </c:when>
                    <c:otherwise>
                        <c:url value="/" var="url">
                            <c:param name="page" value="${i.index}"/>
                        </c:url>
                        <a class="w3-button" href="<c:out value="${url}&title=${param.title}&description=${param.description}&author=${param.author}&isbn=${param.isbn}&yearFrom=${param.yearFrom}&yearTo=${param.yearTo}&readAlready=${param.readAlready}" />">${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="/" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= pageCount}">
                <a class="w3-button" href="<c:out value="${next}&title=${param.title}&description=${param.description}&author=${param.author}&isbn=${param.isbn}&yearFrom=${param.yearFrom}&yearTo=${param.yearTo}&readAlready=${param.readAlready}" />">Next &#10095;</a>
            </c:if>
        </div>
    </div>
</body>
</html>