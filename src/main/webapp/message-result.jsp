
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>ScamSight - Message Analysis Result</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scamsight.css">

    <style>

        .result-box {
            max-width: 850px;
            margin: 50px auto;
            padding: 40px;

            background: rgba(5, 15, 25, 0.90);

            border: 1px solid rgba(56, 217, 255, 0.20);

            border-radius: 18px;

            box-shadow:
                0 20px 60px rgba(0, 0, 0, 0.55),
                0 0 30px rgba(56, 217, 255, 0.06);

            backdrop-filter: blur(12px);
        }

        .result-box h1 {
            text-align: center;
            margin-bottom: 35px;
        }

        .message-title {
            margin-bottom: 10px;
            color: #38d9ff;
            font-size: 13px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .message {
            background: rgba(2, 9, 16, 0.80);
            border: 1px solid rgba(56, 217, 255, 0.12);
            padding: 20px;
            border-radius: 10px;
            line-height: 1.7;
            margin-bottom: 30px;
            color: #d7e8ef;
            white-space: pre-wrap;
            word-break: break-word;
        }

        .score {
            text-align: center;
            font-size: 38px;
            font-weight: bold;
            margin: 25px 0;
            color: #38d9ff;
        }

        .risk {
            text-align: center;
            font-size: 25px;
            font-weight: bold;
            padding: 17px;
            border-radius: 10px;
            margin-bottom: 30px;
        }

        .risk.low {
            background: rgba(34, 197, 94, 0.10);
            color: #4ade80;
            border: 1px solid rgba(74, 222, 128, 0.25);
        }

        .risk.medium {
            background: rgba(250, 204, 21, 0.10);
            color: #facc15;
            border: 1px solid rgba(250, 204, 21, 0.25);
        }

        .risk.high {
            background: rgba(244, 63, 94, 0.10);
            color: #fb7185;
            border: 1px solid rgba(251, 113, 133, 0.25);
        }

        .warnings {
            background: rgba(250, 204, 21, 0.06);
            border: 1px solid rgba(250, 204, 21, 0.18);
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 25px;
        }

        .warnings h2 {
            color: #facc15;
            margin-bottom: 15px;
        }

        .warnings p {
            color: #c9d6dc;
            line-height: 1.8;
        }

        .recommendation {
            background: rgba(56, 217, 255, 0.05);
            border: 1px solid rgba(56, 217, 255, 0.16);
            padding: 25px;
            border-radius: 12px;
            margin-bottom: 30px;
        }

        .recommendation h2 {
            color: #38d9ff;
            margin-bottom: 10px;
        }

        .recommendation p {
            color: #c9d6dc;
            line-height: 1.7;
        }

        .back {
            display: block;
            text-align: center;
            background: #38d9ff;
            color: #021019;
            padding: 14px 20px;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.25s ease;
        }

        .back:hover {
            background: #63e3ff;
            transform: translateY(-2px);
        }

        @media (max-width: 700px) {

            .result-box {
                width: 94%;
                margin: 25px auto;
                padding: 22px;
            }

            .result-box h1 {
                font-size: 26px;
            }

            .score {
                font-size: 30px;
            }

            .risk {
                font-size: 21px;
            }
        }

    </style>

</head>

<body>

    <nav>

        <div class="logo">
            🔍 ScamSight
        </div>

    </nav>


    <div class="container">

        <div class="result-box">

            <h1>
                💬 Message Analysis Result
            </h1>


            <div class="message-title">
                Analyzed Message
            </div>

            <div class="message">
                ${message}
            </div>


            <div class="score">
                Risk Score: ${riskScore}/100
            </div>


            <div class="risk ${riskClass}">
                ${riskLevel}
            </div>


            <div class="warnings">

                <h2>
                    ⚠️ Warning Signs
                </h2>

                <p>
                    ${warnings}
                </p>

            </div>


            <div class="recommendation">

                <h2>
                    💡 Recommendation
                </h2>

                <p>
                    ${recommendation}
                </p>

            </div>


            <a class="back"
               href="${pageContext.request.contextPath}/message.jsp">

                🔄 Analyze Another Message

            </a>

        </div>

    </div>

</body>

</html>

