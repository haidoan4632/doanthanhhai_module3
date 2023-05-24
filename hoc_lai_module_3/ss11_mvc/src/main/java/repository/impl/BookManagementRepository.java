package repository.impl;

import model.Book;
import repository.IBookManagementRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

public class BookManagementRepository implements IBookManagementRepository {
private final String SELECT_BOOK ="";
    @Override
    public List<Book> findAll() {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK);

        } catch (SQLException e) {
            e.printStackTrace();
        }


        return null;
    }

    @Override
    public void create(Book book) {

    }

    @Override
    public void update(int id, Book book) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Book findById(int id) {
        return null;
    }

    @Override
    public Book findTitle(String title) {
        return null;
    }
}
