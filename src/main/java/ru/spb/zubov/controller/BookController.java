package ru.spb.zubov.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.spb.zubov.model.Book;
import ru.spb.zubov.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	public BookController() {
	}

	@RequestMapping(value = "/")
	public ModelAndView listBook(ModelAndView model) {
		List<Book> listBook = bookService.getAllBooks();
		model.addObject("listBook", listBook);
		model.setViewName("home");
		return model;
	}

	@RequestMapping(value = "/newBook", method = RequestMethod.GET)
	public ModelAndView newContact(ModelAndView model) {
		Book book = new Book();
		model.addObject("book", book);
		model.setViewName("BookForm");
		return model;
	}

	@RequestMapping(value = "/saveBook", method = RequestMethod.POST)
	public ModelAndView saveBook(@ModelAttribute Book book) {
		if (book.getId() == 0) {
			bookService.addBook(book);
		} else {
			bookService.updateBook(book);
		}
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/deleteBook", method = RequestMethod.GET)
	public ModelAndView deleteBook(HttpServletRequest request) {
		int bookId = Integer.parseInt(request.getParameter("id"));
		bookService.deleteBook(bookId);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/editBook", method = RequestMethod.GET)
	public ModelAndView editContact(HttpServletRequest request) {
		int bookId = Integer.parseInt(request.getParameter("id"));
		Book book = bookService.getBook(bookId);
		ModelAndView model = new ModelAndView("BookForm");
		model.addObject("book", book);

		return model;
	}

}