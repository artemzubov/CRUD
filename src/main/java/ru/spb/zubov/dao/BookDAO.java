package ru.spb.zubov.dao;

import java.util.List;
import ru.spb.zubov.model.Book;

public interface BookDAO {

	void addBook(Book book);

	List<Book> getAllBooks(String title,
						   String description,
						   String author,
						   String isbn,
						   String yearFrom,
						   String yearTo,
						   String readAlready);

	void deleteBook(Integer id);

	Book updateBook(Book book);

	Book getBook(Integer id);
}
