package service;

import model.XuPhat;

import java.util.List;

public interface IXuPhatService {
    List<XuPhat> getAll();
    void  remove(int id);
}
