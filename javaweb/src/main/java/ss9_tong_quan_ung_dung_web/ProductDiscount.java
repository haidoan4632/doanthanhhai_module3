package ss9_tong_quan_ung_dung_web;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ProductDiscount", urlPatterns = "/result")
public class ProductDiscount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("Product Description");
        float listPrice = Integer.parseInt(req.getParameter("List Price"));
        float discountPercent = Integer.parseInt(req.getParameter("Discount Percent"));
        float discountAmount = (listPrice * discountPercent)/100;
        float discountPrice = listPrice -discountAmount;
        req.setAttribute("name",name);
        req.setAttribute("listPrice",listPrice);
        req.setAttribute("discountPercent",discountPercent);
        req.setAttribute("discountAmount",discountAmount);
        req.setAttribute("discountPrice",discountPrice);
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("DiscountServlet.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
