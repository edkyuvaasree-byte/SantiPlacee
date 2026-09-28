
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer - Login</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    min-height: 100vh;

    font-family:
        "Segoe UI",
        Arial,
        sans-serif;

    display: flex;

    align-items: center;

    justify-content: center;

    color: white;

    background:
        radial-gradient(
            circle at 15% 20%,
            rgba(126,34,206,0.30),
            transparent 35%
        ),

        radial-gradient(
            circle at 85% 80%,
            rgba(236,72,153,0.20),
            transparent 35%
        ),

        #0d0b14;

    overflow: hidden;
}


/* ================= BACKGROUND ================= */

.background-circle {

    position: fixed;

    border-radius: 50%;

    pointer-events: none;

    opacity: 0.4;

    filter: blur(2px);
}

.circle-one {

    width: 260px;

    height: 260px;

    background:
        rgba(168,85,247,0.12);

    top: -90px;

    left: -90px;
}

.circle-two {

    width: 320px;

    height: 320px;

    background:
        rgba(236,72,153,0.10);

    right: -120px;

    bottom: -120px;
}


/* ================= LOGIN CONTAINER ================= */

.login-container {

    width: 900px;

    max-width: 92%;

    min-height: 540px;

    display: grid;

    grid-template-columns:
        1fr 1fr;

    border-radius: 25px;

    overflow: hidden;

    background:
        rgba(255,255,255,0.045);

    border:
        1px solid rgba(255,255,255,0.10);

    box-shadow:
        0 25px 80px rgba(0,0,0,0.45);

    backdrop-filter:
        blur(20px);
}


/* ================= LEFT ================= */

.left-panel {

    padding: 50px;

    display: flex;

    flex-direction: column;

    justify-content: center;

    background:
        linear-gradient(
            145deg,
            rgba(126,34,206,0.16),
            rgba(236,72,153,0.07)
        );

    border-right:
        1px solid rgba(255,255,255,0.07);
}

.brand {

    color: #f472b6;

    font-size: 30px;

    font-weight: 700;

    margin-bottom: 8px;
}

.brand-sub {

    color: #999;

    font-size: 13px;

    margin-bottom: 45px;
}

.welcome-icon {

    width: 90px;

    height: 90px;

    border-radius: 25px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 45px;

    margin-bottom: 25px;

    background:
        linear-gradient(
            135deg,
            rgba(236,72,153,0.20),
            rgba(126,34,206,0.18)
        );

    border:
        1px solid rgba(236,72,153,0.20);

    box-shadow:
        0 15px 35px
        rgba(236,72,153,0.10);
}

.left-panel h1 {

    font-size: 31px;

    line-height: 1.2;

    margin-bottom: 15px;
}

.left-panel p {

    color: #aaa;

    line-height: 1.7;

    font-size: 14px;

    max-width: 340px;
}


/* ================= RIGHT ================= */

.right-panel {

    padding: 50px;

    display: flex;

    flex-direction: column;

    justify-content: center;
}

.form-title {

    font-size: 28px;

    font-weight: 600;

    margin-bottom: 8px;
}

.form-subtitle {

    color: #888;

    font-size: 13px;

    margin-bottom: 30px;
}


/* ================= MESSAGE ================= */

.message {

    padding: 11px 13px;

    border-radius: 9px;

    margin-bottom: 18px;

    font-size: 12px;

    text-align: center;
}

.success {

    color: #86efac;

    background:
        rgba(34,197,94,0.10);

    border:
        1px solid rgba(34,197,94,0.18);
}

.error {

    color: #fca5a5;

    background:
        rgba(239,68,68,0.10);

    border:
        1px solid rgba(239,68,68,0.18);
}


/* ================= FORM ================= */

.form-group {

    margin-bottom: 20px;
}

.form-group label {

    display: block;

    color: #c8c1d0;

    font-size: 13px;

    margin-bottom: 8px;
}

.form-group input {

    width: 100%;

    padding: 14px 15px;

    border-radius: 11px;

    border:
        1px solid rgba(255,255,255,0.10);

    background:
        rgba(0,0,0,0.22);

    color: white;

    outline: none;

    font-size: 14px;

    transition: 0.3s;
}

.form-group input::placeholder {

    color: #666;
}

.form-group input:focus {

    border-color: #ec4899;

    box-shadow:
        0 0 15px
        rgba(236,72,153,0.12);
}


/* ================= LOGIN BUTTON ================= */

.login-btn {

    width: 100%;

    padding: 14px;

    margin-top: 5px;

    border: none;

    border-radius: 11px;

    background:
        linear-gradient(
            135deg,
            #7e22ce,
            #db2777,
            #ec4899
        );

    color: white;

    font-size: 14px;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

.login-btn:hover {

    transform:
        translateY(-2px);

    box-shadow:
        0 10px 25px
        rgba(236,72,153,0.25);
}


/* ================= SIGNUP ================= */

.signup-text {

    text-align: center;

    color: #888;

    font-size: 13px;

    margin-top: 23px;
}

.signup-text a {

    color: #f472b6;

    text-decoration: none;

    font-weight: 600;
}

.signup-text a:hover {

    color: #f9a8d4;
}


/* ================= SECURITY ================= */

.security-note {

    margin-top: 25px;

    padding: 11px;

    border-radius: 9px;

    background:
        rgba(255,255,255,0.03);

    border:
        1px solid rgba(255,255,255,0.06);

    color: #777;

    font-size: 11px;

    text-align: center;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 750px) {

    .login-container {

        grid-template-columns: 1fr;

        max-width: 450px;
    }

    .left-panel {

        display: none;
    }

    .right-panel {

        padding: 40px 30px;
    }
}

</style>

</head>


<body>


<div class="background-circle circle-one"></div>

<div class="background-circle circle-two"></div>


<!-- ================= LOGIN CONTAINER ================= -->

<div class="login-container">


    <!-- ================= LEFT PANEL ================= -->

    <div class="left-panel">

        <div class="brand">
            SantiHer
        </div>

        <div class="brand-sub">
            Smart Restroom Hygiene Management
        </div>


        <div class="welcome-icon">
            🩷
        </div>


        <h1>
            Welcome<br>
            Back!
        </h1>


        <p>
            Sign in to monitor restroom cleanliness,
            water availability, supplies, reported issues
            and sanitary pad facilities across your campus.
        </p>

    </div>



    <!-- ================= RIGHT PANEL ================= -->

    <div class="right-panel">


        <div class="form-title">
            Welcome Back
        </div>


        <div class="form-subtitle">
            Sign in to continue to SantiHer.
        </div>


        <%

        String signup =
            request.getParameter("signup");

        String error =
            request.getParameter("error");


        if ("success".equals(signup)) {

        %>

            <div class="message success">

                ✓ Account created successfully.
                Please login.

            </div>

        <%

        }


        if ("invalid".equals(error)) {

        %>

            <div class="message error">

                ✕ Invalid email or password.

            </div>

        <%

        }


        if ("empty".equals(error)) {

        %>

            <div class="message error">

                ✕ Please enter your email and password.

            </div>

        <%

        }

        %>



        <!-- ================= LOGIN FORM ================= -->

        <form
            action="LoginServlet"
            method="post">


            <!-- EMAIL -->

            <div class="form-group">

                <label>
                    Email Address
                </label>

                <input
                    type="email"
                    name="email"
                    placeholder="Enter your email address"
                    required>

            </div>



            <!-- PASSWORD -->

            <div class="form-group">

                <label>
                    Password
                </label>

                <input
                    type="password"
                    name="password"
                    placeholder="Enter your password"
                    required>

            </div>



            <!-- LOGIN -->

            <button
                type="submit"
                class="login-btn">

                Login to SantiHer

            </button>


        </form>



        <!-- ================= SIGNUP ================= -->

        <div class="signup-text">

            Don't have an account?

            <a href="signup.jsp">
                Create Account
            </a>

        </div>



        <!-- ================= SECURITY ================= -->

        <div class="security-note">

            🔒 Secure access to SantiHer monitoring system.

        </div>


    </div>


</div>


</body>

</html>

