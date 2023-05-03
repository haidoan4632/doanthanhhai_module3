package service.impl;

import model.ProductManagement;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<ProductManagement> findAll() {
        List<ProductManagement> productManagementList = productRepository.findAll();
        if (productManagementList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        }
        return productManagementList;
    }

    @Override
    public void save(ProductManagement productManagement) {
        productRepository.save(productManagement);
    }

    @Override
    public void update(int id, ProductManagement productManagement) {
        productRepository.update(id, productManagement);

    }

    @Override
    public void remove(int id) {
        productRepository.remove(id);
    }


    @Override
    public ProductManagement findName(String name) {
          return productRepository.findName(name);
    }
}
