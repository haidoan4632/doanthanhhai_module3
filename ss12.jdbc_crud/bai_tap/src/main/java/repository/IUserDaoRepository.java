package repository;

import model.User;

import java.util.List;

public interface IUserDaoRepository {
    List<User> findAll() ;

    void save(User user);

    User findById(int id);

    void update(int id, User user);

    void remove(int id) ;

    User findName(String country);
}
