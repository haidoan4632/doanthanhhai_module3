package repository;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDaoRepository implements IUserDaoRepository {
    private final String SELECT_ALL = "CALL hien_thi();";
    private final String UPDATE_USERS = " CALL edit_user( ?,?,?,?);";
    private final String DELETE_ID = " CALL delete_user(?);";


    //    private final String SELECT_ALL = "SELECT * FROM demo1.users;";
//    private final String DELETE_ID = "DELETE FROM users WHERE id =?;";
//private final String UPDATE_USERS = "update users set name = ?,email= ?, country =? where id = ?;";
    private final String INSERT_INTO = "INSERT INTO users(id,name,email,country) values(?,?,?,?);";
    private final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private final String SELECT_USER_BY_COUNTRY = "SELECT * FROM users WHERE country LIKE ?;";
    private final String SORT_NAME = "SELECT * FROM users ORDER BY users.name ASC;";

    @Override
    public List<User> findAll() {
        List<User> userList = new ArrayList<>();
        //kết nối db và trả về list
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

//        PreparedStatement preparedStatement;
//        try {
//            preparedStatement = connection.prepareStatement(SELECT_ALL);
//            ResultSet resultSet = preparedStatement.executeQuery();
//            while (resultSet.next()) {
//                int id = resultSet.getInt("id");
//                String name = resultSet.getString("name");
//                String email = resultSet.getString("email");
//                String country = resultSet.getString("country");
//                userList.add(new User(id, name, email, country));
//            }
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
        return userList;
    }

    @Override
    public List<User> findCountry(String country) {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY);
            preparedStatement.setString(1, country);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }



    @Override
    public void save(User user) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setInt(1, user.getId());
            preparedStatement.setString(2, user.getName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getCountry());
            int rowAffect = preparedStatement.executeUpdate();
            if (rowAffect == 1) {
                connection.commit();
            } else {
                connection.rollback();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user = null;
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setName(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setCountry(resultSet.getString("country"));
            }
            return user;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return null;
    }

    @Override
    public void update(int id, User user) {
        Connection connection = BaseRepository.getConnectDB();
        CallableStatement callableStatement = null;
        try {
            callableStatement = connection.prepareCall(UPDATE_USERS);
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

    }

//    @Override
//    public void update(int id, User user) {
//        Connection connection = BaseRepository.getConnectDB();
//        PreparedStatement preparedStatement = null;
//        try {
//            preparedStatement = connection.prepareStatement(UPDATE_USERS);
//            preparedStatement.setString(1, user.getName());
//            preparedStatement.setString(2, user.getEmail());
//            preparedStatement.setString(3, user.getCountry());
//            preparedStatement.setInt(4, id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//
//    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_ID);
            callableStatement.setInt(1, id);
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


//    @Override
//    public void remove(int id) {
//        Connection connection = BaseRepository.getConnectDB();
//        try {
//            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ID);
//            preparedStatement.setInt(1, id);
//            preparedStatement.executeUpdate();
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//        }
//    }

    @Override
    public List<User> sortName() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SORT_NAME);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String countryQuery = resultSet.getString("country");
                User user = new User(id,name,email,countryQuery);
                userList.add(user);
            }
            return userList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
