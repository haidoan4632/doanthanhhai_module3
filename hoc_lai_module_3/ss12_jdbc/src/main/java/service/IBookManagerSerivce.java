package service;

import model.Book;

import java.util.List;

public interface IBookManagerSerivce {
    List<Book> getAll();

    void create(Book book);

    void update(Book book);

    void delete(int id);

    Integer findById(int id);

    Book findTitle(String title);

}
