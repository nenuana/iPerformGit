<%--
  Created by IntelliJ IDEA.
  User: anamarianenu
  Date: 24/07/2018
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>insert angajat</title>
</head>
<body>


<form action="/doInsertAngajat">
    pk_employee:<br>
    <input type="text" name="pk_employee" value="">
    <br>
    status:<br>
    <input type="text" name="status" value="">
    <br>
    code:<br>
    <input type="text" name="code" value="">

    last_name:<br>
    <input type="text" name="last_name" value="">
    <br>
    first_name:<br>
    <input type="text" name="first_name" value="">

    position:<br>
    <input type="text" name="position" value="">
    <br>
    unit:<br>
    <input type="text" name="unit" value="">

    ccc:<br>
    <input type="text" name="ccc" value="">
    <br>
    cost_center:<br>
    <input type="text" name="cost_center" value="">

    superior_full_name:<br>
    <input type="text" name="superior_full_name" value="">
    <br>
    superior_position:<br>
    <input type="text" name="superior_position" value="">

    email:<br>
    <input type="text" name="email" value="">

    <br><br>


    <input type="submit" value="Submit">
</form>


</body>
</html>
