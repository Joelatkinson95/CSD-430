<%--
 Joel Atkinson, January 15,2026, CSD430 Server Side Development Assignment 3.2
 The purpose of this assignment is to create a program that accepts different types of data with at least 5 data entry
 points, then create a seperate JSP file to display the data that is collected
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You - Joel's Pizzeria</title>
    <link rel="stylesheet" href="Assignment_3_2.css">
    <style>
        /* Additional styles just for the thank-you/display page */
        header h1 {
            font-size: 2.8rem;
            padding: 25px 15px;
        }
        main {
            max-width: 800px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 25px;
            background-color: #fff;
            box-shadow: 0 3px 15px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 14px 18px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #c8102e;
            color: white;
        }

        .thanks-msg {
            text-align: center;
            font-size: 1.4rem;
            margin: 30px 0;
            color: #006400;
        }
    </style>
</head>
<body>

<header>
    <h1>Joel's Pizzeria</h1>
</header>

<div class="green-line"></div>

<main>
    <h2>Mama Mia! That's a'lotta Feedback!</h2>
    <p class="thanks-msg">Thank you!
        <br>Joel's Pizzeria team</p>

    <table>
        <tr>
            <th>Field</th>
            <th>Your Response</th>
        </tr>

        <%
            // Get all form parameters
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String source = request.getParameter("source");
            String ratingStr = request.getParameter("rating");
            String experience = request.getParameter("experience");

            // Handle null values safely
            if (name == null) name = "N/A";
            if (email == null) email = "N/A";
            if (source == null) source = "N/A";
            if (experience == null) {
                experience = "N/A";
            } else {
                experience = experience.replace("\n", "<br>");
            }

            // Parse rating safely
            int rating = 0;
            try {
                if (ratingStr != null && !ratingStr.trim().isEmpty()) {
                    rating = Integer.parseInt(ratingStr);
                }
            } catch (NumberFormatException e) {
                rating = 0;
            }
        %>

        <tr>
            <td><strong>Name</strong></td>
            <td><%= name %></td>
        </tr>
        <tr>
            <td><strong>Email</strong></td>
            <td><%= email %></td>
        </tr>
        <tr>
            <td><strong>How did you hear about us?</strong></td>
            <td><%= source %></td>
        </tr>
        <tr>
            <td><strong>Rating</strong></td>
            <td>
                <%
                    if (rating >= 1 && rating <= 5) {
                        out.print("<span class='rating-stars'>");

                        for (int i = 0; i < rating; i++) {
                            out.print("&#9733;");
                        }

                        for (int i = rating; i < 5; i++) {
                            out.print("&#9734;");
                        }

                        out.print("</span> (" + rating + "/5)");
                    } else {
                        out.print("Not provided");
                    }
                %>
            </td>
        </tr>
        <tr>
            <td><strong>Your Experience</strong></td>
            <td><%= experience %></td>
        </tr>
    </table>
</main>

</body>
</html>

