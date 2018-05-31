package ru.spb.zubov.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ru.spb.zubov.model.Book;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void addBook(Book book) {
		sessionFactory.getCurrentSession().saveOrUpdate(book);
	}

	@SuppressWarnings("unchecked")
	public List<Book> getAllBooks(String queryString) {
		return sessionFactory.getCurrentSession().createQuery(queryString).list();
	}

	public void deleteBook(Integer id) {
		Book book = sessionFactory.getCurrentSession().load(Book.class, id);
		if (null != book) {
			this.sessionFactory.getCurrentSession().delete(book);
		}
	}

	public Book getBook(int id) {
		return sessionFactory.getCurrentSession().get(Book.class, id);
	}

	public Book updateBook(Book book) {
		sessionFactory.getCurrentSession().update(book);
		return book;
	}

}