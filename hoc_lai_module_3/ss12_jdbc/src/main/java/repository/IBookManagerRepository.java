package repository;

import model.Book;

import java.util.List;

public interface IBookManagerRepository {
    List<Book> getAll();

}
