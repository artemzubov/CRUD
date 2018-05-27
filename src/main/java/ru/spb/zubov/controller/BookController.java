package ru.spb.zubov.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView listBook(ModelAndView model, @RequestParam(required = false) Integer page) {
		List<Book> listBook = bookService.getAllBooks();

		PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(listBook);
		pagedListHolder.setPageSize(10);
		model.addObject("pageCount", pagedListHolder.getPageCount());

		if(page == null || page < 1 || page > pagedListHolder.getPageCount())
			page=1;

		model.addObject("page", page);

		if(page > pagedListHolder.getPageCount()){
			pagedListHolder.setPage(0);
			model.addObject("listBook", pagedListHolder.getPageList());
		}
		else {
			pagedListHolder.setPage(page-1);
			model.addObject("listBook", pagedListHolder.getPageList());
		}

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