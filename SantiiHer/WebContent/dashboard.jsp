
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0">

<title>SantiHer - Dashboard</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    font-family: "Segoe UI", Arial, sans-serif;

    background:
        radial-gradient(
            circle at top right,
            rgba(135, 70, 180, 0.25),
            transparent 35%
        ),
        radial-gradient(
            circle at bottom left,
            rgba(236, 72, 153, 0.12),
            transparent 35%
        ),
        #0d0b14;

    color: #ffffff;

    min-height: 100vh;
}


/* ================= SIDEBAR ================= */

.sidebar {

    position: fixed;

    left: 0;
    top: 0;

    width: 250px;
    height: 100vh;

    background:
        linear-gradient(
            180deg,
            #171124,
            #0f0c18
        );

    border-right:
        1px solid
        rgba(255,255,255,0.08);

    padding: 28px 18px;

    box-shadow:
        8px 0 30px
        rgba(0,0,0,0.35);

    z-index: 10;
}


/* BRAND */

.brand {

    text-align: center;

    margin-bottom: 35px;
}

.brand h1 {

    font-size: 28px;

    letter-spacing: 1px;

    background:
        linear-gradient(
            90deg,
            #f472b6,
            #c084fc,
            #818cf8
        );

    -webkit-background-clip: text;

    -webkit-text-fill-color:
        transparent;
}

.brand p {

    margin-top: 6px;

    font-size: 11px;

    color: #a9a1b8;

    letter-spacing: 1px;
}


/* NAVIGATION */

.nav {

    display: flex;

    flex-direction: column;

    gap: 8px;
}

.nav a {

    text-decoration: none;

    color: #c8c1d4;

    padding: 13px 15px;

    border-radius: 12px;

    font-size: 14px;

    transition:
        all 0.3s ease;

    border:
        1px solid transparent;
}

.nav a:hover {

    color: #ffffff;

    background:
        rgba(192,132,252,0.12);

    border-color:
        rgba(192,132,252,0.2);

    transform:
        translateX(4px);
}


/* ACTIVE */

.nav a.active {

    color: #ffffff;

    background:
        linear-gradient(
            90deg,
            rgba(168,85,247,0.3),
            rgba(236,72,153,0.12)
        );

    border:
        1px solid
        rgba(192,132,252,0.25);
}


/* LOGOUT */

.logout-link {

    margin-top: 22px;

    border-top:
        1px solid
        rgba(255,255,255,0.1) !important;

    padding-top: 20px !important;

    color: #ff8fb1 !important;
}

.logout-link:hover {

    color: #ffffff !important;

    background:
        rgba(255,105,150,0.15) !important;
}


/* ================= MAIN ================= */

.main {

    margin-left: 250px;

    padding: 35px 40px;

    min-height: 100vh;
}


/* HEADER */

.header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 35px;
}

.header h2 {

    font-size: 30px;

    font-weight: 600;
}

.header p {

    margin-top: 6px;

    color: #9f96ad;

    font-size: 14px;
}


/* USER */

.user-box {

    padding: 11px 18px;

    border-radius: 30px;

    background:
        rgba(255,255,255,0.05);

    border:
        1px solid
        rgba(255,255,255,0.08);

    color: #d8d0df;

    font-size: 13px;
}


/* ================= STAT CARDS ================= */

.stats {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 25px;
}

.card {

    padding: 25px;

    border-radius: 20px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,0.07),
            rgba(255,255,255,0.025)
        );

    border:
        1px solid
        rgba(255,255,255,0.08);

    box-shadow:
        0 15px 35px
        rgba(0,0,0,0.2);

    transition:
        transform 0.3s ease,
        border 0.3s ease;
}

.card:hover {

    transform:
        translateY(-5px);

    border-color:
        rgba(192,132,252,0.3);
}

.card-title {

    color: #aaa1b6;

    font-size: 13px;

    margin-bottom: 12px;
}

.card-value {

    font-size: 32px;

    font-weight: 700;

    background:
        linear-gradient(
            90deg,
            #f472b6,
            #c084fc
        );

    -webkit-background-clip: text;

    -webkit-text-fill-color:
        transparent;
}

.card-info {

    margin-top: 8px;

    color: #81788e;

    font-size: 12px;
}


/* ================= CONTENT GRID ================= */

.content-grid {

    display: grid;

    grid-template-columns:
        1.4fr 1fr;

    gap: 22px;

    margin-bottom: 25px;
}


/* PANEL */

.panel {

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,0.065),
            rgba(255,255,255,0.02)
        );

    border:
        1px solid
        rgba(255,255,255,0.08);

    border-radius: 22px;

    padding: 25px;

    box-shadow:
        0 15px 35px
        rgba(0,0,0,0.2);
}

.panel h3 {

    font-size: 18px;

    margin-bottom: 22px;
}


/* ================= HYGIENE SCORE ================= */

.hygiene {

    display: flex;

    align-items: center;

    gap: 30px;
}

.circle {

    width: 145px;

    height: 145px;

    border-radius: 50%;

    background:
        conic-gradient(
            #c084fc
            <%= request.getAttribute("hygieneScore") != null
                ? ((Integer)request.getAttribute("hygieneScore") * 3.6)
                : 0 %>deg,
            #2b2436 0deg
        );

    display: flex;

    justify-content: center;

    align-items: center;

    position: relative;
}

.circle::before {

    content: "";

    position: absolute;

    width: 112px;

    height: 112px;

    border-radius: 50%;

    background:
        #12101a;
}

.circle span {

    position: relative;

    z-index: 2;

    font-size: 28px;

    font-weight: 700;
}

.hygiene-info p {

    margin-bottom: 10px;

    color: #aaa1b6;

    font-size: 13px;
}


/* ================= STATUS ================= */

.status-row {

    display: flex;

    justify-content: space-between;

    align-items: center;

    padding: 15px 0;

    border-bottom:
        1px solid
        rgba(255,255,255,0.06);
}

.status-row:last-child {

    border-bottom: none;
}

.status-name {

    color: #cfc7d8;

    font-size: 14px;
}

.status-number {

    font-size: 18px;

    font-weight: 600;
}

.green {

    color: #4ade80;
}

.orange {

    color: #fbbf24;
}

.red {

    color: #fb7185;
}


/* ================= PADS ================= */

.pad-grid {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 15px;
}

.pad-card {

    padding: 18px;

    border-radius: 15px;

    background:
        rgba(255,255,255,0.035);

    border:
        1px solid
        rgba(255,255,255,0.06);
}

.pad-icon {

    font-size: 25px;

    margin-bottom: 8px;
}

.pad-card h4 {

    font-size: 14px;

    margin-bottom: 6px;
}

.pad-card p {

    color: #9d94a8;

    font-size: 12px;
}


/* ================= QUICK ACCESS ================= */

.quick-grid {

    display: grid;

    grid-template-columns:
        repeat(3, 1fr);

    gap: 15px;
}

.quick-btn {

    text-decoration: none;

    color: #ddd6e5;

    padding: 18px;

    border-radius: 15px;

    background:
        rgba(255,255,255,0.04);

    border:
        1px solid
        rgba(255,255,255,0.07);

    transition:
        all 0.3s ease;

    text-align: center;

    font-size: 13px;
}

.quick-btn:hover {

    background:
        rgba(192,132,252,0.12);

    transform:
        translateY(-3px);

    color: white;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 1100px) {

    .stats {

        grid-template-columns:
            repeat(2, 1fr);
    }

    .content-grid {

        grid-template-columns:
            1fr;
    }
}

@media(max-width: 750px) {

    .sidebar {

        position: relative;

        width: 100%;

        height: auto;
    }

    .main {

        margin-left: 0;

        padding: 25px;
    }

    .stats {

        grid-template-columns:
            1fr;
    }

    .pad-grid {

        grid-template-columns:
            1fr;
    }

    .quick-grid {

        grid-template-columns:
            1fr;
    }

    .header {

        flex-direction: column;

        align-items: flex-start;

        gap: 15px;
    }
}

</style>

</head>


<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="brand">

        <h1>SantiHer</h1>

        <p>
            SMART RESTROOM HYGIENE
        </p>

    </div>


    <div class="nav">

        <a href="DashboardServlet"
           class="active">
            🏠 Dashboard
        </a>

        <a href="RestroomServlet">
            🚻 Restrooms
        </a>

        <a href="CleanlinessServlet">
            🧹 Cleanliness
        </a>

        <a href="IssueServlet">
            ⚠ Issues
        </a>

        <a href="SupplyServlet">
            🧴 Supplies
        </a>

        <a href="WaterLevelServlet">
            💧 Water Level
        </a>

        <a href="SanitaryPadServlet">
            🩷 Sanitary Pad Availability
        </a>

        <!-- LOGOUT -->

        <a href="LogoutServlet"
           class="logout-link">
            🚪 Logout
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="main">


    <!-- HEADER -->

    <div class="header">

        <div>

            <h2>
                SantiHer Dashboard
            </h2>

            <p>
                Smart monitoring for cleaner,
                safer and healthier college restrooms.
            </p>

        </div>


        <div class="user-box">

            👤

            <%
                Object userName =
                    session.getAttribute("full_name");

                if (userName != null) {
            %>

                <%= userName %>

            <%
                } else {
            %>

                SantiHer User

            <%
                }
            %>

        </div>

    </div>



    <!-- ================= STAT CARDS ================= -->

    <div class="stats">


        <!-- TOTAL RESTROOMS -->

        <div class="card">

            <div class="card-title">
                TOTAL RESTROOMS
            </div>

            <div class="card-value">

                <%= request.getAttribute("totalRestrooms") != null
                    ? request.getAttribute("totalRestrooms")
                    : 0 %>

            </div>

            <div class="card-info">
                Registered college restrooms
            </div>

        </div>


        <!-- CLEAN -->

        <div class="card">

            <div class="card-title">
                CLEAN & READY
            </div>

            <div class="card-value">

                <%= request.getAttribute("cleanRestrooms") != null
                    ? request.getAttribute("cleanRestrooms")
                    : 0 %>

            </div>

            <div class="card-info green">
                Currently clean
            </div>

        </div>


        <!-- ATTENTION -->

        <div class="card">

            <div class="card-title">
                NEEDS ATTENTION
            </div>

            <div class="card-value">

                <%= request.getAttribute("attentionRestrooms") != null
                    ? request.getAttribute("attentionRestrooms")
                    : 0 %>

            </div>

            <div class="card-info orange">
                Requires cleaning
            </div>

        </div>


        <!-- PADS -->

        <div class="card">

            <div class="card-title">
                AVAILABLE PADS
            </div>

            <div class="card-value">

                <%= request.getAttribute("totalPads") != null
                    ? request.getAttribute("totalPads")
                    : 0 %>

            </div>

            <div class="card-info">
                Sanitary pads in stock
            </div>

        </div>

    </div>



    <!-- ================= CONTENT ================= -->

    <div class="content-grid">


        <!-- HYGIENE SCORE -->

        <div class="panel">

            <h3>
                Overall Hygiene Status
            </h3>


            <div class="hygiene">


                <div class="circle">

                    <span>

                        <%= request.getAttribute("hygieneScore") != null
                            ? request.getAttribute("hygieneScore")
                            : 0 %>%

                    </span>

                </div>


                <div class="hygiene-info">

                    <p>
                        This score is calculated based on
                        restrooms currently marked as
                        <strong>Clean</strong>.
                    </p>

                    <p>
                        Monitor cleanliness regularly to
                        maintain a healthy restroom
                        environment.
                    </p>

                </div>

            </div>

        </div>



        <!-- RESTROOM STATUS -->

        <div class="panel">

            <h3>
                Restroom Status
            </h3>


            <div class="status-row">

                <span class="status-name">
                    Clean & Ready
                </span>

                <span class="status-number green">

                    <%= request.getAttribute("cleanRestrooms") != null
                        ? request.getAttribute("cleanRestrooms")
                        : 0 %>

                </span>

            </div>


            <div class="status-row">

                <span class="status-name">
                    Needs Attention
                </span>

                <span class="status-number orange">

                    <%= request.getAttribute("attentionRestrooms") != null
                        ? request.getAttribute("attentionRestrooms")
                        : 0 %>

                </span>

            </div>


            <div class="status-row">

                <span class="status-name">
                    Open Issues
                </span>

                <span class="status-number red">

                    <%= request.getAttribute("openIssues") != null
                        ? request.getAttribute("openIssues")
                        : 0 %>

                </span>

            </div>

        </div>

    </div>



    <!-- ================= SANITARY PADS ================= -->

    <div class="panel"
         style="margin-bottom:25px;">

        <h3>
            🩷 Sanitary Pad Availability
        </h3>


        <div class="pad-grid">


            <div class="pad-card">

                <div class="pad-icon">
                    🩷
                </div>

                <h4>
                    Total Pads
                </h4>

                <p>

                    <strong>

                        <%= request.getAttribute("totalPads") != null
                            ? request.getAttribute("totalPads")
                            : 0 %>

                    </strong>

                    pads available across
                    registered restrooms.

                </p>

            </div>



            <div class="pad-card">

                <div class="pad-icon">
                    ⚠️
                </div>

                <h4>
                    Low Stock Locations
                </h4>

                <p>

                    <strong class="orange">

                        <%= request.getAttribute("lowPadLocations") != null
                            ? request.getAttribute("lowPadLocations")
                            : 0 %>

                    </strong>

                    restroom locations
                    need replenishment.

                </p>

            </div>



            <div class="pad-card">

                <div class="pad-icon">
                    🚨
                </div>

                <h4>
                    Out of Stock
                </h4>

                <p>

                    <strong class="red">

                        <%= request.getAttribute("outOfStockPads") != null
                            ? request.getAttribute("outOfStockPads")
                            : 0 %>

                    </strong>

                    locations currently
                    have no pads.

                </p>

            </div>


        </div>

    </div>



    <!-- ================= QUICK ACCESS ================= -->

    <div class="panel">

        <h3>
            Quick Access
        </h3>


        <div class="quick-grid">


            <a href="RestroomServlet"
               class="quick-btn">

                🚻

                <br><br>

                Manage Restrooms

            </a>


            <a href="CleanlinessServlet"
               class="quick-btn">

                🧹

                <br><br>

                Track Cleanliness

            </a>


            <a href="IssueServlet"
               class="quick-btn">

                ⚠

                <br><br>

                Manage Issues

            </a>


            <a href="SupplyServlet"
               class="quick-btn">

                🧴

                <br><br>

                Check Supplies

            </a>


            <a href="WaterLevelServlet"
               class="quick-btn">

                💧

                <br><br>

                Track Water Level

            </a>


            <a href="SanitaryPadServlet"
               class="quick-btn">

                🩷

                <br><br>

                Check Pad Availability

            </a>


        </div>

    </div>


</div>


</body>

</html>

