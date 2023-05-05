package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/productManagament")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null) {
            action="";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            }
            case "delete": {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", id);
                request.getRequestDispatcher("/delete.jsp").forward(request, response);
                break;
            }
            case "edit": {
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = productService.findById(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/edit.jsp").forward(request, response);
                break;
            }
            default: {
                showList(request, response);
            }
        }
    }
    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        if (productList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("productList", productList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                createProduct(request, response);
                break;
            }
            case "delete": {
                showDeleteProduct(request, response);
                break;
            }
            case "edit": {
                showEditProduct(request, response);
                break;
            }
        }
    }

    private void showEditProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int rateProduct = Integer.parseInt(request.getParameter("RateProduct"));
        String nameProduct = request.getParameter("nameProduct");
        String productDescription = request.getParameter("ProductDescription");
        String producer = request.getParameter("Producer");
        productService.update(id, new Product(nameProduct, rateProduct, productDescription, producer));
        showList(request, response);
    }

    private void showDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.remove(id);
        showList(request, response);
    }

    public void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nameProduct = request.getParameter("nameProduct");
        int rateProduct = Integer.parseInt(request.getParameter("rateProduct"));
        String productDescription = request.getParameter("productDescription");
        String producer = request.getParameter("producer");
        productService.save(new Product(id, nameProduct, rateProduct, productDescription, producer));
//        List<Product> productManagementList = productService.findAll();
        showList(request, response);
    }

}
