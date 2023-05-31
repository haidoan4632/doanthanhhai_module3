package repository;

import model.Book;

import java.util.List;

public interface IBookManagementRepository {
    public List<Book> findAll();

    public void create(Book book);

    public void update(Book book);

    public void delete(int id);

    Integer findById(int id);

    Book findTitle(String title);
}
