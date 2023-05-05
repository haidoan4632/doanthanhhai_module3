package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> findAll() {
        List<Product> productList = productRepository.findAll();
        if (productList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productList;
    }

    @Override
    public void save(Product product) {
        productRepository.save(product);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);

    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }


    @Override
    public Product findById(int id) {
        Product product = productRepository.findById(id);
        return product;
    }
}
