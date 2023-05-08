package controller;

import model.User;
import service.IUserService;
import service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/user")
public class UserServlet extends HttpServlet {
    private IUserService userDaoService = new UserService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            }
            case "delete": {
                deleteUser(request, response);
                break;
            }
            case "edit": {
                editUser(request, response);
                break;
            }
            case "sortName": {
                List<User> userList;
                userList = userDaoService.sortName();
                request.setAttribute("userList", userList);
                request.getRequestDispatcher("/list.jsp").forward(request, response);
                showList(request, response);
                break;
            }
            case "search": {
                String country=request.getParameter("country");
                request.setAttribute("userList",userDaoService.findCountry(country));
                request.getRequestDispatcher("/list.jsp").forward(request,response);
                showList(request, response);
                break;
            }
            default: {
                showList(request, response);
            }
        }
    }

    private void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userDaoService.findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
    }


    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);
        request.getRequestDispatcher("/delete.jsp").forward(request, response);
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> userList = userDaoService.findAll();
        if (userList == null) {
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } else {
            request.setAttribute("userList", userList);
            request.getRequestDispatcher("/list.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete": {
                showDeleteUser(request, response);
                break;
            }
            case "create": {
                showCreate(request, response);
                break;
            }
            case "edit": {
                showEditUser(request, response);
                break;
            }
            default: {

            }
        }
    }

    private void showEditUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userDaoService.update(id,new User(name,email,country));
        showList(request, response);
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        userDaoService.save(new User(name, email, country));
        showList(request, response);
    }

    private void showDeleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDaoService.remove(id);
        showList(request, response);
    }
}
