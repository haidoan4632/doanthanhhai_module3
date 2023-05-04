package service;

public class UserService implements IUserService {
    private IUserRepository iUserRepository = new UserRepository();

    @Override
    public List<User> findAll() {
        return iUserRepository.findAll();
    }

    @Override
    public void save(User user) {
        iUserRepository.save(user);
    }

    @Override
    public void delete(int id) {
        iUserRepository.delete(id);
    }

    @Override
    public List<User> findByName(String name) {
        return iUserRepository.findByName(name);
    }

    @Override
    public void addUserTransaction() {
        iUserRepository.addUserTransaction();
    }
}
