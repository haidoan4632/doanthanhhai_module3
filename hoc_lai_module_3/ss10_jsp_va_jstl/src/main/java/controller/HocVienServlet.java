package controller;

import model.HocVien;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HocVienServlet",urlPatterns = "/hocvien")
public class HocVienServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<HocVien> hocVienList = new ArrayList<>();
        hocVienList.add(new HocVien(1,"Chàng trai tra nam","Nam",80));
        hocVienList.add(new HocVien(2,"Cô gái đáng yêu","Nữ",90));
        hocVienList.add(new HocVien(3,"Chàng trai chung tình","Nam",80));
        hocVienList.add(new HocVien(4,"Cô gái cá tính","Nữ",90));
        request.setAttribute("hocVienList",hocVienList);
        request.getRequestDispatcher("list.jsp").forward(request,response);
        if (hocVienList.size()==0){
            request.setAttribute("massage","Danh sách rỗng!");
        }
        request.getRequestDispatcher("list.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
