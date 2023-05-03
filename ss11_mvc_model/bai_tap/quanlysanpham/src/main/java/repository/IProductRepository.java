package repository;
import model.ProductManagement;
import java.util.List;

public interface IProductRepository {

    public List<ProductManagement> findAll() ;

    public void save(ProductManagement productManagement);

    public void update(int id, ProductManagement productManagement) ;

    public void remove(int id) ;

    public ProductManagement findName(String name);

}
