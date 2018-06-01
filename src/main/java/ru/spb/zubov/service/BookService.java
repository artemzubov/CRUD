package ru.spb.zubov.service;

import java.util.List;

import ru.spb.zubov.model.Book;

public interface BookService {
	
	void addBook(Book book);

	List<Book> getAllBooks(String title,
						   String description,
						   String author,
						   String isbn,
						   String yearFrom,
						   String yearTo,
						   String readAlready);

	void deleteBook(Integer id);

	Book getBook(Integer id);

	Book updateBook(Book book);
}
