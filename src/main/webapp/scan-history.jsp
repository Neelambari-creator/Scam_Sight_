<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Scan History - ScamSight</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f7f9;
            margin: 0;
            padding: 30px;
        }

        .container {
            max-width: 1200px;
            margin: auto;
        }

        h1 {
            text-align: center;
        }

        .back {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background: #333;
            color: white;
        }

        tr:nth-child(even) {
            background: #f2f2f2;
        }

        .high {
            color: red;
            font-weight: bold;
        }

        .medium {
            color: orange;
            font-weight: bold;
        }

        .low {
            color: green;
            font-weight: bold;
        }

        .error {
            color: red;
            text-align: center;
        }

    </style>
</head>

<body>

<div class="container">

    <h1>ScamSight Scan History</h1>

    <a class="back" href="index.jsp">
        ← Back to ScamSight
    </a>

    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <c:choose>

        <c:when test="${empty records}">

            <p style="text-align:center;">
                No scan history available.
            </p>

        </c:when>

        <c:otherwise>

            <table>

                <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Input</th>
                    <th>Risk Score</th>
                    <th>Risk Level</th>
                    <th>Warnings</th>
                    <th>Recommendation</th>
                    <th>Scanned At</th>
                </tr>

                <c:forEach var="record" items="${records}">

                    <tr>

                        <td>
                            ${record.id}
                        </td>

                        <td>
                            ${record.inputType}
                        </td>

                        <td>
                            ${record.inputText}
                        </td>

                        <td>
                            ${record.riskScore}/100
                        </td>

                        <td>
                            ${record.riskLevel}
                        </td>

                        <td>
                            ${record.warnings}
                        </td>

                        <td>
                            ${record.recommendation}
                        </td>

                        <td>
                            ${record.scannedAt}
                        </td>

                    </tr>

                </c:forEach>

            </table>

        </c:otherwise>

    </c:choose>

</div>

</body>

</html>