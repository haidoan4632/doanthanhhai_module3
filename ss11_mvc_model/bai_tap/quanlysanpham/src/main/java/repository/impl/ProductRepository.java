package repository.impl;

import model.ProductManagement;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<ProductManagement> productManagementList = new ArrayList<>();

    static {
        productManagementList.add(new ProductManagement(1, "Bánh trôi nước", 10, "đặc sản", "cô hàng xóm"));
        productManagementList.add(new ProductManagement(2, "Bánh bột lọc huế", 5, "đặc sản Huế", "chị hàng xóm"));
        productManagementList.add(new ProductManagement(4, "Bánh đậu xanh", 20, "đặc sản Hải Dương", "anh hàng xóm"));
        productManagementList.add(new ProductManagement(5, "Bánh mì hội an", 25, "đặc sản Hội An", "bà hàng xóm"));
    }

    @Override
    public List<ProductManagement> findAll() {
        return productManagementList;
    }

    @Override
    public void save(ProductManagement productManagement) {
        productManagementList.add(productManagement);

    }

    @Override
    public void update(int id, ProductManagement productManagement) {

    }

    @Override
    public void remove(String name) {

    }

    @Override
    public ProductManagement findName(String name) {
        for (ProductManagement productManagement : productManagementList) {
            if (productManagement.getNameProduct().equals(name) == true) {
                return productManagement;
            }
        }
        return null;
    }
}
