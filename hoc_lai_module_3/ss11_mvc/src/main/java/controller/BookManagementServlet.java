package controller;

import model.Book;
import service.IBookManagementservice;
import service.impl.BookManagementService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookManagementServlet", urlPatterns = "bookManagement")
public class BookManagementServlet extends HttpServlet {
    IBookManagementservice bookManagementservice = new BookManagementService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                break;
            case "update":
                break;
            case "searchByTitle":
                break;
            default:
                listBook(request, response);
        }


    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookManagementservice.findAll();
        request.setAttribute("bookList",bookList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
