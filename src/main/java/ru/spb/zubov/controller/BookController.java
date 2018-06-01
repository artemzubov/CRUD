package ru.spb.zubov.controller;

import java.util.List;

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
	public ModelAndView listBook(ModelAndView model,
                                 //I could have replaced it with HttpServletRequest, but I didn't want to
                                 @RequestParam(required = false) Integer page,
                                 @RequestParam(required = false, name = "title") String title,
                                 @RequestParam(required = false, name = "description") String description,
                                 @RequestParam(required = false, name = "author") String author,
                                 @RequestParam(required = false, name = "isbn") String isbn,
                                 @RequestParam(required = false, name = "yearFrom") String yearFrom,
                                 @RequestParam(required = false, name = "yearTo") String yearTo,
                                 @RequestParam(required = false, name = "readAlready") String readAlready) {

		model.addObject("title", title);
        model.addObject("description", description);
        model.addObject("author", author);
        model.addObject("isbn", isbn);
        model.addObject("yearFrom", yearFrom);
        model.addObject("yearTo", yearTo);
        model.addObject("readAlready", readAlready);

        List<Book> listBook = bookService.getAllBooks(
                title,
                description,
                author,
                isbn,
                yearFrom,
                yearTo,
                readAlready
        );

        model = providePaging(model, page, listBook);

		model.setViewName("home");

		return model;
	}

    @RequestMapping(value = "/newBook", method = RequestMethod.GET)
	public ModelAndView newBook(ModelAndView model) {
		Book book = new Book();
		model.addObject("book", book);
		model.setViewName("BookForm");
		return model;
	}

	@RequestMapping(value = "/saveBook", method = RequestMethod.POST)
	public ModelAndView saveBook(@ModelAttribute Book book) {
	    book.setReadAlready(false);
		if (book.getId() == 0){
			bookService.addBook(book);
		}
		else {
			bookService.updateBook(book);
		}

		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/deleteBook", method = RequestMethod.GET)
	public ModelAndView deleteBook(@RequestParam Integer id) {
		bookService.deleteBook(id);
		return new ModelAndView("redirect:/");
	}

	@RequestMapping(value = "/editBook", method = RequestMethod.GET)
	public ModelAndView editBook(@RequestParam Integer id) {
		Book book = bookService.getBook(id);
		ModelAndView model = new ModelAndView("BookForm");
		model.addObject("book", book);
		return model;
	}

	@RequestMapping(value = "/readBook", method = RequestMethod.GET)
    public ModelAndView readBook(@RequestParam Integer id){
        Book book = bookService.getBook(id);
        ModelAndView model = new ModelAndView("ReadBook");
        model.addObject("book", book);
        return model;
    }

    @RequestMapping(value = "/readBook", method = RequestMethod.POST)
    public ModelAndView readBook(@ModelAttribute Book book){
        book.setReadAlready(true);
        bookService.updateBook(book);
        return new ModelAndView("redirect:/");
    }

    private ModelAndView providePaging(ModelAndView model,
                                       @RequestParam(required = false) Integer page,
                                       List<Book> listBook) {

        PagedListHolder<Book> pagedListHolder = new PagedListHolder<Book>(listBook);
        pagedListHolder.setPageSize(10);
        model.addObject("pageCount", pagedListHolder.getPageCount());

        if(page == null || page < 1 || page > pagedListHolder.getPageCount()){
            page=1;
        }

        model.addObject("page", page);

        if(page > pagedListHolder.getPageCount()){
            pagedListHolder.setPage(0);
            model.addObject("listBook", pagedListHolder.getPageList());
        }
        else {
            pagedListHolder.setPage(page - 1);
            model.addObject("listBook", pagedListHolder.getPageList());
        }

        return model;
    }
}