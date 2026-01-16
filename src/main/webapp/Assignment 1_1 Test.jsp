<%--
  Joel Atkinson January 13,2026, CSD430 Server Side Developement Assignment 1.1
  The purpose of this assignment is to write code to confirm that my Jakarta is configured correctly and to build a
  basic JSP page that uses HTML, Java and JSP code. Mine has a title, header, description paragraph, displays the current
  time and date, and displays a welcome message
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My First JSP Page</title>
</head>
<body>
    <h1>Welcome To My First JSP Application</h1>

    <p>This is for assignment 1.1 in CSD430 Server Side Development. This JSP page will show the current time and date
        using jave.util.Date() and print a welcome message</p>

    <p>Current Date and Time: <%= new java.util.Date()%></p>

    <% String message = "Hello from Joel Atkinson!"; %>
    <p><%= message %></p>
</body>
</html>
