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

@WebServlet(name = "BookManagementServlet", urlPatterns = "/bookManagement")
public class BookManagementServlet extends HttpServlet {
    IBookManagementservice bookManagementservice = new BookManagementService();
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("view/create.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                Integer id1 = bookManagementservice.findById(id);
                if (id1!=null){
                    request.setAttribute("id",id);
                    request.getRequestDispatcher("view/update.jsp").forward(request, response);
                }
                break;
            case "searchByTitle":
               break;
            default:
                listBook(request, response);
        }
    }

    private void listBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookManagementservice.findAll();
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                bookManagementservice.create(request);
                listBook(request, response);
                break;
            case "update":
                bookManagementservice.update(request);
                response.sendRedirect("/bookManagement");
                break;
            case "delete":
                deleteBook(request, response);
                response.sendRedirect("/bookManagement");
                break;
            case "searchByTitle":
                String name = request.getParameter("titleSearch");
                Book book = bookManagementservice.findTitle(name);
                if (book!=null){
                    request.setAttribute("book",book);
                    request.getRequestDispatcher("view/list.jsp").forward(request, response);
                }
                break;
            default:
                listBook(request, response);
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookManagementservice.delete(id);
    }
}
