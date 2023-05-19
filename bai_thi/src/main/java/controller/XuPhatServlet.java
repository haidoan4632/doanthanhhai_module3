package controller;

import service.IXuPhatService;
import service.XuPhatService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "XuPhatServlet", urlPatterns = "/xuphat")
public class XuPhatServlet extends HttpServlet {
    private IXuPhatService xuPhatService = new XuPhatService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "delete":
                int id = Integer.parseInt(request.getParameter("id"));
                xuPhatService.remove(id);
                break;
            case "create":
                break;
            default:
                showList(request, response);
        }
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("xuPhatList", xuPhatService.getAll());
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
