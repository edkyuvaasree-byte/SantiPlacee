<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer - Water Level</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Arial, sans-serif;
}

body {

    background:
        radial-gradient(circle at top left, #35145f 0%, transparent 35%),
        radial-gradient(circle at bottom right, #24104a 0%, transparent 35%),
        #0d0b14;

    color: white;
    min-height: 100vh;
}


/* ================= SIDEBAR ================= */

.sidebar {

    position: fixed;
    left: 0;
    top: 0;

    width: 245px;
    height: 100vh;

    background: rgba(20, 15, 32, 0.96);

    border-right: 1px solid rgba(255,255,255,0.08);

    padding: 28px 18px;
}

.logo {

    text-align: center;
    margin-bottom: 35px;
}

.logo h1 {

    color: #d8a7ff;
    font-size: 28px;
}

.logo p {

    color: #999;
    font-size: 11px;
    margin-top: 6px;
}

.menu a {

    display: block;

    text-decoration: none;

    color: #bbb;

    padding: 13px 16px;

    margin: 6px 0;

    border-radius: 12px;

    font-size: 14px;

    transition: 0.3s;
}

.menu a:hover {

    background: rgba(157,78,221,0.15);
    color: white;
}

.menu a.active {

    background:
        linear-gradient(135deg,#7b2cbf,#9d4edd);

    color: white;

    box-shadow:
        0 8px 25px rgba(157,78,221,0.3);
}


/* ================= MAIN ================= */

.main {

    margin-left: 245px;

    padding: 35px;
}


/* ================= HEADER ================= */

.header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 25px;
}

.header h2 {

    font-size: 30px;
}

.header p {

    color: #aaa;

    margin-top: 6px;
}

.back-btn {

    text-decoration: none;

    color: white;

    padding: 11px 18px;

    border-radius: 10px;

    background: rgba(255,255,255,0.08);

    border: 1px solid rgba(255,255,255,0.1);
}

.back-btn:hover {

    background: rgba(157,78,221,0.25);
}


/* ================= INFO ================= */

.info-box {

    background: rgba(157,78,221,0.08);

    border: 1px solid rgba(157,78,221,0.2);

    border-radius: 15px;

    padding: 17px 20px;

    margin-bottom: 30px;

    color: #cfc5da;

    font-size: 14px;
}

.info-box strong {

    color: #d8a7ff;
}


/* ================= TANK GRID ================= */

.tank-grid {

    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(320px, 1fr));

    gap: 25px;
}


/* ================= CARD ================= */

.tank-card {

    background: rgba(255,255,255,0.055);

    border: 1px solid rgba(255,255,255,0.08);

    border-radius: 22px;

    padding: 25px;

    backdrop-filter: blur(15px);

    box-shadow:
        0 15px 40px rgba(0,0,0,0.25);

    transition: 0.3s;
}

.tank-card:hover {

    transform: translateY(-5px);

    border-color: rgba(190,120,255,0.4);
}


/* ================= RESTROOM NAME ================= */

.tank-title {

    font-size: 21px;

    font-weight: 600;
}

.tank-location {

    color: #999;

    font-size: 13px;

    margin-top: 5px;
}


/* ================= TANK ================= */

.tank-container {

    display: flex;

    justify-content: center;

    margin: 28px 0;
}

.tank {

    width: 155px;

    height: 250px;

    border: 4px solid #a855f7;

    border-radius: 22px 22px 30px 30px;

    position: relative;

    overflow: hidden;

    background:
        linear-gradient(
            rgba(255,255,255,0.04),
            rgba(0,0,0,0.25)
        );

    box-shadow:

        inset 0 0 25px rgba(0,0,0,0.6),

        0 0 30px rgba(168,85,247,0.20);
}


/* ================= BLUE WATER ================= */

.water {

    position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

    background:
        linear-gradient(
            to top,
            #005bea,
            #008cff,
            #38bdf8
        );

    transition:
        height 1s ease-in-out;

    box-shadow:
        0 -5px 25px rgba(0,150,255,0.65);
}


/* ================= WATER WAVE ================= */

.water::before {

    content: "";

    position: absolute;

    top: -10px;

    left: -10%;

    width: 120%;

    height: 20px;

    background: rgba(255,255,255,0.30);

    border-radius: 50%;

    animation: wave 2s infinite ease-in-out;
}

@keyframes wave {

    0% {
        transform: translateX(-5px);
    }

    50% {
        transform: translateX(5px);
    }

    100% {
        transform: translateX(-5px);
    }
}


/* ================= PERCENTAGE ================= */

.water-percentage {

    position: absolute;

    left: 50%;

    bottom: 50%;

    transform: translate(-50%, 50%);

    z-index: 5;

    color: white;

    font-size: 27px;

    font-weight: 700;

    text-shadow:
        0 2px 10px rgba(0,0,0,0.9);

    white-space: nowrap;

    pointer-events: none;
}


/* ================= CAPACITY ================= */

.capacity {

    text-align: center;

    color: #aaa;

    font-size: 13px;

    margin-bottom: 20px;
}

.capacity strong {

    color: #ddd;
}


/* ================= STATUS ================= */

.status {

    display: block;

    width: fit-content;

    margin: auto;

    padding: 7px 16px;

    border-radius: 20px;

    font-size: 12px;

    font-weight: 600;
}

.available {

    background: rgba(76,175,80,0.15);

    color: #7ee787;
}

.low {

    background: rgba(255,193,7,0.15);

    color: #ffd166;
}

.critical {

    background: rgba(244,67,54,0.15);

    color: #ff8585;
}


/* ================= USAGE ================= */

.update-box {

    margin-top: 23px;

    padding-top: 20px;

    border-top:
        1px solid rgba(255,255,255,0.08);
}

.update-title {

    font-size: 15px;

    font-weight: 600;

    color: #e5d5f5;

    margin-bottom: 14px;
}

.update-box label {

    display: block;

    color: #aaa;

    font-size: 12px;

    margin-bottom: 7px;
}

.update-box input {

    width: 100%;

    padding: 12px;

    border-radius: 9px;

    border: 1px solid rgba(255,255,255,0.1);

    background: rgba(0,0,0,0.25);

    color: white;

    outline: none;

    font-size: 14px;
}

.update-box input:focus {

    border-color: #38bdf8;

    box-shadow:
        0 0 10px rgba(56,189,248,0.2);
}

.update-btn {

    width: 100%;

    padding: 12px;

    margin-top: 13px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(135deg,#0077ff,#00aaff);

    color: white;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

.update-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px rgba(0,150,255,0.35);
}


/* ================= EMPTY ================= */

.empty {

    text-align: center;

    padding: 70px 20px;

    color: #888;
}

.empty h3 {

    color: #bbb;

    margin-bottom: 8px;
}


/* ================= RESPONSIVE ================= */

@media(max-width:800px) {

    .sidebar {
        width: 190px;
    }

    .main {
        margin-left: 190px;
        padding: 20px;
    }
}

</style>

</head>


<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">

        <h1>SantiHer</h1>

        <p>
            Smart Restroom Management
        </p>

    </div>


    <div class="menu">

        <a href="DashboardServlet">
            🏠 Dashboard
        </a>

        <a href="RestroomServlet">
            🚻 Restrooms
        </a>

        <a href="CleanlinessServlet">
            ✨ Cleanliness
        </a>

        <a href="IssueServlet">
            ⚠ Issues
        </a>

        <a href="SupplyServlet">
            🧴 Supplies
        </a>

        <a href="WaterLevelServlet" class="active">
            💧 Water Level
        </a>

        <a href="SanitaryPadServlet">
            🩷 Sanitary Pad Availability
        </a>

    </div>

</div>


<!-- ================= MAIN ================= -->

<div class="main">


    <div class="header">

        <div>

            <h2>
                Water Level
            </h2>

            <p>
                Current water availability in restroom tanks
            </p>

        </div>


        <a href="DashboardServlet"
           class="back-btn">

            ← Dashboard

        </a>

    </div>


    <!-- INFORMATION -->

    <div class="info-box">

        💧 <strong>Water Usage:</strong>

        Enter the amount of water used.
        The blue water level will automatically
        decrease according to the amount used.

    </div>


    <!-- ================= TANKS ================= -->

    <div class="tank-grid">


<%

ResultSet waterResult =
    (ResultSet) request.getAttribute("waterResult");

boolean hasData = false;


if (waterResult != null) {

    while (waterResult.next()) {

        hasData = true;


        int restroomId =
            waterResult.getInt("restroom_id");


        String restroomName =
            waterResult.getString("restroom_name");


        String blockName =
            waterResult.getString("block_name");


        String floorName =
            waterResult.getString("floor_name");


        double tankCapacity =
            waterResult.getDouble("tank_capacity");


        double currentWater =
            waterResult.getDouble("current_water");


        /* ================= CALCULATE PERCENTAGE ================= */

        double percentage = 0;


        if (tankCapacity > 0) {

            percentage =
                (currentWater / tankCapacity) * 100;
        }


        if (percentage > 100) {
            percentage = 100;
        }

        if (percentage < 0) {
            percentage = 0;
        }


        int displayPercentage =
            (int) Math.round(percentage);


        /* ================= STATUS ================= */

        String statusClass;

        String statusText;


        if (percentage >= 50) {

            statusClass = "available";

            statusText = "Water Available";

        }
        else if (percentage >= 20) {

            statusClass = "low";

            statusText = "Water Low";

        }
        else {

            statusClass = "critical";

            statusText = "Water Critical";
        }

%>


        <!-- ================= TANK CARD ================= -->

        <div class="tank-card">


            <div class="tank-title">

                <%= restroomName %>

            </div>


            <div class="tank-location">

                <%= blockName %>
                •
                <%= floorName %>

            </div>


            <!-- ================= TANK ================= -->

            <div class="tank-container">

                <div class="tank">


                    <!-- BLUE WATER -->

                    <div
                        class="water"
                        style="height:<%= percentage %>%;">
                    </div>


                    <!-- PERCENTAGE -->

                    <div class="water-percentage">

                        <%= displayPercentage %>%

                    </div>


                </div>

            </div>


            <!-- ================= CAPACITY ================= -->

            <div class="capacity">

                Tank Capacity:

                <strong>

                    <%= String.format("%.0f", tankCapacity) %> L

                </strong>

            </div>


            <!-- ================= STATUS ================= -->

            <span class="status <%= statusClass %>">

                <%= statusText %>

            </span>


            <!-- ================= WATER USAGE ================= -->

            <div class="update-box">


                <div class="update-title">

                    Record Water Usage

                </div>


                <form
                    action="WaterLevelUpdateServlet"
                    method="post">


                    <!-- HIDDEN RESTROOM ID -->

                    <input
                        type="hidden"
                        name="restroom_id"
                        value="<%= restroomId %>">


                    <!-- HIDDEN TANK CAPACITY -->

                    <input
                        type="hidden"
                        name="tank_capacity"
                        value="<%= tankCapacity %>">


                    <!-- HIDDEN CURRENT WATER -->

                    <input
                        type="hidden"
                        name="current_water"
                        value="<%= currentWater %>">


                    <!-- USER ENTERS ONLY WATER USED -->

                    <label>

                        Amount of Water Used (Litres)

                    </label>


                    <input
                        type="number"
                        name="water_used"
                        min="0.01"
                        max="<%= currentWater %>"
                        step="0.01"
                        placeholder="Enter amount used"
                        required>


                    <button
                        type="submit"
                        class="update-btn">

                        💧 Record Water Usage

                    </button>


                </form>

            </div>


        </div>


<%

    }

}

%>


    </div>


<%

if (!hasData) {

%>


    <div class="empty">

        <h3>
            No Restrooms Found
        </h3>

        <p>
            Add a restroom first to display its water tank.
        </p>

    </div>


<%

}

%>


</div>


</body>

</html>