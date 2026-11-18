<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ScamSight - Analysis Result</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            min-height: 100vh;
            color: #e5f6ff;

            background:
                radial-gradient(
                    circle at 15% 10%,
                    rgba(0, 200, 255, 0.10),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 85% 90%,
                    rgba(60, 100, 255, 0.08),
                    transparent 30%
                ),
                linear-gradient(
                    135deg,
                    #02070d,
                    #07131f,
                    #02080f
                );

            background-attachment: fixed;
        }


        /* NAVIGATION */

        nav {
            height: 70px;

            display: flex;
            align-items: center;

            padding: 0 7%;

            background: rgba(2, 8, 15, 0.94);

            border-bottom: 1px solid rgba(0, 210, 255, 0.30);

            box-shadow:
                0 5px 25px rgba(0, 0, 0, 0.40);
        }


        .logo {
            font-size: 24px;
            font-weight: bold;

            color: #38d9ff;

            letter-spacing: 0.5px;

            text-shadow:
                0 0 12px rgba(56, 217, 255, 0.45);
        }


        /* MAIN CONTAINER */

        .container {
            width: 92%;
            max-width: 900px;

            margin: 45px auto;
        }


        /* PAGE HEADER */

        .page-header {
            text-align: center;

            margin-bottom: 28px;
        }


        .page-header .icon {
            font-size: 36px;

            margin-bottom: 8px;
        }


        .page-header h1 {
            font-size: 31px;

            color: #e8faff;

            margin-bottom: 8px;

            letter-spacing: 0.3px;
        }


        .page-header p {
            color: #7f9aaa;

            font-size: 14px;
        }


        /* MAIN CARD */

        .result-box {
            background: rgba(7, 18, 29, 0.92);

            border: 1px solid rgba(56, 217, 255, 0.20);

            border-radius: 18px;

            padding: 32px;

            box-shadow:
                0 20px 50px rgba(0, 0, 0, 0.45),
                0 0 25px rgba(0, 190, 255, 0.04);
        }


        /* SECTION LABEL */

        .section-label {
            color: #38d9ff;

            font-size: 12px;

            font-weight: bold;

            text-transform: uppercase;

            letter-spacing: 1.5px;

            margin-bottom: 9px;
        }


        /* URL BOX */

        .url {
            background: rgba(1, 7, 13, 0.85);

            border: 1px solid rgba(56, 217, 255, 0.18);

            border-left: 3px solid #38d9ff;

            padding: 16px 18px;

            border-radius: 9px;

            word-break: break-all;

            color: #c9e9f4;

            font-size: 14px;

            line-height: 1.6;

            margin-bottom: 30px;
        }


        /* RISK SCORE */

        .score-area {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 35px;

            padding: 25px;

            margin-bottom: 25px;

            background:
                linear-gradient(
                    90deg,
                    rgba(0, 180, 255, 0.04),
                    rgba(80, 100, 255, 0.04)
                );

            border: 1px solid rgba(56, 217, 255, 0.10);

            border-radius: 14px;
        }


        .score-circle {

            width: 145px;
            height: 145px;

            flex-shrink: 0;

            border-radius: 50%;

            display: flex;

            flex-direction: column;

            align-items: center;

            justify-content: center;

            background: #07131f;

            border: 5px solid #28c7ee;

            box-shadow:
                0 0 20px rgba(40, 199, 238, 0.18),
                inset 0 0 20px rgba(40, 199, 238, 0.05);
        }


        .score-number {

            font-size: 40px;

            font-weight: bold;

            color: #f1fbff;
        }


        .score-out {

            font-size: 11px;

            color: #718999;

            margin-top: 3px;

            letter-spacing: 1px;
        }


        .score-description {

            max-width: 480px;
        }


        .score-description h2 {

            font-size: 20px;

            color: #dff8ff;

            margin-bottom: 9px;
        }


        .score-description p {

            color: #849aaa;

            line-height: 1.7;

            font-size: 14px;
        }


        /* RISK LEVEL */

        .risk {

            text-align: center;

            padding: 16px;

            border-radius: 10px;

            font-size: 20px;

            font-weight: bold;

            margin-bottom: 25px;

            border: 1px solid;
        }


        /* LOW */

        .risk.low {

            color: #4ade80;

            background: rgba(34, 197, 94, 0.07);

            border-color: rgba(74, 222, 128, 0.30);
        }


        /* MEDIUM */

        .risk.medium {

            color: #facc15;

            background: rgba(250, 204, 21, 0.07);

            border-color: rgba(250, 204, 21, 0.30);
        }


        /* HIGH */

        .risk.high {

            color: #fb7185;

            background: rgba(244, 63, 94, 0.07);

            border-color: rgba(251, 113, 133, 0.35);

            box-shadow:
                0 0 18px rgba(244, 63, 94, 0.08);
        }


        /* INFORMATION CARDS */

        .information {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 18px;

            margin-bottom: 28px;
        }


        .info-card {

            padding: 21px;

            background: rgba(2, 9, 16, 0.65);

            border-radius: 12px;

            border: 1px solid rgba(148, 163, 184, 0.12);
        }


        .info-card.warning {

            border-top: 2px solid #f97316;
        }


        .info-card.recommendation {

            border-top: 2px solid #38d9ff;
        }


        .info-card h2 {

            font-size: 16px;

            margin-bottom: 13px;
        }


        .warning-heading {

            color: #fb923c;
        }


        .recommendation-heading {

            color: #38d9ff;
        }


        .info-card p {

            color: #c1d2db;

            font-size: 14px;

            line-height: 1.75;
        }


        /* BUTTONS */

        .actions {

            display: flex;

            gap: 12px;
        }


        .button {

            flex: 1;

            padding: 14px;

            text-align: center;

            text-decoration: none;

            border-radius: 9px;

            font-size: 14px;

            font-weight: bold;

            transition: 0.25s;
        }


        .analyze-button {

            color: #021019;

            background: #38d9ff;

            box-shadow:
                0 5px 20px rgba(56, 217, 255, 0.16);
        }


        .home-button {

            color: #b8cbd5;

            background: rgba(20, 34, 46, 0.80);

            border: 1px solid rgba(148, 163, 184, 0.18);
        }


        .button:hover {

            transform: translateY(-2px);
        }


        .analyze-button:hover {

            background: #62e2ff;

            box-shadow:
                0 8px 25px rgba(56, 217, 255, 0.28);
        }


        .home-button:hover {

            color: #38d9ff;

            border-color: rgba(56, 217, 255, 0.35);
        }


        /* FOOTER */

        .footer {

            text-align: center;

            margin-top: 22px;

            color: #526876;

            font-size: 12px;
        }


        /* MOBILE */

        @media (max-width: 700px) {

            .container {
                width: 94%;
                margin: 25px auto;
            }

            .result-box {
                padding: 22px;
            }

            .score-area {
                flex-direction: column;
                text-align: center;
            }

            .score-description {
                max-width: 100%;
            }

            .information {
                grid-template-columns: 1fr;
            }

            .actions {
                flex-direction: column;
            }

            .page-header h1 {
                font-size: 26px;
            }
        }

    </style>

</head>


<body>


    <!-- NAVIGATION -->

    <nav>

        <div class="logo">
            🛡️ ScamSight
        </div>

    </nav>


    <!-- MAIN -->

    <div class="container">


        <!-- HEADER -->

        <div class="page-header">

            <div class="icon">
                🔎
            </div>

            <h1>
                URL Security Analysis
            </h1>

            <p>
                Security assessment completed successfully
            </p>

        </div>


        <!-- RESULT CARD -->

        <div class="result-box">


            <!-- URL -->

            <div class="section-label">
                🌐 Analyzed URL
            </div>

            <div class="url">
                ${url}
            </div>


            <!-- SCORE -->

            <div class="score-area">


                <div class="score-circle">

                    <div class="score-number">
                        ${riskScore}
                    </div>

                    <div class="score-out">
                        / 100
                    </div>

                </div>


                <div class="score-description">

                    <h2>
                        Risk Score
                    </h2>

                    <p>
                        This score is based on detected URL
                        characteristics such as HTTPS usage,
                        IP addresses, suspicious keywords,
                        unusual length, subdomains and
                        other structural indicators.
                    </p>

                </div>


            </div>


            <!-- RISK LEVEL -->

            <div class="risk ${riskClass}">
                ${riskLevel}
            </div>


            <!-- INFORMATION -->

            <div class="information">


                <!-- WARNINGS -->

                <div class="info-card warning">

                    <h2 class="warning-heading">
                        ⚠️ Warning Signs
                    </h2>

                    <p>
                        ${warnings}
                    </p>

                </div>


                <!-- RECOMMENDATION -->

                <div class="info-card recommendation">

                    <h2 class="recommendation-heading">
                        💡 Security Recommendation
                    </h2>

                    <p>
                        ${recommendation}
                    </p>

                </div>


            </div>


            <!-- ACTION BUTTONS -->

            <div class="actions">


                <a
                    class="button analyze-button"
                    href="${pageContext.request.contextPath}/analyze-url.jsp">

                    🔄 Analyze Another URL

                </a>


                <a
                    class="button home-button"
                    href="${pageContext.request.contextPath}/">

                    🏠 Back to Home

                </a>


            </div>


        </div>


        <div class="footer">

            ScamSight • See the Risk Before You Click

        </div>


    </div>


</body>

</html>