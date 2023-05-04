package service;

import model.User;

import java.util.List;

public interface IUserDaoService {
    List<User> findAll() ;

    void save(User user);

    void update(int id, User user) ;

    List<User> remove(int id) ;

    User findName(String country);
}
