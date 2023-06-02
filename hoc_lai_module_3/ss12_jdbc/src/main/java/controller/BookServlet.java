package controller;

import model.Book;
import service.IBookManagerSerivce;
import service.impl.BookManagerService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/bookManagement")
public class BookServlet extends HttpServlet {
    IBookManagerSerivce bookManagerSerivce = new BookManagerService();

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

                break;
            case "searchByTitle":
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookManagerSerivce.getAll();
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
            case "delete":
                deleteBook(request, response);
                response.sendRedirect("/bookManagement");
                break;
            default:
                showList(request, response);
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        bookManagerSerivce.delete(id);
    }


}
