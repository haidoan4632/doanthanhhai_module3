import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "CalculatorServlet", urlPatterns = "/calculate")
public class CalculatorServlet extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        float firstOperand = Float.parseFloat(request.getParameter("first-operand"));
        float secondOperand = Float.parseFloat(request.getParameter("second-operand"));
        float result =0;
        PrintWriter writer = response.getWriter();
        String operator = request.getParameter("operator");
        switch (operator) {
            case "Addition":
                result = firstOperand + secondOperand;
                break;
            case "Subtraction":
                result = firstOperand - secondOperand;
                break;
            case "Multiplication":
                result = firstOperand * secondOperand;
                break;
            case "Division":
                if (secondOperand != 0) {
                    result = firstOperand / secondOperand;
                } else {
                    throw new RuntimeException("Lỗi");
                }
                break;
        }
        request.setAttribute("result", result);
        request.setAttribute("firstOperand", firstOperand);
        request.setAttribute("secondOperand", secondOperand);
        request.setAttribute("operator", operator);
        if (operator.equals("Division") && secondOperand == 0) {
        } else {
            request.getRequestDispatcher("Calculator.jsp").forward(request, response);
        }
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {

    }

}
