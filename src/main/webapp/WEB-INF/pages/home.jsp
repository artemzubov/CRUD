<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Shelf</title>
</head>
<body>
	<div align="center">
		<h1>List of Books</h1>
		
		<table border="1">

			<th width="100">ID</th>
			<th width="100">Title</th>
			<th width="100">Description</th>
			<th width="100">Author</th>
			<th width="100">ISBN</th>
			<th width="100">Year</th>
			<th width="100">ReadAlready</th>
			<th width="150">Action</th>

			<tr>

				<td>This line is for searching.</td>
				<td>
					<p><input name="title" value="${title}"/></p>
				</td>
				<td>3</td>
				<td>4</td>
				<td>5</td>
				<td>6</td>
				<td>7</td>

				<td>

					<%--<c:url value="/" var="next">--%>
						<%--<c:param name="page" value="${page + 1}"/>--%>
					<%--</c:url>--%>
					<%--<c:if test="${page + 1 <= pageCount}">--%>
						<%--<a href='<c:out value="${next}" />' class="pn next">Find</a>--%>
					<%--</c:if>--%>


					<%--<c:url value="/" var="home">--%>
						<%--<c:param name="title" value="${title}"/>--%>
					<%--</c:url>--%>
					<%--<c:choose>--%>
						<%--<c:when test="${!empty title}">--%>
							<%--&lt;%&ndash;<span>${i.index}</span>&ndash;%&gt;--%>
							<%--<a href="">--%>
								<%--Find--%>
							<%--</a>--%>
						<%--</c:when>--%>
						<%--<c:otherwise>--%>
							<%--empty--%>
							<c:url value="/" var="url">
								<c:param name="title" value="${title}"/>
							</c:url>
							<a href='<c:out value="${url}" />'>Find</a>
						<%--</c:otherwise>--%>
					<%--</c:choose>--%>

				</td>

			</tr>



			<c:forEach var="book" items="${listBook}">
				<tr>

					<td>${book.id}</td>
					<td>${book.title}</td>
					<td>${book.description}</td>
					<td>${book.author}</td>
					<td>${book.isbn}</td>
					<td>${book.printYear}</td>
					<td>${book.readAlready}</td>

					<td><a href="readBook?id=${book.id}">Read</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="editBook?id=${book.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="deleteBook?id=${book.id}">Delete</a>
					</td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			Add new Book <a href="newBook">here</a>
		</h4>
	</div>
	<div id="pagination" align="center">

		<c:url value="/" var="prev">
			<c:param name="page" value="${page-1}"/>
		</c:url>
		<c:if test="${page > 1}">
			<a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
		</c:if>

		<c:forEach begin="1" end="${pageCount}" step="1" varStatus="i">
			<c:choose>
				<c:when test="${page == i.index}">
					<span>${i.index}</span>
				</c:when>
				<c:otherwise>
					<c:url value="/" var="url">
						<c:param name="page" value="${i.index}"/>
					</c:url>
					<a href='<c:out value="${url}" />'>${i.index}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:url value="/" var="next">
			<c:param name="page" value="${page + 1}"/>
		</c:url>
		<c:if test="${page + 1 <= pageCount}">
			<a href='<c:out value="${next}" />' class="pn next">Next</a>
		</c:if>
	</div>
</body>
</html>