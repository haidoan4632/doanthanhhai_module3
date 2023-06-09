package repository;

import model.User;

import java.util.List;

public interface IUserDaoRepository {
    List<User> findAll();

    void save(User user);

    User findById(int id);

    void update(int id, User user);

    void remove(int id);

    List<User> findCountry(String country);

    List<User> sortName();
}
