
<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Analyze URL - ScamSight</title>

    <!-- Common ScamSight CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scamsight.css">

    <style>

        /* URL Analyzer Page */

        .box {
            max-width: 800px;
            margin: 70px auto;
            padding: 40px;

            background: rgba(5, 15, 25, 0.90);

            border: 1px solid rgba(56, 217, 255, 0.20);

            border-radius: 18px;

            box-shadow:
                0 20px 60px rgba(0, 0, 0, 0.55),
                0 0 30px rgba(56, 217, 255, 0.06);

            backdrop-filter: blur(12px);
        }


        .box h1 {
            text-align: center;

            margin-bottom: 15px;

            color: #eafaff;
        }


        .description {
            text-align: center;

            color: #9db3c1;

            line-height: 1.7;

            margin-bottom: 30px;
        }


        .box label {
            color: #b9d3df;

            margin-bottom: 8px;
        }


        .box input {
            width: 100%;

            padding: 15px;

            margin-bottom: 20px;

            background: rgba(2, 9, 16, 0.85);

            color: #eafaff;

            border: 1px solid rgba(56, 217, 255, 0.18);

            border-radius: 8px;

            font-size: 16px;

            outline: none;
        }


        .box input::placeholder {
            color: #637987;
        }


        .box input:focus {
            border-color: #38d9ff;

            box-shadow:
                0 0 0 3px rgba(56, 217, 255, 0.08),
                0 0 15px rgba(56, 217, 255, 0.08);
        }


        .box button {
            width: 100%;

            padding: 15px;

            background: #38d9ff;

            color: #021019;

            border: none;

            border-radius: 8px;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: all 0.25s ease;
        }


        .box button:hover {
            background: #63e3ff;

            transform: translateY(-2px);

            box-shadow:
                0 8px 22px rgba(56, 217, 255, 0.22);
        }


        .back {
            display: block;

            text-align: center;

            margin-top: 20px;

            color: #38d9ff;

            font-size: 14px;

            font-weight: bold;

            transition: all 0.25s ease;
        }


        .back:hover {
            color: #63e3ff;
        }


        /* Mobile */

        @media (max-width: 700px) {

            .box {
                width: 94%;

                margin: 30px auto;

                padding: 25px;
            }

            .box h1 {
                font-size: 26px;
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

        <div class="box">

            <h1>
                🔗 Analyze a URL
            </h1>


            <p class="description">
                Enter a suspicious website URL to check for
                possible scam and phishing indicators.
            </p>


            <form action="analyze-url" method="post">

                <label for="url">
                    Website URL
                </label>


                <input
                    type="text"
                    id="url"
                    name="url"
                    placeholder="https://example.com"
                    required
                >


                <button type="submit">
                    Analyze URL
                </button>

            </form>


            <a class="back" href="index.jsp">
                ← Back to Home
            </a>

        </div>

    </div>

</body>

</html>

