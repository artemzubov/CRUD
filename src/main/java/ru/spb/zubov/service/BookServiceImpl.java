package ru.spb.zubov.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ru.spb.zubov.dao.BookDAO;
import ru.spb.zubov.model.Book;

@Service
@Transactional
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDAO bookDAO;

    public void setBookDAO(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

	public void addBook(Book book) {
		bookDAO.addBook(book);
	}

	public List<Book> getAllBooks(String queryString) {
		return bookDAO.getAllBooks(queryString);
	}

	public void deleteBook(Integer id) {
		bookDAO.deleteBook(id);
	}

	public Book getBook(int id) {
		return bookDAO.getBook(id);
	}

	public Book updateBook(Book book) {
		return bookDAO.updateBook(book);
	}

}
