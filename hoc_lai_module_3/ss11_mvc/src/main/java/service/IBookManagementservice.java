package service;

import model.Book;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IBookManagementservice {
    public List<Book> findAll();

    public void create(HttpServletRequest request);


    public void delete(int id);

    Integer findById(int id);

    Book findTitle(String title);

    void update(HttpServletRequest request);
}
