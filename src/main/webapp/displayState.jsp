<%-- Joel Atkinson, February 7, 2026, CSD430 Server Side Development Assignment 5&6
The purpose of this assignment is to create a database called CSD430 in SQL, then create a table (I chose U.S. states),
and populate that table with at least 5 data fields. From there create a JavaBean to pull the data from the database
which will be linked to the .jsp files in order to have a selection of a U.S. state and then to display the data of that
state in a table. In addition to this, also create an index.jsp file for this course as the landing page where all of our
assignments will be held. I went ahead and also created .css style sheets for both the index as well as the module 5/6
.jsp files. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="beans.StatesBean.StateRecord" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>State Record Display</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Selected State Record</h1>
        <p>This page displays the full record retrieved from the database.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">

        <%
            int id = Integer.parseInt(request.getParameter("id"));

            StatesBean bean = new StatesBean();
            StateRecord s = bean.getStateById(id);
        %>

        <%
            if (s == null) {
        %>
        <p><strong>No record found for the selected state.</strong></p>
        <%
        } else {
        %>

        <p>
            Below is the record retrieved from the database table
            <strong>Joel_states_data</strong>.
        </p>

        <table class="state-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>State Name</th>
                <th>State Code</th>
                <th>Capital</th>
                <th>Population</th>
                <th>Year Founded</th>
            </tr>
            </thead>

            <tbody>
            <tr>
                <td><%= s.id %></td>
                <td><%= s.stateName %></td>
                <td><%= s.stateCode %></td>
                <td><%= s.capital %></td>
                <td><%= (s.population == null ? "" : s.population) %></td>
                <td><%= (s.yearFounded == null ? "" : s.yearFounded) %></td>
            </tr>
            </tbody>
        </table>

        <%
            }
        %>

        <div class="link-split">
            <a class="link-button" href="selectState.jsp">Back to Dropdown</a>
            &nbsp;&nbsp;
            <a class="link-button" href="index.jsp">Back to Index</a>
        </div>

    </div>

    <hr class="footer-divider">

    <div class="footer">
        <p>© Joel Atkinson</p>
        <p>Bellevue University</p>
        <p>2026</p>
    </div>

</div>

</body>
</html>
