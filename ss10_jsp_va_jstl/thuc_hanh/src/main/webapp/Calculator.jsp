<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 4/27/2023
  Time: 3:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
    <title>Calculator</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculate" method="post" style="width: 500px">
    <fieldset>
        <legend>Calculator</legend>
        <table>
            <tr>
                <td>First operand:</td>
                <td><input name="first-operand" type="text"/></td>
            </tr>
            <tr>
                <td><label>Operator</label></td>
                <td>
                    <select name="operator">
                        <option>Addition</option>
                        <option>Subtraction</option>
                        <option>Multiplication</option>
                        <option>Division</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Second operand:</td>
                <td><input name="second-operand" type="text"/></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Calculate"/></td>
            </tr>
        </table>
    </fieldset>
</form>
<form>
    <tr>
        <td><h1>Result:</h1></td>
        <td><h1>${firstOperand}  ${operator} ${secondOperand} = ${result}  </h1></td>
    </tr>
</form>
</body>
</html>
