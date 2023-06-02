package controller;

import model.Author;
import model.Book;
import model.Category;
import service.BookService;
import service.IBookService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "BookServlet", value = "/book")
public class BookServlet extends HttpServlet {
    private IBookService iBookService = new BookService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    showCreate(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    showEdit(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "search":
                try {
                    formSearch(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                showBookList(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
//        String tittleSearch = request.getParameter("titleSearch");
//        if (tittleSearch == null) {
//            tittleSearch = "";
//        }
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    formCreate(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    formEdit(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                deleteBook(request, response);
                break;
            default:
                showBookList(request, response);
                break;
        }
    }
    private void formSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String name = request.getParameter("name");
        List<Book> bookList = this.iBookService.findByName(name);
        request.setAttribute("bookList", bookList);
        try {
            request.setAttribute("nameSearch",name);
            request.setAttribute("bookList", iBookService.findByName(name));
        } catch (java.sql.SQLException throwables) {
            throw new RuntimeException(throwables);
        }
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }

    private void showEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Book book = iBookService.findById(id);
        request.setAttribute("book", book);
        request.setAttribute("categoryList",iBookService.categoryList());
        request.setAttribute("authorList",iBookService.authorList());
        request.getRequestDispatcher("/view/edit.jsp").forward(request, response);

    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        request.setAttribute("categoryList",iBookService.categoryList());
        request.setAttribute("authorList",iBookService.authorList());
        request.getRequestDispatcher("/view/create.jsp").forward(request, response);
    }

    private void showBookList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        request.setAttribute("nameSearch",name);
        request.setAttribute("bookList", iBookService.selectAllBook());
        request.getRequestDispatcher("/view/list.jsp").forward(request, response);
    }




    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        String mess = "Xóa Không thành công";
        boolean check = iBookService.deleteBook(id);
        if (!check) {
            mess = "Xóa Thành công";
        }
        request.setAttribute("mess", mess);
        List<Book> bookList = null;
        try {
            bookList = iBookService.findByName(null);
        } catch (java.sql.SQLException throwables) {
            throw new RuntimeException(throwables);
        }
        request.setAttribute("bookList",bookList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/view/list.jsp");
        dispatcher.forward(request,response);
    }

    private void formEdit(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        int pageSize = Integer.parseInt(request.getParameter("pageSizeBook"));
        int authorId=Integer.parseInt(request.getParameter("authorId"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        Author author= new Author(authorId);
        Category category=new Category(categoryID);
        Book book = new Book(title,pageSize,author,category);
        iBookService.updateBook(id, book);
        response.sendRedirect("/book");
    }

    private void formCreate(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        String title = request.getParameter("titleBook");
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int authorId=Integer.parseInt(request.getParameter("authorID"));
        int categoryID = Integer.parseInt(request.getParameter("categoryID"));
        Author author= new Author(authorId);
        Category category = new Category(categoryID);
        Book book = new Book( title, pageSize, author, category);
        iBookService.save(book);
        response.sendRedirect("/book");
    }

}
