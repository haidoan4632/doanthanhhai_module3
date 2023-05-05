package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Bánh trôi nước", 10, "đặc sản", "cô hàng xóm"));
        productList.add(new Product(2, "Bánh bột lọc huế", 5, "đặc sản Huế", "chị hàng xóm"));
        productList.add(new Product(4, "Bánh đậu xanh", 20, "đặc sản Hải Dương", "anh hàng xóm"));
        productList.add(new Product(5, "Bánh mì hội an", 25, "đặc sản Hội An", "bà hàng xóm"));
    }

    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void save(Product product) {
        productList.add(product);

    }

    @Override
    public void update(int id, Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if(id == productList.get(i).getId()){
                productList.set(i,product);
                break;
            }
        }
    }

    @Override
    public void remove(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                productList.remove(product);
                return;
            }
        }
    }


    @Override
    public Product findById(int id) {
        for (Product product : productList) {
            if (product.getId() == id) {
                return product;
            }
        }
        return null;
    }
}
