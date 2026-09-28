
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer - Create Account</title>

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


/* ================= BACKGROUND EFFECTS ================= */

.background-circle {

    position: fixed;

    border-radius: 50%;

    filter: blur(2px);

    pointer-events: none;

    opacity: 0.4;
}

.circle-one {

    width: 250px;
    height: 250px;

    background:
        rgba(168,85,247,0.12);

    top: -80px;
    left: -80px;
}

.circle-two {

    width: 300px;
    height: 300px;

    background:
        rgba(236,72,153,0.10);

    right: -100px;
    bottom: -100px;
}


/* ================= CONTAINER ================= */

.signup-container {

    width: 900px;

    max-width: 92%;

    min-height: 570px;

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


/* ================= LEFT SIDE ================= */

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
        0 15px 35px rgba(236,72,153,0.10);
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


/* ================= RIGHT SIDE ================= */

.right-panel {

    padding: 50px;

    display: flex;

    flex-direction: column;

    justify-content: center;
}

.form-title {

    font-size: 27px;

    font-weight: 600;

    margin-bottom: 8px;
}

.form-subtitle {

    color: #888;

    font-size: 13px;

    margin-bottom: 30px;
}


/* ================= FORM ================= */

.form-group {

    margin-bottom: 18px;
}

.form-group label {

    display: block;

    color: #c8c1d0;

    font-size: 13px;

    margin-bottom: 8px;
}

.form-group input {

    width: 100%;

    padding: 13px 15px;

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
        0 0 15px rgba(236,72,153,0.12);
}


/* ================= BUTTON ================= */

.signup-btn {

    width: 100%;

    padding: 14px;

    margin-top: 8px;

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

.signup-btn:hover {

    transform:
        translateY(-2px);

    box-shadow:
        0 10px 25px
        rgba(236,72,153,0.25);
}


/* ================= LOGIN LINK ================= */

.login-text {

    text-align: center;

    color: #888;

    font-size: 13px;

    margin-top: 22px;
}

.login-text a {

    color: #f472b6;

    text-decoration: none;

    font-weight: 600;
}

.login-text a:hover {

    color: #f9a8d4;
}


/* ================= SECURITY NOTE ================= */

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

    .signup-container {

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


<!-- ================= SIGNUP CONTAINER ================= -->

<div class="signup-container">


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
            Welcome to<br>
            SantiHer
        </h1>


        <p>
            Create your account and access a smart
            platform designed to monitor restroom
            cleanliness, water availability, supplies,
            issues and sanitary pad facilities.
        </p>

    </div>



    <!-- ================= RIGHT PANEL ================= -->

    <div class="right-panel">


        <div class="form-title">
            Create Account
        </div>


        <div class="form-subtitle">
            Enter your details to get started.
        </div>



        <!-- ================= SIGNUP FORM ================= -->

        <form
            action="SignupServlet"
            method="post">


            <!-- FULL NAME -->

            <div class="form-group">

                <label>
                    Full Name
                </label>

                <input
                    type="text"
                    name="full_name"
                    placeholder="Enter your full name"
                    required>

            </div>



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
                    placeholder="Create a password"
                    minlength="4"
                    required>

            </div>



            <!-- SUBMIT -->

            <button
                type="submit"
                class="signup-btn">

                Create Account

            </button>


        </form>



        <!-- LOGIN -->

        <div class="login-text">

            Already have an account?

            <a href="login.jsp">
                Login
            </a>

        </div>



        <!-- SECURITY -->

        <div class="security-note">

            🔒 Your account information is securely
            stored in the SantiHer database.

        </div>


    </div>


</div>


</body>

</html>
