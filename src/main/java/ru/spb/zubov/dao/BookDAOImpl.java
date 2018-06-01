package ru.spb.zubov.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
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
	public List<Book> getAllBooks(String title,
                                  String description,
                                  String author,
                                  String isbn,
                                  String yearFrom,
                                  String yearTo,
                                  String readAlready) {


        String queryString = getQuery(title, description, author, isbn, yearFrom, yearTo, readAlready);

        Query query = sessionFactory.getCurrentSession().createQuery(queryString);

        query = addParamToQuery(query, title, description, author, isbn, yearFrom, yearTo, readAlready);

		return query.list();
	}

    public void deleteBook(Integer id) {
		Book book = sessionFactory.getCurrentSession().load(Book.class, id);
		if (null != book) {
			this.sessionFactory.getCurrentSession().delete(book);
		}
	}

	public Book getBook(Integer id) {
		return sessionFactory.getCurrentSession().get(Book.class, id);
	}

	public Book updateBook(Book book) {
		sessionFactory.getCurrentSession().update(book);
		return book;
	}

    private String getQuery(String title,
                            String description,
                            String author,
                            String isbn,
                            String yearFrom,
                            String yearTo,
                            String readAlready) {

        StringBuilder queryString = new StringBuilder("from Book where id is not null");

        if (title != null && !title.equals("")){
            queryString.append(" AND title LIKE :title");
        }
        if (description != null && !description.equals("")){
            queryString.append(" AND description LIKE :description");
        }
        if (author != null && !author.equals("")){
            queryString.append(" AND author LIKE :author");
        }
        if (isbn != null && !isbn.equals("")){
            queryString.append(" AND isbn LIKE :isbn");
        }
        if (yearFrom != null && !yearFrom.equals("")){
            queryString.append(" AND printYear > :yearFrom");
        }
        if (yearTo != null && !yearTo.equals("")){
            queryString.append(" AND printYear < :yearTo");
        }
        if (readAlready != null && !readAlready.equals("")){
            queryString.append(" AND readAlready = :readAlready");
        }

        return queryString.toString();
    }

    private Query addParamToQuery(Query query,
                                  String title,
                                  String description,
                                  String author,
                                  String isbn,
                                  String yearFrom,
                                  String yearTo,
                                  String readAlready) {

        if (title != null && !title.equals("")){
            query.setParameter("title", "%"+title+"%");
        }
        if (description != null && !description.equals("")){
            query.setParameter("description", "%"+description+"%");
        }
        if (author != null && !author.equals("")){
            query.setParameter("author", "%"+author+"%");
        }
        if (isbn != null && !isbn.equals("")){
            query.setParameter("isbn", "%"+isbn+"%");
        }
        if (yearFrom != null && !yearFrom.equals("")){
            query.setParameter("yearFrom", Integer.valueOf(yearFrom));
        }
        if (yearTo != null && !yearTo.equals("")){
            query.setParameter("yearTo", Integer.valueOf(yearTo));
        }
        if (readAlready != null && !readAlready.equals("")){
            query.setParameter("readAlready", Boolean.valueOf(readAlready));
        }

	    return query;
    }
}