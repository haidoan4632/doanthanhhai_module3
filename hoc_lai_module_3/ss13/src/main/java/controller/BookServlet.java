package controller;

import model.Book;
import service.BookService;
import service.IBookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookServlet", urlPatterns = "/bookManagement")
public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                break;
            case "edit":

                break;
            case "search":

                break;
            default:
                showListBook(request, response);
        }
    }

    private void showListBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = iBookService.selectAllBook();
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

                break;
            case "edit":

                break;
            case "delete":
                deleteBook(request, response);
                break;
            default:
                showListBook(request, response);

        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        iBookService.delete(id);
        try {
            response.sendRedirect("/bookManagement");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
