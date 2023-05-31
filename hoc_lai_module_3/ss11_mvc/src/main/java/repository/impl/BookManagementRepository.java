package repository.impl;

import model.Book;
import repository.IBookManagementRepository;

import java.util.ArrayList;
import java.util.List;

public class BookManagementRepository implements IBookManagementRepository {
    private static List<Book> bookList = new ArrayList<>();

    static {
        bookList.add(new Book(1, "SGK", 20, "A", "HH"));
        bookList.add(new Book(2, "SGD", 10, "B", "NN"));
        bookList.add(new Book(3, "STK", 30, "C", "LL"));
        bookList.add(new Book(4, "SVV", 40, "D", "MM"));
        bookList.add(new Book(5, "STG", 60, "E", "CC"));
    }

    @Override
    public List<Book> findAll() {
        return bookList;
    }

    @Override
    public void create(Book book) {
        bookList.add(book);
    }

    @Override
    public void update(Book book) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == book.getId()) {
                bookList.set(i, book);
                break;
            }
        }
    }




    @Override
    public void delete(int id) {
        for (Book book : bookList) {
            if (book.getId() == id) {
                bookList.remove(book);
                return;
            }
        }
    }

    @Override
    public Integer findById(int id) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getId() == id) {
                return bookList.get(i).getId();
            }
        }
        return null;
    }

    @Override
    public Book findTitle(String title) {
        for (int i = 0; i < bookList.size(); i++) {
            if (bookList.get(i).getTitle().equals(title)) {
                return bookList.get(i);
            }
        }
        return null;
    }
}
