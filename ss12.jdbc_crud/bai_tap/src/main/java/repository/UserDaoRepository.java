package repository;

import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoRepository implements IUserDaoRepository {
    private final String SELLECT_ALL = "SELECT * FROM demo1.users;";
    private final String DELETE_ID ="DELETE FROM users WHERE id =?;";

    //    private final String INSERT_INTO = "INSERT INTO users(id,name,email,country) values(?,?,?,?);";
    @Override
    public List<User> findAll() {
    List<User> userList = new ArrayList<>();
    //kết nối db và trả về list
    Connection connection = BaseRepository.getConnectDB();
    PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement(SELLECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
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
        return userList;
    }


    @Override
    public void save(User user) {

    }

    @Override
    public void update(int id, User user) {

    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement =connection.prepareStatement(DELETE_ID);
            preparedStatement.setInt(1,id);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


    }

    @Override
    public User findName(String country) {
        return null;
    }
}
