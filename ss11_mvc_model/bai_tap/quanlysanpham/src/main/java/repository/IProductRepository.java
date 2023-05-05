package repository;
import model.Product;

import java.util.List;

public interface IProductRepository {

    public List<Product> findAll();

    public void save(Product product);

    public void update(int id, Product product);

    public void remove(int id);


    Product findById(int id);
}
