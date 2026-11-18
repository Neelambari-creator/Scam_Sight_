
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Login - ScamSight</title>

    <!-- Common ScamSight CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scamsight.css">

    <style>

        /* LOGIN PAGE */

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }


        /* LOGIN CARD */

        .login-container {
            width: 100%;
            max-width: 400px;

            padding: 38px 35px;

            background: rgba(3, 13, 23, 0.94);

            border: 1px solid rgba(56, 217, 255, 0.22);

            border-radius: 16px;

            text-align: center;

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.55),
                0 0 30px rgba(56, 217, 255, 0.06);

            backdrop-filter: blur(12px);
        }


        /* LOGO */

        .login-logo {
            font-size: 29px;

            font-weight: bold;

            color: #38d9ff;

            margin-bottom: 7px;

            letter-spacing: 0.3px;

            text-shadow:
                0 0 12px rgba(56, 217, 255, 0.30);
        }


        /* TAGLINE */

        .tagline {
            color: #7f96a5;

            font-size: 13px;

            margin-bottom: 30px;
        }


        /* TITLE */

        .login-title {
            color: #eafaff;

            font-size: 23px;

            margin-bottom: 25px;
        }


        /* ERROR */

        .login-error {
            padding: 11px 13px;

            margin-bottom: 18px;

            border-radius: 7px;

            background: rgba(244, 63, 94, 0.08);

            border: 1px solid rgba(251, 113, 133, 0.25);

            color: #fb7185;

            font-size: 13px;
        }


        /* INPUT GROUP */

        .input-group {
            text-align: left;

            margin-bottom: 17px;
        }


        .input-group label {
            display: block;

            margin-bottom: 7px;

            color: #b8ccd6;

            font-size: 13px;

            font-weight: 600;
        }


        /* INPUT */

        .input-box {
            width: 100%;

            padding: 13px 14px;

            margin: 0;

            border: 1px solid rgba(148, 163, 184, 0.20);

            border-radius: 8px;

            outline: none;

            background: rgba(1, 8, 15, 0.85);

            color: #eafaff;

            font-size: 14px;

            transition: 0.25s ease;
        }


        .input-box::placeholder {
            color: #566c79;
        }


        .input-box:focus {
            border-color: #38d9ff;

            box-shadow:
                0 0 0 3px rgba(56, 217, 255, 0.07);
        }


        /* LOGIN BUTTON */

        .login-btn {
            width: 100%;

            padding: 13px;

            margin-top: 5px;

            border: none;

            border-radius: 8px;

            background: #38d9ff;

            color: #021019;

            font-size: 14px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.25s ease;
        }


        .login-btn:hover {
            background: #62e2ff;

            transform: translateY(-1px);

            box-shadow:
                0 7px 20px rgba(56, 217, 255, 0.20);
        }


        /* REGISTER */

        .register {
            margin-top: 23px;

            color: #718895;

            font-size: 13px;
        }


        .register a {
            color: #38d9ff;

            font-weight: bold;

            text-decoration: none;
        }


        .register a:hover {
            text-decoration: underline;
        }


        /* BACK HOME */

        .back {
            display: inline-block;

            margin-top: 20px;

            color: #687e8b;

            font-size: 13px;

            text-decoration: none;

            transition: 0.2s ease;
        }


        .back:hover {
            color: #38d9ff;
        }


        /* SECURITY NOTE */

        .security-note {
            margin-top: 25px;

            padding-top: 18px;

            border-top: 1px solid rgba(148, 163, 184, 0.10);

            color: #536875;

            font-size: 11px;

            line-height: 1.5;
        }


        /* MOBILE */

        @media (max-width: 500px) {

            body {
                padding: 18px;
            }

            .login-container {
                padding: 30px 23px;
            }

            .login-logo {
                font-size: 26px;
            }

        }

    </style>

</head>


<body>


    <div class="login-container">


        <!-- LOGO -->

        <div class="login-logo">
            🛡️ ScamSight
        </div>


        <!-- TAGLINE -->

        <div class="tagline">
            See the Risk Before You Click.
        </div>


        <!-- TITLE -->

        <h1 class="login-title">
            Welcome Back
        </h1>


        <!-- ERROR MESSAGE -->

        <% if (request.getAttribute("error") != null) { %>

            <div class="login-error">
                <%= request.getAttribute("error") %>
            </div>

        <% } %>


        <!-- LOGIN FORM -->

        <form action="${pageContext.request.contextPath}/login"
              method="post">


            <!-- EMAIL -->

            <div class="input-group">

                <label for="email">
                    Email Address
                </label>

                <input
                    type="email"
                    id="email"
                    name="email"
                    class="input-box"
                    placeholder="Enter your email"
                    autocomplete="email"
                    required
                >

            </div>


            <!-- PASSWORD -->

            <div class="input-group">

                <label for="password">
                    Password
                </label>

                <input
                    type="password"
                    id="password"
                    name="password"
                    class="input-box"
                    placeholder="Enter your password"
                    autocomplete="current-password"
                    required
                >

            </div>


            <!-- LOGIN -->

            <button
                type="submit"
                class="login-btn">

                Login

            </button>


        </form>


        <!-- REGISTER -->

        <div class="register">

            Don't have an account?

            <a href="${pageContext.request.contextPath}/register.jsp">
                Register
            </a>

        </div>


        <!-- BACK -->

        <a
            href="${pageContext.request.contextPath}/"
            class="back">

            ← Back to ScamSight

        </a>


        <!-- SECURITY NOTE -->

        <div class="security-note">

            🔒 Your credentials are securely processed by ScamSight.

        </div>


    </div>


</body>

</html>
