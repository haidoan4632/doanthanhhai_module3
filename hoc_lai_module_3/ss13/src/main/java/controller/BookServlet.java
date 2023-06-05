package controller;

import model.Author;
import model.Book;
import model.Category;
import service.BookService;
import service.IBookService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
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
                request.getRequestDispatcher("view/create.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                try {
                    Book book = iBookService.findById(id);
                    request.setAttribute("book", book);
                    request.getRequestDispatcher("view/edit.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

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
            case "searchByTitle":
                String title = request.getParameter("titleSearch");
                try {
                    List<Book> bookList = iBookService.findByName(title);
                    request.setAttribute("bookList", bookList);
                    request.getRequestDispatcher("view/list.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "create":
                createBook(request);
                response.sendRedirect("/bookManagement");
                break;
            case "edit":
                updateBook(request);
                response.sendRedirect("/bookManagement");
                break;
            case "delete":
                deleteBook(request, response);
                break;
            default:
                showListBook(request, response);

        }
    }

    private void updateBook(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        String title1 = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int idAuthor = Integer.parseInt(request.getParameter("idAuthor"));
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        Author author = new Author(idAuthor);
        Category category = new Category(idCategory);
        Book book = new Book(id, title1, pageSize, author, category);
        try {
            iBookService.updateBook(id, book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void createBook(HttpServletRequest request) {
        int idBook = Integer.parseInt(request.getParameter("id"));
        String title1 = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        String author = request.getParameter("author");
        int idAuthor = Integer.parseInt(request.getParameter("idAuthor"));
        String category = request.getParameter("category");
        int idCategory = Integer.parseInt(request.getParameter("idCategory"));
        Author author1 = new Author(idAuthor, author);
        Category category1 = new Category(idCategory, category);
        Book book = new Book(idBook, title1, pageSize, author1, category1);
        try {
            iBookService.save(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idDelete"));
        iBookService.delete(id);
        try {
            response.sendRedirect("/bookManagement");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
