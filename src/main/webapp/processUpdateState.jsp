<%-- Joel Atkinson, February 20, 2026. CSD430 Server Side Development Assignment Part 3 (Update Record)
The purpose of this assignment is to update the Java Bean and write jsp files to create pages that allow for the user
 to update the recordsin the database (except for the key which is ID)
This page updates the record using the JavaBean and displays the updated record in a table. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="beans.StatesBean.StateRecord" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Updated State Record</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Updated State Record</h1>
        <p>Below is the updated record pulled from the database.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <%
            // Read inputs
            int id = Integer.parseInt(request.getParameter("id"));
            String stateName = request.getParameter("state_name");
            String stateCode = request.getParameter("state_code");
            String capital = request.getParameter("capital");
            String region = request.getParameter("region");

            Long population = Long.parseLong(request.getParameter("population"));

            String yfStr = request.getParameter("year_founded");
            Integer yearFounded = (yfStr == null || yfStr.trim().isEmpty()) ? null : Integer.parseInt(yfStr);

            // Update + reload
            StatesBean bean = new StatesBean();
            boolean updated = bean.updateStateRecord(id, stateName, stateCode.toUpperCase(), capital, region, population, yearFounded);

            StateRecord s = bean.getStateById(id);
        %>

        <div class="form-card">

            <% if (updated) { %>
            <p><strong>Success!</strong> The record was updated.</p>
            <% } else { %>
            <p><strong>Error:</strong> The record could not be updated. Please try again.</p>
            <% } %>

            <% if (s != null) { %>
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
                <tr>
                    <td><%= s.id %></td>
                    <td><%= s.stateName %></td>
                    <td><%= s.stateCode %></td>
                    <td><%= s.capital %></td>
                    <td><%= s.region %></td>
                    <td><%= s.population %></td>
                    <td><%= s.yearFounded %></td>
                </tr>
                </tbody>
            </table>
            <% } %>

            <div class="link-split">
                <a class="link-button" href="updateSelect.jsp">Update Another Record</a>
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