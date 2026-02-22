<%-- Joel Atkinson, February 20, 2026 CSD430 Server Side Development Assignment Part 3 (Update Record) The purpose of this
assignment is to update the Java Bean and write jsp files to create pages that allow for the user to update the records
in the database (except for the key which is ID)
This page allows the user to select which record they want to update. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="beans.StatesBean" %>
<%@ page import="beans.StatesBean.StateOption" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update a State (Select Record)</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Update a State Record</h1>
        <p>Select a state record to update.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <%
            StatesBean bean = new StatesBean();
            List<StateOption> options = bean.getStateOptions();
        %>

        <div class="form-card">
            <form action="updateForm.jsp" method="post">
                <label for="id">Choose a State:</label>

                <select name="id" id="id">
                    <% for (StateOption opt : options) { %>
                    <option value="<%= opt.id %>"><%= opt.name %> (ID: <%= opt.id %>)</option>
                    <% } %>
                </select>

                <div class="button-row">
                    <button type="submit">Edit This Record</button>
                </div>
            </form>

            <div class="link-split">
                <a class="link-button" href="index.jsp">Back to Index</a>
                <a class="link-button" href="selectState.jsp">Back to Lookup</a>
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
