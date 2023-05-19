package service;

import model.XuPhat;
import repository.IXuPhatRepository;
import repository.XuPhatRepository;

import java.util.List;

public class XuPhatService implements IXuPhatService {
    IXuPhatRepository xuPhatRepository = new XuPhatRepository();

    @Override
    public List<XuPhat> getAll() {
        return xuPhatRepository.getAll();
    }

    @Override
    public void remove(int id) {
        xuPhatRepository.remove(id);
    }
}
