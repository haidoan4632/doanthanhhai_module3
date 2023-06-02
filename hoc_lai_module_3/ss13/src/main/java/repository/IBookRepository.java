package repository;

import model.Author;
import model.Book;
import model.Category;

import java.sql.SQLException;
import java.util.List;

public interface IBookRepository {
    List<Book> findByName(String name) throws SQLException;
    List<Book> selectAllBook();

    void save(Book book) throws SQLException;

    Book findById(int id) throws SQLException;

    void updateBook(int id, Book book) throws SQLException;

    boolean deleteBook(int id);
    List<Author> authorList() throws SQLException;
    List<Category> categoryList() throws SQLException;
}
