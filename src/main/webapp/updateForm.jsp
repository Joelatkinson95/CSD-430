<%-- Joel Atkinson, February 20, 2026 CSD430 Server Side Development Assignment Part 3 (Update Record)
The purpose of this assignment is to update the Java Bean and write jsp files to create pages that allow for the user
 to update the recordsin the database (except for the key which is ID)
This page loads the selected record and allows the user to update all fields except the key (id). --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="beans.StatesBean.StateRecord" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update State Record</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Edit State Record</h1>
        <p>Update the fields below and submit to save changes.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <%
            int id = Integer.parseInt(request.getParameter("id"));
            StatesBean bean = new StatesBean();
            StateRecord s = bean.getStateById(id);
        %>

        <div class="form-card">
            <% if (s == null) { %>
            <p><strong>Error:</strong> No record found for ID <%= id %>.</p>
            <div class="link-split">
                <a class="link-button" href="updateSelect.jsp">Back to Select</a>
                <a class="link-button" href="index.jsp">Back to Index</a>
            </div>
            <% } else { %>

            <form action="processUpdateState.jsp" method="post">
                <%-- Key field: show it, but don't allow editing --%>
                <label>State ID (Key Field - Not Editable):</label>
                <p><strong><%= s.id %></strong></p>
                <input type="hidden" name="id" value="<%= s.id %>">

                <label for="state_name">State Name:</label>
                <input type="text" id="state_name" name="state_name" value="<%= s.stateName %>" required>

                <label for="state_code">State Code (2 letters):</label>
                <input type="text" id="state_code" name="state_code" value="<%= s.stateCode %>" maxlength="2" required>

                <label for="capital">Capital:</label>
                <input type="text" id="capital" name="capital" value="<%= s.capital %>" required>

                <label for="region">Region:</label>
                <select name="region" id="region" required>
                    <%
                        String[] regions = {"Midwest", "Northeast", "Pacific Northwest", "Southeast", "Southwest", "West"};
                        for (String r : regions) {
                            String selected = (s.region != null && s.region.equals(r)) ? "selected" : "";
                    %>
                    <option value="<%= r %>" <%= selected %>><%= r %></option>
                    <% } %>
                </select>

                <label for="population">Population:</label>
                <input type="number" id="population" name="population" value="<%= (s.population == null ? "" : s.population) %>" required>

                <label for="year_founded">Year Founded (optional):</label>
                <input type="number" id="year_founded" name="year_founded" value="<%= (s.yearFounded == null ? "" : s.yearFounded) %>">

                <div class="button-row">
                    <button type="submit">Save Updates</button>
                </div>
            </form>

            <div class="link-split">
                <a class="link-button" href="updateSelect.jsp">Back to Select</a>
                <a class="link-button" href="index.jsp">Back to Index</a>
            </div>

            <% } %>
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
