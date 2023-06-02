package service.impl;

import model.Book;
import repository.IBookManagerRepository;
import repository.impl.BookManagerRepository;
import service.IBookManagerSerivce;

import java.util.List;

public class BookManagerService implements IBookManagerSerivce {
    IBookManagerRepository bookManagerRepository = new BookManagerRepository();

    @Override
    public List<Book> getAll() {
        return bookManagerRepository.getAll();
    }

    @Override
    public void create(Book book) {
        bookManagerRepository.create(book);
    }

    @Override
    public void update(Book book) {
        bookManagerRepository.update(book);
    }

    @Override
    public void delete(int id) {
        bookManagerRepository.delete(id);
    }

    @Override
    public Integer findById(int id) {
        return null;
    }

    @Override
    public Book findTitle(String title) {
        return null;
    }
}
