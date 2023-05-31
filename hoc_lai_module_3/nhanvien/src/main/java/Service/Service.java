package Service;

import Model.NhanVien;
import Repository.IRepository;
import Repository.Repository;

import java.util.List;

public class Service implements IService {
    IRepository repository = new Repository();
    @Override
    public List<NhanVien> getAll() {
        return repository.getAll();
    }
}
