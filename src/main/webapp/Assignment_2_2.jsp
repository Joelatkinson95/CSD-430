<%--
Joel Atkinson, January 14 2026, CSD430 Server Side Development Assignment 2.2
The purpose of this assignment is to create a .jsp file program that uses HTML tags outside of Java Scriptlets that
creates a table with data to be displayed. For my data I chose my favorite cities that I have visited around the world
and included 9 cities with 4 data point fields per city. I also created a CSS Stylesheet to style my page.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Favorite Cities I Have Visited</title>
    <link rel="stylesheet" href="assignment_2_2.css">
</head>

<body>

<!-- Header Section -->
<div class="header">
    <h1>My Favorite Cities in the World that I Have Visited</h1>
    <p>
        This page lists some of my favorite cities that I have visited around the world.
        The table below displays the city name, country, year visited, and my favorite
        activity while visiting each location.
    </p>
</div>

<hr class="gold-divider">

<%
    // Java Scriptlet creates data for my favorite cities
    ArrayList<String[]> places = new ArrayList<>();

    places.add(new String[]{"Munich", "Germany", "2023", "Drank beer at Oktoberfest"});
    places.add(new String[]{"Hallstatt", "Austria", "2023", "Explored the beautiful town"});
    places.add(new String[]{"Honolulu", "USA", "2022", "Visited Pearl Harbor"});
    places.add(new String[]{"Houston", "USA", "2018", "Attended the Houston Rodeo"});
    places.add(new String[]{"Rome", "Italy", "2023", "Drank wine across from the Colosseum"});
    places.add(new String[]{"Niagara Falls", "Canada", "2020", "Took the Maid of the Mist"});
    places.add(new String[]{"Positano", "Italy", "2023", "Boat tour along the Amalfi Coast"});
    places.add(new String[]{"Banff", "Canada", "2020", "Horseback riding through the Rocky Mountains"});
    places.add(new String[]{"Orlando", "USA", "2025", "Took my daughter to Disney World"});
%>

<!-- Main Content Section -->
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
            // Java Scriptlet loops through records and outputs data in table
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
        <li><strong>City:</strong> The main city or area I visited</li>
        <li><strong>Country:</strong> The country the city is located in</li>
        <li><strong>Year Visited:</strong> The year I visited the location</li>
        <li><strong>Favorite Thing I Did While There:</strong> My favorite activity or experience</li>
    </ul>

</div>

</body>
</html>
