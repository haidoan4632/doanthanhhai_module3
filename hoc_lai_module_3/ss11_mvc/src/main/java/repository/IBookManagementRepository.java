package repository;

import model.Book;

import java.util.List;

public interface IBookManagementRepository {
    public List<Book> findAll();

    public void create(Book book);

    public void update(int id, Book book);

    public void delete(int id);

    Book findById(int id);

    Book findTitle(String title);
}
