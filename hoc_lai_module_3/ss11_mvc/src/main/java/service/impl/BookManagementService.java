package service.impl;

import model.Book;
import repository.IBookManagementRepository;
import repository.impl.BookManagementRepository;
import service.IBookManagementservice;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class BookManagementService implements IBookManagementservice {
    IBookManagementRepository bookManagementRepository = new BookManagementRepository();

    @Override
    public List<Book> findAll() {
        if (bookManagementRepository.findAll() != null) {
            return bookManagementRepository.findAll();
        }
        return null;
    }

    @Override
    public void create(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        bookManagementRepository.create(new Book(id, title, pageSize, author, category));
    }


    @Override
    public void delete(int id) {
        bookManagementRepository.delete(id);
    }

    @Override
    public Integer findById(int id) {
        if (bookManagementRepository.findById(id) != null) {
            return bookManagementRepository.findById(id);
        }
        return null;
    }

    @Override
    public Book findTitle(String title) {
        if (bookManagementRepository.findTitle(title) != null) {
            return bookManagementRepository.findTitle(title);
        }
        return null;
    }

    @Override
    public void update(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        String category = request.getParameter("category");
        Book book = new Book(id,title,pageSize,author,category);
        bookManagementRepository.update(book);
    }


}
