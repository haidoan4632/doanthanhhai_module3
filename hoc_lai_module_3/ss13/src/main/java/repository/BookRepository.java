package repository;

import model.Author;
import model.Book;
import model.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {
    private static final String SELECT_ALL_BOOK = "select books.id, books.title, books.page_size,authors.id as id_authors,authors.name as name_authors,category.id as id_category,category.name as name_category from books\n" +
            "            left join category on category.id = books.id_category\n" +
            "            left join authors on authors.id = books.id_authors;";

    private static final String SELECT_BY_ID = "select id, title, page_size,authors.id,authors.name,category.id,category.name from books\n" +
            "left join category on category.id = books.id_category\n" +
            "left join authors on authors.id = books.id_authors where id = ?";

    private static final String INSERT_BOOK_SQL = "insert into books(title, page_size, books.id_authors, books.id_category) values(?,?,?,?)";
    private static final String UPDATE_BOOK_SQL = "update books set title = ?,page_size = ?, a_id = ?, c_id = ? where id = ?;";
    private final String DELETE_BOOK = "delete from books where id = ?";

    @Override
    public List<Book> selectAllBook() {
        List<Book> bookList1 = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_BOOK);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("books.id");
                String title = resultSet.getString("books.title");
                int pageSize = resultSet.getInt("page_size");
                int authorId = resultSet.getInt("id_authors");
                String authorName = resultSet.getString("name_authors");
                int idCategory = resultSet.getInt("id_category");
                String nameCategory = resultSet.getString("name_category");
                Category category = new Category(idCategory, nameCategory);
                Author author = new Author(authorId, authorName);
                Book book = new Book(id, title, pageSize, author, category);
                bookList1.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return bookList1;
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
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


    @Override
    public List<Book> findByName(String name) {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList2 = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select b_id, title, page_size, books.c_id, books.a_id, category.c_id, category.c_name, authors.a_id, authors.a_name from books " +
                        "left join category on category.c_id = books.c_id " +
                        "left join authors on authors.a_id = books.a_id where books.title =?");
                preparedStatement.setString(1, name);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    int pageSize = resultSet.getInt("page_size");
                    int authorId = resultSet.getInt("books.id");
                    String authorName = resultSet.getString("authors.name");
                    int idCategory = resultSet.getInt("category.id");
                    String nameCategory = resultSet.getString("category.name");
                    Category category = new Category(idCategory, nameCategory);
                    Author author = new Author(authorId, authorName);
                    bookList2.add(new Book(id, title, pageSize, author, category));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return bookList2;
    }


    @Override
    public void save(Book book) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_BOOK_SQL);
        preparedStatement.setString(1, book.getTitle());
        preparedStatement.setInt(2, book.getPageSize());
        preparedStatement.setInt(3, book.getAuthor().getAuthorId());
        preparedStatement.setInt(4, book.getCategory().getIdCategory());
        preparedStatement.executeUpdate();
    }


    @Override
    public Book findById(int id) throws SQLException {
        PreparedStatement preparedStatement = BaseRepository.getConnectDB().prepareStatement(SELECT_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            String title = resultSet.getString("title");
            int pageSize = resultSet.getInt("page_size");
            int authorId = resultSet.getInt("id");
            String authorName = resultSet.getString("name");
            int idCategory = resultSet.getInt("id");
            String nameCategory = resultSet.getString("name");
            Category category = new Category(idCategory, nameCategory);
            Author author = new Author(authorId, authorName);
            Book book = new Book(title, pageSize, author, category);
            return book;
        }
        return null;
    }


    @Override
    public void updateBook(int id, Book book) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        CallableStatement callableStatement = null;
        if (connection != null) {
            try {
                callableStatement = connection.prepareCall("call update_books(?,?,?,?)");
                callableStatement.setString(1, book.getTitle());
                callableStatement.setInt(2, book.getPageSize());
                callableStatement.setInt(3, book.getAuthor().getAuthorId());
                callableStatement.setInt(4, book.getCategory().getIdCategory());
//                callableStatement.setInt(5, id);
                callableStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
