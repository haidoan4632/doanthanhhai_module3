package repository.impl;

import model.Book;
import model.Category;
import repository.BaseRepository;
import repository.IBookManagerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookManagerRepository implements IBookManagerRepository {
    private final String SELECT_BOOK = "select books.id,books.title,books.page_size,category.name from books JOIN category on books.id_category = category.id;";
    private final String DELETE_BOOK = "delete from books where id = ?;";
    private final String INSERT_INTO = "INSERT INTO books(id,title,page_size,) values(?,?,?,?);";

    @Override
    public List<Book> getAll() {
        Connection connection = BaseRepository.getConnectDB();
        List<Book> bookList = new ArrayList<>();
        List<Category> categoryList = new ArrayList<>();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOOK);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                int pageSize = resultSet.getInt("page_Size");
                String name = resultSet.getString("name");
                Category category = new Category(name);
                bookList.add(new Book(id, title, pageSize, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookList;
    }

    @Override
    public void create(Book book) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Book book) {

    }

    @Override
    public void delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_BOOK);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
