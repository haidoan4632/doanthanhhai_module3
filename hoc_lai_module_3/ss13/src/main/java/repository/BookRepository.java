package repository;

import model.Author;
import model.Book;
import model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookRepository implements IBookRepository {

    private static final String THEM_MOI = " call them_moi(?,?,?,?,?);";
    private static final String XOA = "call xoa(?)";

    private static final String SELECT_ALL_BOOK = "select books.id, books.title, books.page_size,authors.id as id_authors,authors.name as name_authors,category.id as id_category,category.name as name_category from books\n" +
            "            left join category on category.id = books.id_category\n" +
            "            left join authors on authors.id = books.id_authors;";

    private static final String SELECT_BY_ID = "select books.id, books.title, books.page_size,authors.id as id_authors,authors.name as name_authors,category.id as id_category,category.name as name_category from books\n" +
            "            left join category on category.id = books.id_category \n" +
            "            left join authors on authors.id = books.id_authors where books.id = ?;";

    private static final String INSERT_BOOK_SQL = "insert into books(id, title, page_size, books.id_authors, books.id_category) values(?,?,?,?,?)";
    private static final String UPDATE_BOOK_SQL = "update books set title = ?, page_size =?, id_category = ?, id_authors = ? WHERE id = ?;";
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

//    @Override
//    public void delete(int id) {
//        Connection connection = BaseRepository.getConnectDB();
//        try {
//            CallableStatement callableStatement = connection.prepareCall(XOA);
//            callableStatement.setInt(1, id);
//            callableStatement.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }
//    }


    @Override
    public List<Book> findByName(String name) {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Book> bookList2 = new ArrayList<>();
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select books.id,books.title,books.page_size,category.id as id_category,category.name as name_category,authors.id as id_authors,authors.name from books JOIN category on books.id_category = category.id\n" +
                        "JOIN authors on books.id_authors = authors.id \n" +
                        "WHERE books.title LIKE ? ;");
                preparedStatement.setString(1, '%' + name + '%');
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String title = resultSet.getString("title");
                    int pageSize = resultSet.getInt("page_size");
                    int authorId = resultSet.getInt("id_authors");
                    String authorName = resultSet.getString("name");
                    int idCategory = resultSet.getInt("id_category");
                    String nameCategory = resultSet.getString("name_category");
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
        preparedStatement.setInt(1, book.getId());
        preparedStatement.setString(2, book.getTitle());
        preparedStatement.setInt(3, book.getPageSize());
        preparedStatement.setInt(4, book.getAuthor().getAuthorId());
        preparedStatement.setInt(5, book.getCategory().getIdCategory());
        preparedStatement.executeUpdate();
    }
//    @Override
//    public void save(Book book) throws SQLException {
//        Connection connection = BaseRepository.getConnectDB();
//        CallableStatement preparedStatement = connection.prepareCall(THEM_MOI);
//        preparedStatement.setInt(1, book.getId());
//        preparedStatement.setString(2, book.getTitle());
//        preparedStatement.setInt(3, book.getPageSize());
//        preparedStatement.setInt(4, book.getAuthor().getAuthorId());
//        preparedStatement.setInt(5, book.getCategory().getIdCategory());
//        preparedStatement.executeUpdate();
//    }

    @Override
    public Book findById(int id) throws SQLException {
        PreparedStatement preparedStatement = BaseRepository.getConnectDB().prepareStatement(SELECT_BY_ID);
        preparedStatement.setInt(1, id);
        ResultSet resultSet = preparedStatement.executeQuery();
        while (resultSet.next()) {
            int id1 = resultSet.getInt("id");
            String title = resultSet.getString("title");
            int pageSize = resultSet.getInt("page_size");
            int authorId = resultSet.getInt("id_authors");
            String authorName = resultSet.getString("name_authors");
            int idCategory = resultSet.getInt("id_category");
            String nameCategory = resultSet.getString("name_category");
            Category category = new Category(idCategory, nameCategory);
            Author author = new Author(authorId, authorName);
            Book book = new Book(id1, title, pageSize, author, category);
            return book;
        }
        return null;
    }

//    update books
//    set title = ?,page_size =?,id_category =?,id_authors =?
//    WHERE id = ?;

    @Override
    public void updateBook(int id, Book book) throws SQLException {
        Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_BOOK_SQL);
        preparedStatement.setString(1, book.getTitle());
        preparedStatement.setInt(2, book.getPageSize());
        preparedStatement.setInt(3, book.getCategory().getIdCategory());
        preparedStatement.setInt(4, book.getAuthor().getAuthorId());
        preparedStatement.setInt(5, book.getId());
        preparedStatement.executeUpdate();
    }
}
