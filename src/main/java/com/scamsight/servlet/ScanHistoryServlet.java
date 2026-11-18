package com.scamsight.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.scamsight.dao.DatabaseConnection;
import com.scamsight.model.ScanRecord;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/scan-history")
public class ScanHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        List<ScanRecord> records = new ArrayList<>();

        String sql =
                "SELECT id, input_type, input_text, risk_score, " +
                "risk_level, warnings, recommendation, scanned_at " +
                "FROM scan_history ORDER BY scanned_at DESC";

        try (
            Connection connection = DatabaseConnection.getConnection();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery()
        ) {

            while (resultSet.next()) {

                ScanRecord record = new ScanRecord();

                record.setId(resultSet.getInt("id"));
                record.setInputType(resultSet.getString("input_type"));
                record.setInputText(resultSet.getString("input_text"));
                record.setRiskScore(resultSet.getInt("risk_score"));
                record.setRiskLevel(resultSet.getString("risk_level"));
                record.setWarnings(resultSet.getString("warnings"));
                record.setRecommendation(
                        resultSet.getString("recommendation")
                );
                record.setScannedAt(
                        resultSet.getTimestamp("scanned_at")
                );

                records.add(record);
            }

        } catch (Exception e) {

            e.printStackTrace();

            request.setAttribute(
                    "error",
                    "Unable to load scan history."
            );
        }

        request.setAttribute("records", records);

        request.getRequestDispatcher("scan-history.jsp")
               .forward(request, response);
    }
}