package repository;

import model.XuPhat;

import java.util.List;

public interface IXuPhatRepository {
    List<XuPhat> getAll();
    void  remove(int id);
}
