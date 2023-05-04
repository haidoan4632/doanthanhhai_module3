package service;


import model.User;
import repository.IUserDaoRepository;
import repository.UserDaoRepository;

import java.util.List;

public class UserDaoService implements IUserDaoService {
    private static IUserDaoRepository userDaoRepository = new UserDaoRepository();

    @Override
    public List<User> findAll() {
        List<User> userList = userDaoRepository.findAll();
        if (userList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return userList;
    }

    @Override
    public void save(User user) {
        userDaoRepository.save(user);
    }

    @Override
    public User findById(int id) {
        User user = userDaoRepository.findById(id);
        return user;
    }

    @Override
    public void update(int id, User user) {
        userDaoRepository.update(id, user);
    }

    @Override
    public void remove(int id) {
        userDaoRepository.remove(id);
    }

    @Override
    public List<User> findCountry(String country) {
       return userDaoRepository.findCountry(country);
    }

    @Override
    public List<User> sortName( ) {
        return userDaoRepository.sortName();
    }
}
