/* Joel Atkinson March 3, 2026. The purpose of this project is to demonstrate how to use custom tags to import Java
logic code from a tag class into a JSP file. */

package com.example.tags;


import java.io.IOException;
import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.JspException;

public class ExampleTag extends SimpleTagSupport {

    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void doTag() throws JspException, IOException {
        getJspContext().getOut().write(
                "This is my example for Assignment 10.2 custom tags. Hello my name is " + name
        );
    }
}
