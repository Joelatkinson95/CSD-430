<%--
Joel Atkinson, January 30, 2026, CSD430 Assignment 4.2
The purpose of this assignment is to create a JavaBean to hold the data from assignment 2.2 and then write
a JSP page to display the data. This is the JSP file for the assignment where it will pull the data from the JavaBean
and display it
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="beans.FavoriteCitiesBean" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Favorite Cities I Have Visited</title>
    <link rel="stylesheet" href="assignment_2_2.css">
</head>

<body>

<div class="header">
    <h1>My Favorite Cities in the World that I Have Visited</h1>

    <%-- Adding in paragraph to show that the information is retrieved from a Javabean to change the display slightly
    from assignment 2.2 which displayed the same information --%>
    <p>
        This page displays data retrieved from a JavaBean.
        The JavaBean stores information about cities I have visited,
        including location, year visited, and favorite activities.
    </p>
</div>

<hr class="gold-divider">

<%
    // Create JavaBean instance
    FavoriteCitiesBean cityBean = new FavoriteCitiesBean();

    // Retrieve data from the JavaBean
    ArrayList<String[]> places = cityBean.getPlaces();
%>

<div class="content">

    <h2>Favorite Cities Table (9 Records)</h2>

    <table>
        <tr>
            <th>City</th>
            <th>Country</th>
            <th>Year Visited</th>
            <th>Favorite Thing I Did While There</th>
        </tr>

        <%
            for (String[] place : places) {
        %>
        <tr>
            <td><%= place[0] %></td>
            <td><%= place[1] %></td>
            <td><%= place[2] %></td>
            <td><%= place[3] %></td>
        </tr>
        <%
            }
        %>
    </table>

    <h3>Field Descriptions</h3>
    <ul>
        <li><strong>City:</strong> The city or location visited</li>
        <li><strong>Country:</strong> Country where the city is located</li>
        <li><strong>Year Visited:</strong> Year the visit occurred</li>
        <li><strong>Favorite Thing:</strong> Memorable activity during the visit</li>
    </ul>

</div>

</body>
</html>
