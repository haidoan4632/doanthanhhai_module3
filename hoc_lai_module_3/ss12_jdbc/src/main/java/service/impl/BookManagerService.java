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
}
