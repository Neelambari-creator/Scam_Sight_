
package com.scamsight.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/analyze-message")
public class MessageAnalyzerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String message = request.getParameter("message");

        int riskScore = 0;

        StringBuilder warnings = new StringBuilder();

        // Basic validation
        if (message == null || message.trim().isEmpty()) {

            request.setAttribute("message", "");
            request.setAttribute("riskScore", 0);
            request.setAttribute("riskLevel", "INVALID MESSAGE");
            request.setAttribute("riskClass", "medium");
            request.setAttribute(
                "warnings",
                "⚠️ Please enter a message."
            );

            request.setAttribute(
                "recommendation",
                "Please enter a message to perform the analysis."
            );

            request.getRequestDispatcher("message-result.jsp")
                   .forward(request, response);

            return;
        }

        message = message.trim();

        String lowerMessage = message.toLowerCase();

        // Suspicious words commonly found in scam messages
        String[] suspiciousWords = {

            "urgent",
            "verify",
            "verification",
            "account",
            "password",
            "otp",
            "bank",
            "blocked",
            "suspended",
            "click",
            "winner",
            "won",
            "prize",
            "free",
            "offer",
            "limited",
            "claim",
            "refund",
            "payment"

        };

        // Check suspicious words
        for (String word : suspiciousWords) {

            if (lowerMessage.contains(word)) {

                riskScore += 8;

                warnings.append(
                    "⚠️ Suspicious word detected: "
                )
                .append(word)
                .append("<br>");
            }
        }

        // Check for links
        if (lowerMessage.contains("http://")
                || lowerMessage.contains("https://")
                || lowerMessage.contains("www.")) {

            riskScore += 20;

            warnings.append(
                "⚠️ Message contains a website link<br>"
            );
        }

        // Check for urgency
        if (lowerMessage.contains("immediately")
                || lowerMessage.contains("now")
                || lowerMessage.contains("within 24 hours")
                || lowerMessage.contains("act fast")) {

            riskScore += 10;

            warnings.append(
                "⚠️ Message creates a sense of urgency<br>"
            );
        }

        // Check for financial requests
        if (lowerMessage.contains("send money")
                || lowerMessage.contains("transfer money")
                || lowerMessage.contains("pay now")
                || lowerMessage.contains("payment required")) {

            riskScore += 15;

            warnings.append(
                "⚠️ Message requests financial action<br>"
            );
        }

        // Check for OTP/password requests
        if (lowerMessage.contains("share otp")
                || lowerMessage.contains("send otp")
                || lowerMessage.contains("share password")
                || lowerMessage.contains("enter password")) {

            riskScore += 20;

            warnings.append(
                "⚠️ Message requests sensitive credentials<br>"
            );
        }

        // Maximum score
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
                "🚨 Do not click links or provide OTPs, passwords, "
                + "bank details, or other sensitive information.";

        } else if (riskScore >= 30) {

            riskLevel = "🟡 MEDIUM RISK";
            riskClass = "medium";

            recommendation =
                "⚠️ Be careful. Verify the sender independently "
                + "before clicking links or sharing information.";

        } else {

            riskLevel = "🟢 LOW RISK";
            riskClass = "low";

            recommendation =
                "✅ No major scam indicators were detected. "
                + "Still verify unexpected messages before taking action.";
        }

        // No warnings
        if (warnings.length() == 0) {

            warnings.append(
                "✅ No major warning signs detected"
            );
        }

        // Send results to JSP
        request.setAttribute("message", message);
        request.setAttribute("riskScore", riskScore);
        request.setAttribute("riskLevel", riskLevel);
        request.setAttribute("riskClass", riskClass);
        request.setAttribute("warnings", warnings.toString());
        request.setAttribute("recommendation", recommendation);

        // Forward to result page
        request.getRequestDispatcher("message-result.jsp")
               .forward(request, response);
    }
}