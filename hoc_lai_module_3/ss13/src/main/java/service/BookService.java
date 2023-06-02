package service;

import model.Author;
import model.Book;
import model.Category;
import repository.BookRepository;
import repository.IBookRepository;

import java.sql.SQLException;
import java.util.List;

public class BookService implements IBookService {
    private IBookRepository iBookRepository = new BookRepository();

    @Override
    public List<Book> findByName(String name) throws SQLException {
        if (name == null){
            name = "";
        }
        return iBookRepository.findByName(name);
    }

    @Override
    public List<Book> selectAllBook() {
        return iBookRepository.selectAllBook();
    }

    @Override
    public void save(Book book) throws SQLException {
        iBookRepository.save(book);
    }

    @Override
    public Book findById(int id) throws SQLException {
        return iBookRepository.findById(id);
    }

    @Override
    public void delete(int id) {
        iBookRepository.deleteBook(id);
    }

    @Override
    public void updateBook(int id, Book book) throws SQLException {
        iBookRepository.updateBook(id, book);
    }

    @Override
    public boolean deleteBook(int id) {
        try {
            this.iBookRepository.deleteBook(id);
            return true;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Author> authorList() throws SQLException {
        return iBookRepository.authorList();
    }

    @Override
    public List<Category> categoryList() throws SQLException {
        return iBookRepository.categoryList();
    }
}
