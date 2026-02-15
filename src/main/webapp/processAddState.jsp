<%-- Joel Atkinson, February 14, 2026, CSD430 Server Side Development Assignment 7.2. The purpose of this assignment
is to update my javabean to allow for data to be added into the database through a form that I also created using .jsp
this form will allow users to add a state to the database and then will proceed to show the user the entire database with
the newly added state date in there. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.StatesBean.StateRecord" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All State Records</title>
    <link rel="stylesheet" href="assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>All State Records</h1>
        <p>Below are all records currently stored in the database table.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <%
            // Read form values
            String stateName = request.getParameter("state_name");
            String stateCode = request.getParameter("state_code");
            String capital = request.getParameter("capital");
            String region = request.getParameter("region");

            Long population = Long.parseLong(request.getParameter("population"));
            Integer yearFounded = Integer.parseInt(request.getParameter("year_founded"));

            // Insert record
            StatesBean bean = new StatesBean();
            boolean added = bean.addStateRecord(stateName, stateCode.toUpperCase(), capital, region, population, yearFounded);

            // Fetch all records for display
            List<StateRecord> states = bean.getAllStates();
        %>

        <div class="form-card">

            <%
                if (added) {
            %>
            <p><strong>Success!</strong> The new state record was added.</p>
            <%
            } else {
            %>
            <p><strong>Error:</strong> The record could not be added. Please try again.</p>
            <%
                }
            %>

            <table class="state-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>State Name</th>
                    <th>State Code</th>
                    <th>Capital</th>
                    <th>Region</th>
                    <th>Population</th>
                    <th>Year Founded</th>
                </tr>
                </thead>
                <tbody>
                <% for (StateRecord s : states) { %>
                <tr>
                    <td><%= s.id %></td>
                    <td><%= s.stateName %></td>
                    <td><%= s.stateCode %></td>
                    <td><%= s.capital %></td>
                    <td><%= s.region %></td>
                    <td><%= s.population %></td>
                    <td><%= s.yearFounded %></td>
                </tr>
                <% } %>
                </tbody>
            </table>

            <div class="link-row">
                <a class="link-button" href="addState.jsp">Add Another State</a>
                <a class="link-button" href="index.jsp">Back to Index</a>
            </div>

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

