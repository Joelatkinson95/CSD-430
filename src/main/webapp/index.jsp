<%-- Joel Atkinson, February 7, 2026, CSD430 Server Side Development Assignment 5&6
The purpose of this assignment is to create a database called CSD430 in SQL, then create a table (I chose U.S. states),
and populate that table with at least 5 data fields. From there create a JavaBean to pull the data from the database
which will be linked to the .jsp files in order to have a selection of a U.S. state and then to display the data of that
state in a table. In addition to this, also create an index.jsp file for this course as the landing page where all of our
assignments will be held. I went ahead and also created .css style sheets for both the index as well as the module 5/6
.jsp files. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD430 - Server Side Development</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/index.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>CSD430 - Server Side Development</h1>
        <p>This index page contains links to all module assignments for this course.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <h2>Assignments</h2>

        <div class="assignments">
            <ul>
                <li>
                    <a class="assignment-link" href="selectState.jsp">
                        <span class="assignment-title">
                            Assignment Part 1 - State Database Lookup
                        </span>
                        <span class="assignment-desc">
                            State Record Display
                        </span>
                    </a>
                </li>
            </ul>
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