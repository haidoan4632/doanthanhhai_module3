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

    }

    @Override
    public void update(int id, User user) {

    }

    @Override
    public List<User> remove(int id) {
        userDaoRepository.remove(id);
        return null;
    }

    @Override
    public User findName(String country) {
        return null;
    }
}
