package service;

import model.Book;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IBookManagementservice {
     List<Book> findAll();

     void create(HttpServletRequest request);


     void delete(int id);

    Integer findById(int id);

    Book findTitle(String title);

    void update(HttpServletRequest request);
}
