<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer | Reports & Analytics</title>

<style>

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Inter', sans-serif;
}

body {
    background: #0d0b14;
    color: #f5f3fa;
    min-height: 100vh;
}

body::before {
    content: "";
    position: fixed;
    width: 500px;
    height: 500px;
    background: #9b7cff;
    filter: blur(180px);
    opacity: 0.12;
    top: -150px;
    right: -100px;
    z-index: -1;
}

body::after {
    content: "";
    position: fixed;
    width: 450px;
    height: 450px;
    background: #ff78a8;
    filter: blur(180px);
    opacity: 0.08;
    bottom: -150px;
    left: -100px;
    z-index: -1;
}


/* LAYOUT */

.container {
    display: flex;
    min-height: 100vh;
}


/* SIDEBAR */

.sidebar {
    width: 245px;
    padding: 28px 18px;
    border-right: 1px solid rgba(255,255,255,0.08);
    background: rgba(20,17,29,0.75);
    backdrop-filter: blur(20px);
}

.logo {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 45px;
    padding-left: 10px;
}

.logo-icon {
    width: 40px;
    height: 40px;
    border-radius: 13px;
    background: linear-gradient(135deg,#9b7cff,#e68ab0);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
    box-shadow: 0 8px 25px rgba(155,124,255,0.25);
}

.logo h2 {
    font-size: 20px;
}

.logo span {
    color: #a78bfa;
}

.menu-title {
    font-size: 11px;
    color: #77717f;
    text-transform: uppercase;
    letter-spacing: 1.5px;
    margin: 0 12px 12px;
}

.menu {
    list-style: none;
}

.menu li {
    margin-bottom: 6px;
}

.menu a {
    display: flex;
    align-items: center;
    gap: 13px;
    padding: 12px 14px;
    border-radius: 12px;
    text-decoration: none;
    color: #aaa5b4;
    font-size: 13px;
    transition: 0.3s;
}

.menu a:hover {
    background: rgba(255,255,255,0.06);
    color: white;
    transform: translateX(3px);
}

.menu a.active {
    background: linear-gradient(
        135deg,
        rgba(155,124,255,0.20),
        rgba(230,138,176,0.10)
    );
    color: white;
    border: 1px solid rgba(155,124,255,0.18);
}

.icon {
    width: 22px;
    text-align: center;
}


/* MAIN */

.main {
    flex: 1;
    padding: 35px 45px;
}


/* HEADER */

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.header h1 {
    font-size: 28px;
    letter-spacing: -1px;
}

.header p {
    color: #85808f;
    font-size: 13px;
    margin-top: 7px;
}

.refresh-btn {
    padding: 11px 17px;
    border-radius: 11px;
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(255,255,255,0.045);
    color: #d5d0dc;
    cursor: pointer;
    transition: 0.3s;
}

.refresh-btn:hover {
    background: rgba(155,124,255,0.12);
    border-color: rgba(155,124,255,0.25);
    transform: translateY(-2px);
}


/* SUMMARY */

.summary-grid {
    display: grid;
    grid-template-columns: repeat(4,1fr);
    gap: 18px;
    margin-bottom: 22px;
}

.card {
    background: rgba(255,255,255,0.035);
    border: 1px solid rgba(255,255,255,0.07);
    border-radius: 18px;
    padding: 22px;
    transition: 0.3s;
}

.card:hover {
    transform: translateY(-3px);
    border-color: rgba(155,124,255,0.25);
}

.card-label {
    color: #817b89;
    font-size: 11px;
}

.card-value {
    font-size: 28px;
    font-weight: 700;
    margin-top: 9px;
}

.card-description {
    color: #686270;
    font-size: 10px;
    margin-top: 5px;
}


/* ANALYTICS GRID */

.analytics-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 20px;
    margin-bottom: 22px;
}


/* PANEL */

.panel {
    background: rgba(255,255,255,0.035);
    border: 1px solid rgba(255,255,255,0.07);
    border-radius: 20px;
    padding: 25px;
    backdrop-filter: blur(20px);
}

.panel h2 {
    font-size: 16px;
}

.panel-subtitle {
    color: #77717f;
    font-size: 11px;
    margin-top: 6px;
}


/* HYGIENE SCORE */

.score-area {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 35px 0;
}

.score-circle {

    width: 175px;
    height: 175px;

    border-radius: 50%;

    background:
        conic-gradient(
            #9b7cff 0deg
            <%= ((Integer)request.getAttribute("hygieneScore")) * 3.6 %>deg,
            rgba(255,255,255,0.07)
            <%= ((Integer)request.getAttribute("hygieneScore")) * 3.6 %>deg
            360deg
        );

    display: flex;
    align-items: center;
    justify-content: center;

    position: relative;
}

.score-circle::before {

    content: "";

    position: absolute;

    width: 140px;
    height: 140px;

    border-radius: 50%;

    background: #12101a;
}

.score-content {

    position: relative;

    z-index: 2;

    text-align: center;
}

.score-value {

    font-size: 35px;

    font-weight: 700;
}

.score-label {

    font-size: 10px;

    color: #898391;

    margin-top: 4px;
}


/* ISSUE SECTION */

.issue-grid {

    display: grid;

    grid-template-columns:
        repeat(3,1fr);

    gap: 15px;

    margin-top: 25px;
}

.issue-box {

    padding: 18px;

    border-radius: 14px;

    text-align: center;
}

.issue-box.total {

    background:
        rgba(155,124,255,0.10);
}

.issue-box.open {

    background:
        rgba(251,191,36,0.10);
}

.issue-box.resolved {

    background:
        rgba(74,222,128,0.10);
}

.issue-number {

    font-size: 25px;

    font-weight: 700;
}

.issue-label {

    font-size: 10px;

    color: #85808f;

    margin-top: 5px;
}


/* SUPPLIES */

.supply-content {

    margin-top: 25px;
}

.supply-row {

    margin-bottom: 20px;
}

.supply-top {

    display: flex;

    justify-content:
        space-between;

    margin-bottom: 7px;
}

.supply-name {

    font-size: 12px;

    color: #c6c1cd;
}

.supply-percent {

    font-size: 11px;

    color: #9b7cff;
}

.supply-bar {

    height: 7px;

    border-radius: 10px;

    background:
        rgba(255,255,255,0.07);

    overflow: hidden;
}

.supply-fill {

    height: 100%;

    border-radius: 10px;

    background:
        linear-gradient(
            90deg,
            #9b7cff,
            #d58baa
        );
}


/* DETAILS */

.details-grid {

    display: grid;

    grid-template-columns:
        repeat(3,1fr);

    gap: 18px;

    margin-top: 22px;
}

.detail-box {

    padding: 20px;

    background:
        rgba(255,255,255,0.025);

    border:
        1px solid
        rgba(255,255,255,0.06);

    border-radius: 15px;
}

.detail-label {

    color: #77717f;

    font-size: 10px;
}

.detail-value {

    font-size: 20px;

    font-weight: 600;

    margin-top: 8px;
}


/* INFORMATION */

.info {

    margin-top: 22px;

    padding: 18px;

    border-radius: 14px;

    background:
        rgba(155,124,255,0.07);

    border:
        1px solid
        rgba(155,124,255,0.12);

    color: #aaa5b4;

    font-size: 11px;

    line-height: 1.7;
}


/* RESPONSIVE */

@media(max-width:1100px) {

    .summary-grid {

        grid-template-columns:
            repeat(2,1fr);
    }

    .analytics-grid {

        grid-template-columns:
            1fr;
    }
}

@media(max-width:700px) {

    .sidebar {

        display: none;
    }

    .main {

        padding: 20px;
    }

    .summary-grid {

        grid-template-columns:
            1fr;
    }

    .details-grid {

        grid-template-columns:
            1fr;
    }

    .issue-grid {

        grid-template-columns:
            1fr;
    }
}

</style>

</head>


<body>

<div class="container">


<!-- SIDEBAR -->

<aside class="sidebar">

    <div class="logo">

        <div class="logo-icon">
            ✦
        </div>

        <h2>
            Santi<span>Her</span>
        </h2>

    </div>


    <div class="menu-title">
        Workspace
    </div>


    <ul class="menu">


        <li>

            <a href="DashboardServlet">

                <div class="icon">
                    ⌂
                </div>

                <span>
                    Dashboard
                </span>

            </a>

        </li>


        <li>

            <a href="RestroomServlet">

                <div class="icon">
                    🚻
                </div>

                <span>
                    Restrooms
                </span>

            </a>

        </li>


        <li>

            <a href="CleanlinessServlet">

                <div class="icon">
                    ✓
                </div>

                <span>
                    Cleanliness
                </span>

            </a>

        </li>


        <li>

            <a href="report-issue.jsp">

                <div class="icon">
                    ⚑
                </div>

                <span>
                    Issues
                </span>

            </a>

        </li>


        <li>

            <a href="SupplyServlet">

                <div class="icon">
                    ▣
                </div>

                <span>
                    Supplies
                </span>

            </a>

        </li>


        <li>

            <a href="ReportsServlet"
               class="active">

                <div class="icon">
                    ◫
                </div>

                <span>
                    Reports
                </span>

            </a>

        </li>


    </ul>

</aside>


<!-- MAIN -->

<main class="main">


    <!-- HEADER -->

    <div class="header">

        <div>

            <h1>
                Reports & Analytics
            </h1>

            <p>
                Monitor campus hygiene performance
                and maintenance activity.
            </p>

        </div>


        <button
            class="refresh-btn"
            onclick="refreshReports()">

            ↻ Refresh

        </button>

    </div>


    <!-- SUMMARY CARDS -->

    <div class="summary-grid">


        <!-- TOTAL RESTROOMS -->

        <div class="card">

            <div class="card-label">
                Total Restrooms
            </div>

            <div class="card-value">

                <%= request.getAttribute(
                    "totalRestrooms"
                ) %>

            </div>

            <div class="card-description">
                Monitored facilities
            </div>

        </div>


        <!-- CLEAN -->

        <div class="card">

            <div class="card-label">
                Clean Restrooms
            </div>

            <div class="card-value">

                <%= request.getAttribute(
                    "cleanRestrooms"
                ) %>

            </div>

            <div class="card-description">
                Currently marked clean
            </div>

        </div>


        <!-- OPEN ISSUES -->

        <div class="card">

            <div class="card-label">
                Open Issues
            </div>

            <div class="card-value">

                <%= request.getAttribute(
                    "openIssues"
                ) %>

            </div>

            <div class="card-description">
                Require attention
            </div>

        </div>


        <!-- SCORE -->

        <div class="card">

            <div class="card-label">
                Hygiene Score
            </div>

            <div class="card-value">

                <%= request.getAttribute(
                    "hygieneScore"
                ) %>%

            </div>

            <div class="card-description">
                Overall cleanliness
            </div>

        </div>


    </div>


    <!-- ANALYTICS GRID -->

    <div class="analytics-grid">


        <!-- HYGIENE SCORE -->

        <div class="panel">

            <h2>
                Overall Hygiene Score
            </h2>

            <div class="panel-subtitle">

                Based on current restroom
                cleanliness

            </div>


            <div class="score-area">

                <div class="score-circle">

                    <div class="score-content">

                        <div class="score-value">

                            <%= request.getAttribute(
                                "hygieneScore"
                            ) %>%

                        </div>

                        <div class="score-label">

                            Hygiene Score

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- ISSUE RESOLUTION -->

        <div class="panel">

            <h2>
                Issue Resolution
            </h2>

            <div class="panel-subtitle">

                Current issue management status

            </div>


            <div class="issue-grid">


                <div class="issue-box total">

                    <div class="issue-number">

                        <%= request.getAttribute(
                            "totalIssues"
                        ) %>

                    </div>

                    <div class="issue-label">
                        Total Issues
                    </div>

                </div>


                <div class="issue-box open">

                    <div class="issue-number">

                        <%= request.getAttribute(
                            "openIssues"
                        ) %>

                    </div>

                    <div class="issue-label">
                        Open Issues
                    </div>

                </div>


                <div class="issue-box resolved">

                    <div class="issue-number">

                        <%= request.getAttribute(
                            "resolvedIssues"
                        ) %>

                    </div>

                    <div class="issue-label">
                        Resolved
                    </div>

                </div>


            </div>

        </div>


    </div>


    <!-- SUPPLY PANEL -->

    <div class="panel">


        <h2>
            Hygiene & Supply Availability
        </h2>


        <div class="panel-subtitle">

            Availability of essential
            restroom supplies

        </div>


        <div class="supply-content">


            <div class="supply-row">


                <div class="supply-top">

                    <span class="supply-name">

                        Overall Supply Availability

                    </span>


                    <span class="supply-percent">

                        <%= request.getAttribute(
                            "supplyPercentage"
                        ) %>%

                    </span>

                </div>


                <div class="supply-bar">

                    <div
                        class="supply-fill"
                        style="width:
                        <%= request.getAttribute(
                            "supplyPercentage"
                        ) %>%">
                    </div>

                </div>


            </div>


            <div class="details-grid">


                <!-- SUPPLY RECORDS -->

                <div class="detail-box">

                    <div class="detail-label">

                        Supply Records

                    </div>

                    <div class="detail-value">

                        <%= request.getAttribute(
                            "totalSupplyRecords"
                        ) %>

                    </div>

                </div>


                <!-- AVAILABLE -->

                <div class="detail-box">

                    <div class="detail-label">

                        Fully Available

                    </div>

                    <div class="detail-value">

                        <%= request.getAttribute(
                            "supplyAvailable"
                        ) %>

                    </div>

                </div>


                <!-- CLEANING -->

                <div class="detail-box">

                    <div class="detail-label">

                        Cleaning Records

                    </div>

                    <div class="detail-value">

                        <%= request.getAttribute(
                            "totalCleaningRecords"
                        ) %>

                    </div>

                </div>


            </div>


        </div>


    </div>


    <!-- INFORMATION -->

    <div class="info">

        <strong>
            SantiHer Analytics:
        </strong>

        These reports are generated using the
        latest information stored in the SantiHer
        MySQL database. Cleanliness status,
        issue management, cleaning activity and
        supply availability are calculated
        dynamically.

    </div>


</main>

</div>


<script>

function refreshReports() {

    window.location.href =
        "ReportsServlet";

}

</script>


</body>

</html>