package service;

import model.Author;
import model.Book;
import model.Category;

import java.sql.SQLException;
import java.util.List;

public interface IBookService {
    List<Book> selectAllBook();
    void delete(int id);

    List<Book> findByName(String name)throws SQLException;

    void save(Book book) throws SQLException;
    Book findById(int id) throws SQLException;

    void updateBook(int id,Book book) throws SQLException;

}
