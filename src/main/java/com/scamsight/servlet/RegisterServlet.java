
package com.scamsight.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.scamsight.dao.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (name == null || email == null || password == null
                || name.trim().isEmpty()
                || email.trim().isEmpty()
                || password.trim().isEmpty()) {

            request.setAttribute(
                    "error",
                    "All fields are required."
            );

            request.getRequestDispatcher(
                    "register.jsp"
            ).forward(request, response);

            return;
        }


        String hashedPassword =
                BCrypt.hashpw(
                        password,
                        BCrypt.gensalt()
                );


        String sql =
                "INSERT INTO users (name, email, password) "
                + "VALUES (?, ?, ?)";


        try (
            Connection connection =
                    DatabaseConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, name.trim());
            statement.setString(2, email.trim());
            statement.setString(3, hashedPassword);

            statement.executeUpdate();


            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );


        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Registration failed. Email may already be registered."
            );

            request.getRequestDispatcher(
                    "register.jsp"
            ).forward(request, response);
        }
    }
}

