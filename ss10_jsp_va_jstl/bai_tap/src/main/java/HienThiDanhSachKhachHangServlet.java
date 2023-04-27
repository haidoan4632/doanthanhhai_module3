import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "HienThiDanhSachKhachHangServlet", value = "/customer")
public class HienThiDanhSachKhachHangServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    static {
        customerList.add(new Customer("Hai", "30-8-1998", "Đà Nẵng", "https://znews-photo.zingcdn.me/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg"));
        customerList.add(new Customer("Huy", "6-12-1998", "Đà Nẵng", "https://znews-photo.zingcdn.me/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg"));
        customerList.add(new Customer("Ha", "1-5-1998", "Đà Nẵng", "https://znews-photo.zingcdn.me/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg"));
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("/listCustomer.jsp").forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
