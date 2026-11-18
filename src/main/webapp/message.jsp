```jsp
<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>ScamSight - Message Analyzer</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scamsight.css">

    <style>

        .message-page {
            min-height: 80vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 50px 20px;
        }

        .message-card {
            width: 100%;
            max-width: 850px;

            padding: 40px;

            background: rgba(5, 15, 25, 0.92);

            border: 1px solid rgba(56, 217, 255, 0.20);

            border-radius: 18px;

            box-shadow:
                0 20px 60px rgba(0, 0, 0, 0.55),
                0 0 30px rgba(56, 217, 255, 0.06);

            backdrop-filter: blur(12px);
        }

        .message-card h1 {
            text-align: center;
            color: #eafaff;
            margin-bottom: 12px;
            font-size: 32px;
        }

        .message-card .description {
            text-align: center;
            color: #aebfc8;
            line-height: 1.7;
            margin-bottom: 30px;
        }

        .message-label {
            display: block;
            color: #38d9ff;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        #message {
            width: 100%;
            min-height: 250px;

            padding: 18px;

            background: rgba(2, 9, 16, 0.90);

            color: #eafaff;

            border: 1px solid rgba(56, 217, 255, 0.25);

            border-radius: 10px;

            font-family: Arial, Helvetica, sans-serif;

            font-size: 16px;

            line-height: 1.6;

            resize: vertical;

            outline: none;

            display: block;

            cursor: text;

            pointer-events: auto;
        }

        #message::placeholder {
            color: #71838c;
        }

        #message:focus {
            border-color: #38d9ff;

            box-shadow:
                0 0 0 2px rgba(56, 217, 255, 0.10),
                0 0 20px rgba(56, 217, 255, 0.08);
        }

        .analyze-button {
            width: 100%;

            margin-top: 20px;

            padding: 15px;

            border: none;

            border-radius: 9px;

            background: #38d9ff;

            color: #021019;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: all 0.25s ease;
        }

        .analyze-button:hover {
            background: #63e3ff;

            transform: translateY(-2px);

            box-shadow:
                0 8px 22px rgba(56, 217, 255, 0.22);
        }

        .back-link {
            display: block;

            text-align: center;

            margin-top: 20px;

            color: #9eb5bf;

            font-size: 14px;
        }

        .back-link:hover {
            color: #38d9ff;
        }

        .example-box {
            margin-top: 25px;

            padding: 18px;

            background: rgba(56, 217, 255, 0.04);

            border: 1px solid rgba(56, 217, 255, 0.12);

            border-radius: 10px;
        }

        .example-box strong {
            color: #38d9ff;
        }

        .example-box p {
            margin-top: 8px;

            color: #aebfc8;

            line-height: 1.6;

            font-size: 14px;
        }

        @media (max-width: 700px) {

            .message-page {
                padding: 25px 15px;
            }

            .message-card {
                padding: 25px 20px;
            }

            .message-card h1 {
                font-size: 26px;
            }

            #message {
                min-height: 220px;
            }
        }

    </style>

</head>


<body>

    <!-- Navigation -->

    <nav>

        <div class="logo">
            🔍 ScamSight
        </div>

    </nav>


    <!-- Main Content -->

    <main class="message-page">

        <div class="message-card">

            <h1>
                💬 Message Analyzer
            </h1>

            <p class="description">
                Paste or type a suspicious SMS, email, WhatsApp message,
                or other message below. ScamSight will analyze it and
                identify possible scam indicators.
            </p>


            <!-- Message Form -->

            <form action="${pageContext.request.contextPath}/analyze-message"
                  method="post">

                <label class="message-label"
                       for="message">

                    Enter Your Message

                </label>


                <textarea
                    id="message"
                    name="message"
                    placeholder="Type or paste your suspicious message here..."
                    required></textarea>


                <button
                    type="submit"
                    class="analyze-button">

                    🔎 Analyze Message

                </button>

            </form>


            <!-- Example -->

            <div class="example-box">

                <strong>Example:</strong>

                <p>
                    "URGENT! Your bank account has been blocked.
                    Verify your account immediately by clicking this link
                    and enter your OTP."
                </p>

            </div>


            <!-- Back -->

            <a class="back-link"
               href="${pageContext.request.contextPath}/">

                ← Back to Home

            </a>

        </div>

    </main>

</body>

</html>
```
