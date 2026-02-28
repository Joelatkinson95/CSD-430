<%-- Joel Atkinson, February 27, 2026. CSD430 Server Side Development Assignment 9.2 Project part 4.
The purpose of this assignment is to build on the previous 3 with my states database. This week's project has me updating
my JavaBean and creating the new .jsp files to create the pages for the user to be able to delete a state from the database
and have the .jsp files pull the data through the JavaBean and delete the state data from the database and then
output the updated database information to the user in another .jsp page --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="java.util.List" %>
<%@ page import="beans.StatesBean.StateRecord" %>
<%@ page import="beans.StatesBean.StateOption" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete State Record</title>
    <link rel="stylesheet" href="assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Delete State Record</h1>
        <p>Record deletion results and remaining records are shown below.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <%
            StatesBean bean = new StatesBean();

            boolean deleted = false;
            String message = "";

            String idParam = request.getParameter("id");
            int id = -1;

            try {
                id = Integer.parseInt(idParam);
                deleted = bean.deleteStateById(id);

                if (deleted) {
                    message = "Success! Record with ID " + id + " was deleted.";
                } else {
                    message = "Error: Record could not be deleted (ID may not exist).";
                }

            } catch (Exception e) {
                message = "Error: Invalid ID submitted.";
            }

            // Pull updated data
            List<StateRecord> states = bean.getAllStates();
            List<StateOption> options = bean.getStateOptions();
        %>

        <div class="form-card">
            <p><strong><%= message %></strong></p>

            <form action="processDeleteState.jsp" method="post">
                <label for="id">Delete another record:</label>

                <select name="id" id="id" <%= (options == null || options.isEmpty()) ? "disabled" : "" %>>
                    <%
                        if (options != null && !options.isEmpty()) {
                            for (StateOption o : options) {
                    %>
                    <option value="<%= o.id %>"><%= o.id %> - <%= o.name %></option>
                    <%
                        }
                    } else {
                    %>
                    <option>No records available</option>
                    <%
                        }
                    %>
                </select>

                <div class="button-row">
                    <button type="submit" <%= (options == null || options.isEmpty()) ? "disabled" : "" %>>
                        Delete Record
                    </button>
                </div>
            </form>

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
                <%
                    if (states != null && !states.isEmpty()) {
                        for (StateRecord s : states) {
                %>
                <tr>
                    <td><%= s.id %></td>
                    <td><%= s.stateName %></td>
                    <td><%= s.stateCode %></td>
                    <td><%= s.capital %></td>
                    <td><%= s.region %></td>
                    <td><%= s.population %></td>
                    <td><%= s.yearFounded %></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>

            <div class="link-split">
                <a class="link-button" href="deleteState.jsp">Back to Delete Page</a>
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