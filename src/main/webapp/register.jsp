```jsp
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Register - ScamSight</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/scamsight.css">
</head>

<body>

    <div class="page-container">

        <div class="form-card">

            <h1>Create Your Account</h1>

            <p>
                Register to use ScamSight and analyze suspicious
                URLs and messages.
            </p>

            <% if (request.getAttribute("error") != null) { %>
                <div class="error-message">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/register"
                  method="post">

                <label for="name">Full Name</label>

                <input type="text"
                       id="name"
                       name="name"
                       placeholder="Enter your name"
                       required>


                <label for="email">Email</label>

                <input type="email"
                       id="email"
                       name="email"
                       placeholder="Enter your email"
                       required>


                <label for="password">Password</label>

                <input type="password"
                       id="password"
                       name="password"
                       placeholder="Create a password"
                       required>


                <button type="submit">
                    Create Account
                </button>

            </form>

            <p class="form-footer">
                Already have an account?
                <a href="${pageContext.request.contextPath}/login.jsp">
                    Login
                </a>
            </p>

            <a href="${pageContext.request.contextPath}/">
                ← Back to Home
            </a>

        </div>

    </div>

</body>
</html>
```
