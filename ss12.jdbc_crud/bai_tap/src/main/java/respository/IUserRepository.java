package respository;

public interface IUserRepository {
    List<User> findAll();

    void save(User user);

    void delete(int id);
    List<User> findByName(String name);
    void addUserTransaction();
}
