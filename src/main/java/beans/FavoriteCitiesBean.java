package beans;

import java.io.Serializable;
import java.util.ArrayList;

/* Joel Atkinson, January 30, 2026, CSD430 Assignment 4.2 JavaBean
The purpose of this assignment is to create a JavaBean to hold the data from assignment 2.2 and then write
a JSP page to display the data. This is the JavaBean file for the assignment where the data is stored and then will be
retrieved and displayed using the JSP page */

public class FavoriteCitiesBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private ArrayList<String[]> places;

    // No-argument constructor
    public FavoriteCitiesBean() {
        places = new ArrayList<>();

        places.add(new String[]{"Munich", "Germany", "2023", "Drank beer at Oktoberfest"});
        places.add(new String[]{"Hallstatt", "Austria", "2023", "Explored the beautiful town"});
        places.add(new String[]{"Honolulu", "USA", "2022", "Visited Pearl Harbor"});
        places.add(new String[]{"Houston", "USA", "2018", "Attended the Houston Rodeo"});
        places.add(new String[]{"Rome", "Italy", "2023", "Drank wine across from the Colosseum"});
        places.add(new String[]{"Niagara Falls", "Canada", "2020", "Took the Maid of the Mist"});
        places.add(new String[]{"Positano", "Italy", "2023", "Boat tour along the Amalfi Coast"});
        places.add(new String[]{"Banff", "Canada", "2020", "Horseback riding through the Rocky Mountains"});
        places.add(new String[]{"Orlando", "USA", "2025", "Took my daughter to Disney World"});
    }

    // Getter
    public ArrayList<String[]> getPlaces() {
        return places;
    }

    // Setter
    public void setPlaces(ArrayList<String[]> places) {
        this.places = places;
    }
}

