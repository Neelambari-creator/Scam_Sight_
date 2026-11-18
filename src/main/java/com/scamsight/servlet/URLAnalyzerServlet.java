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

@WebServlet("/analyze-url")
public class URLAnalyzerServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        // Get URL from form
        String url = request.getParameter("url");

        int riskScore = 0;

        StringBuilder warnings = new StringBuilder();

        // Basic validation
        if (url == null || url.trim().isEmpty()) {

            request.setAttribute("url", "");
            request.setAttribute("riskScore", 0);
            request.setAttribute("riskLevel", "INVALID URL");
            request.setAttribute("riskClass", "high");

            request.setAttribute(
                    "warnings",
                    "⚠️ Please enter a URL."
            );

            request.setAttribute(
                    "recommendation",
                    "Please enter a valid website URL."
            );

            request.getRequestDispatcher("result.jsp")
                    .forward(request, response);

            return;
        }

        // Remove extra spaces
        url = url.trim();

        String lowerUrl = url.toLowerCase();

        // CHECK 1: HTTP instead of HTTPS
        if (lowerUrl.startsWith("http://")) {

            riskScore += 15;

            warnings.append(
                    "⚠️ Website does not use HTTPS<br>"
            );
        }

        // CHECK 2: IP address instead of domain
        if (lowerUrl.matches(
                ".*://\\d+\\.\\d+\\.\\d+\\.\\d+.*")) {

            riskScore += 25;

            warnings.append(
                    "⚠️ URL uses an IP address instead of a domain name<br>"
            );
        }

        // CHECK 3: Suspicious keywords
        String[] suspiciousWords = {

            "login",
            "verify",
            "account",
            "password",
            "prize",
            "winner",
            "free",
            "urgent",
            "bank",
            "confirm",
            "security"
        };

        for (String word : suspiciousWords) {

            if (lowerUrl.contains(word)) {

                riskScore += 8;

                warnings.append(
                        "⚠️ Suspicious keyword detected: "
                )
                .append(word)
                .append("<br>");
            }
        }

        // CHECK 4: Very long URL
        if (url.length() > 100) {

            riskScore += 10;

            warnings.append(
                    "⚠️ URL is unusually long<br>"
            );
        }

        // CHECK 5: @ symbol
        if (url.contains("@")) {

            riskScore += 15;

            warnings.append(
                    "⚠️ URL contains an @ symbol<br>"
            );
        }

        // CHECK 6: Too many subdomains
        String domainPart = lowerUrl
                .replaceFirst("https?://", "")
                .split("/")[0];

        int dotCount = 0;

        for (char character : domainPart.toCharArray()) {

            if (character == '.') {

                dotCount++;
            }
        }

        if (dotCount >= 3) {

            riskScore += 10;

            warnings.append(
                    "⚠️ URL contains many subdomains<br>"
            );
        }

        // CHECK 7: Too many hyphens
        long hyphenCount =
                lowerUrl.chars()
                        .filter(ch -> ch == '-')
                        .count();

        if (hyphenCount >= 3) {

            riskScore += 10;

            warnings.append(
                    "⚠️ URL contains many hyphens<br>"
            );
        }

        // Maximum risk score = 100
        if (riskScore > 100) {

            riskScore = 100;
        }

        // Determine risk level
        String riskLevel;
        String riskClass;
        String recommendation;

        if (riskScore >= 60) {

            riskLevel = "🔴 HIGH RISK";
            riskClass = "high";

            recommendation =
                    "🚨 Do not visit this website or provide personal "
                    + "information such as passwords, bank details, or OTPs.";

        } else if (riskScore >= 30) {

            riskLevel = "🟡 MEDIUM RISK";
            riskClass = "medium";

            recommendation =
                    "⚠️ Proceed with caution. Avoid entering sensitive "
                    + "information unless you can verify that the website is legitimate.";

        } else {

            riskLevel = "🟢 LOW RISK";
            riskClass = "low";

            recommendation =
                    "✅ No major warning signs were detected. "
                    + "However, always verify the website before sharing sensitive information.";
        }

        // No warning signs
        if (warnings.length() == 0) {

            warnings.append(
                    "✅ No major warning signs detected"
            );
        }

        // Save result to MySQL
        String sql =
                "INSERT INTO scan_history "
                + "(input_type, input_text, risk_score, risk_level, warnings, recommendation) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
                Connection connection =
                        DatabaseConnection.getConnection();

                PreparedStatement statement =
                        connection.prepareStatement(sql)
        ) {

            System.out.println(
                    "DATABASE CONNECTION SUCCESSFUL"
            );

            statement.setString(1, "URL");
            statement.setString(2, url);
            statement.setInt(3, riskScore);
            statement.setString(4, riskLevel);
            statement.setString(5, warnings.toString());
            statement.setString(6, recommendation);

            statement.executeUpdate();

            System.out.println(
                    "URL SAVED TO MYSQL SUCCESSFULLY"
            );

        } catch (Exception e) {

            System.out.println(
                    "DATABASE ERROR:"
            );

            e.printStackTrace();
        }

        // Send result to JSP
        request.setAttribute(
                "url",
                url
        );

        request.setAttribute(
                "riskScore",
                riskScore
        );

        request.setAttribute(
                "riskLevel",
                riskLevel
        );

        request.setAttribute(
                "riskClass",
                riskClass
        );

        request.setAttribute(
                "warnings",
                warnings.toString()
        );

        request.setAttribute(
                "recommendation",
                recommendation
        );

        // Open result.jsp
        request.getRequestDispatcher(
                "result.jsp"
        ).forward(
                request,
                response
        );
    }
}