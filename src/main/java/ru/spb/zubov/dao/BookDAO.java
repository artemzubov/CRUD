package ru.spb.zubov.dao;

import java.util.List;
import ru.spb.zubov.model.Book;

public interface BookDAO {

	void addBook(Book book);

	List<Book> getAllBooks(String queryString);

	void deleteBook(Integer bookId);

	Book updateBook(Book book);

	Book getBook(int bookid);
}
