package repository;

import model.Book;

import java.util.List;

public interface IBookManagementRepository {
     List<Book> findAll();

     void create(Book book);

     void update(Book book);

     void delete(int id);

    Integer findById(int id);

    Book findTitle(String title);
}
