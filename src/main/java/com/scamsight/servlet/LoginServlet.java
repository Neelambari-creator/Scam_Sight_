
package com.scamsight.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.scamsight.dao.DatabaseConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null
                || email.trim().isEmpty()
                || password.isEmpty()) {

            request.setAttribute(
                    "error",
                    "Email and password are required."
            );

            request.getRequestDispatcher("login.jsp")
                   .forward(request, response);

            return;
        }

        String sql =
                "SELECT id, name, email, password "
                + "FROM users WHERE email = ?";

        try (
            Connection connection =
                    DatabaseConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, email.trim());

            try (ResultSet resultSet =
                    statement.executeQuery()) {

                if (resultSet.next()) {

                    String storedPassword =
                            resultSet.getString("password");

                    boolean passwordMatches =
                            BCrypt.checkpw(
                                    password,
                                    storedPassword
                            );

                    if (passwordMatches) {

                        HttpSession session =
                                request.getSession();

                        session.setAttribute(
                                "userId",
                                resultSet.getInt("id")
                        );

                        session.setAttribute(
                                "userName",
                                resultSet.getString("name")
                        );

                        session.setAttribute(
                                "userEmail",
                                resultSet.getString("email")
                        );

                        response.sendRedirect(
                                request.getContextPath()
                                + "/dashboard.jsp"
                        );

                    } else {

                        request.setAttribute(
                                "error",
                                "Invalid email or password."
                        );

                        request.getRequestDispatcher(
                                "login.jsp"
                        ).forward(request, response);
                    }

                } else {

                    request.setAttribute(
                            "error",
                            "Invalid email or password."
                    );

                    request.getRequestDispatcher(
                            "login.jsp"
                    ).forward(request, response);
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Login error: " + e.getMessage()
            );

            request.getRequestDispatcher(
                    "login.jsp"
            ).forward(request, response);
        }
    }
}

