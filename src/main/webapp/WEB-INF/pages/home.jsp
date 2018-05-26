<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

			<c:forEach var="book" items="${listBook}">
				<tr>

					<td>${book.id}</td>
					<td>${book.title}</td>
					<td>${book.description}</td>
					<td>${book.author}</td>
					<td>${book.isbn}</td>
					<td>${book.printYear}</td>
					<td>${book.readAlready}</td>

					<td><a href="editBook?id=${book.id}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="deleteBook?id=${book.id}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			Add new Book <a href="newBook">here</a>
		</h4>
	</div>
</body>
</html>