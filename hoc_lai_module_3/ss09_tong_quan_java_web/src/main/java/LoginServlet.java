import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "LoginServlet", value = "/tranglogin")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            default:
                request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "kiemtra": {
                String userName = request.getParameter("username");
                String password = request.getParameter("password");
                if (userName.equals("admin") && password.equals("123abc")) {
                    Date now = new Date();
                    SimpleDateFormat dateFormat = new SimpleDateFormat("hh:mm:ss a");
                    dateFormat.format(now);
                    String message = "Admin đăng nhập thành công vào lúc " + dateFormat.format(now);
                    request.setAttribute("message", message);
                    request.getRequestDispatcher("success.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
                break;
            }
            default:
        }
    }


}
