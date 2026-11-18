
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ScamSight - See the Risk Before You Click</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            color: white;

            background:
                linear-gradient(
                    rgba(0, 0, 0, 0.72),
                    rgba(0, 0, 0, 0.82)
                ),
                url("images/scammy.png");

            background-size: cover;
            background-position: center;
            background-attachment: fixed;

            min-height: 100vh;
        }

        /* NAVBAR */

        nav {
            height: 75px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 6%;

            background: rgba(0, 0, 0, 0.75);

            border-bottom: 1px solid rgba(255,255,255,0.15);
        }

        .logo {
            font-size: 27px;
            font-weight: bold;
        }

        .logo span {
            color: #ff3030;
        }

        .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .nav-links a:hover {
            color: #ff3030;
        }

        .login-btn {
            border: 1px solid #ff3030;
            padding: 10px 22px;
            border-radius: 7px;
        }

        .register-btn {
            background: #e52525;
            padding: 11px 22px;
            border-radius: 7px;
        }

        .register-btn:hover {
            color: white !important;
            background: #ff4040;
        }

        /* HERO */

        .hero {
            min-height: 620px;

            display: flex;
            align-items: center;

            padding: 70px 7%;
        }

        .hero-content {
            max-width: 700px;
        }

        .hero h1 {
            font-size: 58px;
            line-height: 1.1;
            margin-bottom: 20px;
        }

        .risk {
            color: #ff2929;
        }

        .hero p {
            font-size: 20px;
            line-height: 1.6;
            color: #dddddd;
            margin-bottom: 35px;
        }

        .buttons {
            display: flex;
            gap: 20px;
        }

        .primary-btn,
        .secondary-btn {
            padding: 16px 28px;
            border-radius: 8px;

            text-decoration: none;

            font-size: 17px;
            font-weight: bold;
        }

        .primary-btn {
            background: #e52525;
            color: white;
        }

        .primary-btn:hover {
            background: #ff3b3b;
        }

        .secondary-btn {
            background: rgba(40, 70, 110, 0.9);
            color: white;
        }

        .secondary-btn:hover {
            background: rgba(60, 95, 145, 0.95);
        }

        /* FEATURES */

        .features {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;

            padding: 30px 7% 70px;
        }

        .feature {
            background: rgba(10, 20, 30, 0.85);

            border: 1px solid rgba(255,255,255,0.12);

            border-radius: 12px;

            padding: 25px;

            min-height: 170px;
        }

        .feature h3 {
            margin-top: 0;
        }

        .feature p {
            color: #cccccc;
            line-height: 1.5;
        }

        .icon {
            font-size: 30px;
            margin-bottom: 10px;
        }

        /* FOOTER */

        footer {
            text-align: center;

            padding: 22px;

            background: rgba(0,0,0,0.85);

            color: #aaaaaa;
        }

        /* MOBILE */

        @media (max-width: 900px) {

            .nav-links {
                gap: 12px;
                font-size: 13px;
            }

            .hero h1 {
                font-size: 42px;
            }

            .features {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 600px) {

            nav {
                padding: 0 20px;
            }

            .nav-links a:nth-child(2),
            .nav-links a:nth-child(3),
            .nav-links a:nth-child(4),
            .nav-links a:nth-child(5) {
                display: none;
            }

            .hero {
                padding: 50px 25px;
            }

            .hero h1 {
                font-size: 38px;
            }

            .buttons {
                flex-direction: column;
            }

            .features {
                grid-template-columns: 1fr;
                padding: 20px 25px 50px;
            }

        }

    </style>

</head>

<body>

    <!-- NAVIGATION -->

    <nav>

        <div class="logo">
            🛡️ Scam<span>Sight</span>
        </div>

        <div class="nav-links">

            <a href="index.jsp">Home</a>

            <a href="analyze-url.jsp">
                Analyze URL
            </a>

            <a href="message.jsp">
                Analyze Message
            </a>

            <a href="scan-history">
                Scan History
            </a>

            <a href="login.jsp" class="login-btn">
                Login
            </a>

            <a href="register.jsp" class="register-btn">
                Register
            </a>

        </div>

    </nav>


    <!-- HERO SECTION -->

    <section class="hero">

        <div class="hero-content">

            <h1>
                SEE THE <span class="risk">RISK</span><br>
                BEFORE YOU CLICK.
            </h1>

            <p>
                ScamSight analyzes suspicious URLs and messages
                and explains the warning signs behind every
                risk assessment.
            </p>

            <div class="buttons">

                <a href="analyze-url.jsp"
                   class="primary-btn">
                    🔗 Analyze URL
                </a>

                <a href="message.jsp"
                   class="secondary-btn">
                    💬 Analyze Message
                </a>

            </div>

        </div>

    </section>


    <!-- FEATURES -->

    <section class="features">

        <div class="feature">

            <div class="icon">🛡️</div>

            <h3>
                Detect Scams
            </h3>

            <p>
                Identify suspicious patterns in URLs
                and online messages.
            </p>

        </div>


        <div class="feature">

            <div class="icon">🔍</div>

            <h3>
                Explain Risks
            </h3>

            <p>
                Understand why a URL or message
                may be dangerous.
            </p>

        </div>


        <div class="feature">

            <div class="icon">⚡</div>

            <h3>
                Instant Results
            </h3>

            <p>
                Get a risk score and warning signs
                within seconds.
            </p>

        </div>


        <div class="feature">

            <div class="icon">📊</div>

            <h3>
                Track History
            </h3>

            <p>
                View your previous scans and
                monitor suspicious activity.
            </p>

        </div>

    </section>


    <!-- FOOTER -->

    <footer>

        © 2026 ScamSight. All rights reserved.

    </footer>

</body>

</html>

