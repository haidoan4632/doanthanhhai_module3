package service;

import model.ProductManagement;

import java.util.List;

public interface IProductService {
     List<ProductManagement> findAll() ;

     void save(ProductManagement productManagement);

     void update(int id, ProductManagement productManagement) ;

     void remove(String name) ;

     ProductManagement findName(String name);

}
