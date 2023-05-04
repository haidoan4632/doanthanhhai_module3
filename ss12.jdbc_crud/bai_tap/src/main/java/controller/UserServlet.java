package controller;

import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "UserServlet", urlPatterns = "user")
public class UserServlet extends javax.servlet.http.HttpServlet {
    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/view/create.jsp").forward(request, response);
                break;
            case "delete":
                int idDelete = Integer.parseInt(request.getParameter("idDelete"));
                iUserService.delete(idDelete);
                response.sendRedirect("/user?message=delete");
                break;
            case "search":
                String name = request.getParameter("search");
                iUserService.findByName(name);
                request.setAttribute("user", iUserService.findByName(name));
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
                break;
            case "addUserTransaction":
                iUserService.addUserTransaction();
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
                break;
            default:
                request.setAttribute("userList", iUserService.findAll());
                request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        }
    }

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                int id=Integer.parseInt(request.getParameter("id"));
                String name=request.getParameter("name");
                String email=request.getParameter("email");
                String country=request.getParameter("country");
                User user = new User(id,name,email,country);
                iUserService.save(user);
                request.setAttribute("user",iUserService.findAll());
                request.getRequestDispatcher("view/list.jsp").forward(request,response);
                break;
    }


}
