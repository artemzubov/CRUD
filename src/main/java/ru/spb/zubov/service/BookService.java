package ru.spb.zubov.service;

import java.util.List;

import ru.spb.zubov.model.Book;

public interface BookService {
	
	void addBook(Book book);

	List<Book> getAllBooks();

	void deleteBook(Integer bookId);

	Book getBook(int bookid);

	Book updateBook(Book book);
}
