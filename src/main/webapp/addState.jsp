<%-- Joel Atkinson, February 14, 2026, CSD430 Server Side Development Assignment 7.2. The purpose of this assignment
is to update my javabean to allow for data to be added into the database through a form that I also created using .jsp
this form will allow users to add a state to the database and then will proceed to show the user the entire database with
the newly added state date in there. --%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add State Record</title>
    <link rel="stylesheet" href="assignment_5_1.css">
</head>
<body>

<div class="page">

    <div class="header">
        <h1>Add a State Record</h1>
        <p>Enter state information below to add a new record to the database.</p>
    </div>

    <hr class="gold-divider">

    <div class="content">
        <div class="form-card">
            <form action="processAddState.jsp" method="post">

                <label for="state_name">State Name:</label>
                <input type="text" id="state_name" name="state_name" required>

                <label for="state_code">State Code (2 letters):</label>
                <input type="text" id="state_code" name="state_code" maxlength="2" required>

                <label for="capital">Capital:</label>
                <input type="text" id="capital" name="capital" required>

                <label for="region">Region</label>
                <select name="region" id="region" required>
                    <option value="">-- Select Region --</option>
                    <option value="Midwest">Midwest</option>
                    <option value="Northeast">Northeast</option>
                    <option value="Pacific Northwest">Pacific Northwest</option>
                    <option value="Southeast">Southeast</option>
                    <option value="Southwest">Southwest</option>
                    <option value="West">West</option>
                </select>

                <label for="population">Population:</label>
                <input type="number" id="population" name="population" min="0" required>

                <label for="year_founded">Year Founded:</label>
                <input type="number" id="year_founded" name="year_founded" min="0" required>

                <div class="button-row">
                    <button type="submit">Add State</button>
                </div>

            </form>
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
