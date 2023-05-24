package service.impl;

import model.Book;
import repository.IBookManagementRepository;
import repository.impl.BookManagementRepository;
import service.IBookManagementservice;

import java.util.List;

public class BookManagementService implements IBookManagementservice {
    IBookManagementRepository bookManagementRepository = new BookManagementRepository();

    @Override
    public List<Book> findAll() {
        if (bookManagementRepository.findAll() != null) {
            return bookManagementRepository.findAll();
        }
        return null;
    }

    @Override
    public void create(Book book) {
        bookManagementRepository.create(book);
    }

    @Override
    public void update(int id, Book book) {
        bookManagementRepository.update(id, book);
    }

    @Override
    public void delete(int id) {
        bookManagementRepository.delete(id);
    }

    @Override
    public Book findById(int id) {
        if (bookManagementRepository.findById(id) != null) {
            return bookManagementRepository.findById(id);
        }
        return null;
    }

    @Override
    public Book findTitle(String title) {
        if (bookManagementRepository.findTitle(title) != null) {
            return bookManagementRepository.findTitle(title);
        }
        return null;
    }
}
