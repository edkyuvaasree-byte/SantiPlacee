<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer | Cleanliness Monitoring</title>

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

/* TOP GRID */

.top-grid {
    display: grid;
    grid-template-columns: 1.1fr 1.9fr;
    gap: 20px;
    margin-bottom: 22px;
}

/* SCORE CARD */

.score-card {
    min-height: 280px;
    background: rgba(255,255,255,0.035);
    border: 1px solid rgba(255,255,255,0.07);
    border-radius: 20px;
    padding: 26px;
    backdrop-filter: blur(20px);
    position: relative;
    overflow: hidden;
}

.score-card::after {
    content: "";
    position: absolute;
    width: 180px;
    height: 180px;
    border-radius: 50%;
    background: #9b7cff;
    filter: blur(100px);
    opacity: 0.10;
    right: -60px;
    bottom: -60px;
}

.score-title {
    font-size: 14px;
    color: #a7a1af;
}

.score-content {
    display: flex;
    align-items: center;
    gap: 25px;
    margin-top: 25px;
}

/* DYNAMIC SCORE CIRCLE */

.circle {
    width: 145px;
    height: 145px;
    border-radius: 50%;

    background:
        conic-gradient(
            #9b7cff 0deg
            <%= request.getAttribute("hygieneScore") %>deg,
            rgba(255,255,255,0.07)
            <%= request.getAttribute("hygieneScore") %>deg 360deg
        );

    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

.circle::before {
    content: "";
    position: absolute;
    width: 115px;
    height: 115px;
    background: #12101a;
    border-radius: 50%;
}

.score-number {
    position: relative;
    z-index: 1;
    font-size: 32px;
    font-weight: 700;
}

.score-number span {
    font-size: 14px;
    color: #898391;
}

.score-info h3 {
    font-size: 18px;
    margin-bottom: 8px;
}

.score-info p {
    color: #817b89;
    font-size: 12px;
    line-height: 1.7;
}

/* STAT GRID */

.stat-grid {
    display: grid;
    grid-template-columns: repeat(2,1fr);
    gap: 18px;
}

.stat-card {
    background: rgba(255,255,255,0.035);
    border: 1px solid rgba(255,255,255,0.07);
    border-radius: 18px;
    padding: 22px;
    transition: 0.3s;
}

.stat-card:hover {
    transform: translateY(-3px);
    border-color: rgba(155,124,255,0.25);
}

.stat-icon {
    width: 40px;
    height: 40px;
    border-radius: 12px;
    background: rgba(155,124,255,0.12);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 15px;
}

.stat-label {
    color: #817b89;
    font-size: 11px;
}

.stat-value {
    font-size: 26px;
    font-weight: 700;
    margin-top: 7px;
}

.stat-description {
    color: #686270;
    font-size: 10px;
    margin-top: 5px;
}

/* MONITORING TABLE */

.table-card {
    background: rgba(255,255,255,0.035);
    border: 1px solid rgba(255,255,255,0.07);
    border-radius: 20px;
    overflow: hidden;
    backdrop-filter: blur(20px);
}

.table-header {
    padding: 22px 24px;
    border-bottom: 1px solid rgba(255,255,255,0.07);
}

.table-header h2 {
    font-size: 16px;
}

.table-header p {
    color: #77717f;
    font-size: 11px;
    margin-top: 6px;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    text-align: left;
    padding: 15px 24px;
    color: #77717f;
    font-size: 10px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

td {
    padding: 17px 24px;
    border-top: 1px solid rgba(255,255,255,0.05);
    font-size: 12px;
    color: #c6c1cd;
}

tr:hover {
    background: rgba(255,255,255,0.025);
}

/* PROGRESS */

.progress-container {
    width: 110px;
}

.progress-bar {
    width: 100%;
    height: 5px;
    border-radius: 10px;
    background: rgba(255,255,255,0.07);
    overflow: hidden;
}

.progress-fill {
    height: 100%;
    border-radius: 10px;
    background: linear-gradient(90deg,#9b7cff,#d58baa);
}

.progress-text {
    font-size: 10px;
    color: #8b8592;
    margin-top: 5px;
}

/* STATUS */

.status {
    display: inline-flex;
    align-items: center;
    gap: 7px;
    padding: 6px 10px;
    border-radius: 20px;
    font-size: 10px;
}

.status::before {
    content: "";
    width: 6px;
    height: 6px;
    border-radius: 50%;
}

.good {
    background: rgba(74,222,128,0.10);
    color: #72e69a;
}

.good::before {
    background: #72e69a;
}

.warning {
    background: rgba(251,191,36,0.10);
    color: #f5c95c;
}

.warning::before {
    background: #f5c95c;
}

/* BUTTON */

.check-btn {
    border: 1px solid rgba(255,255,255,0.08);
    background: rgba(255,255,255,0.04);
    color: #aaa5b4;
    padding: 7px 11px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 10px;
    transition: 0.3s;
}

.check-btn:hover {
    color: white;
    background: rgba(155,124,255,0.12);
    border-color: rgba(155,124,255,0.25);
}

/* RESPONSIVE */

@media(max-width:1000px) {

    .sidebar {
        width: 80px;
    }

    .logo h2,
    .menu-title,
    .menu span {
        display: none;
    }

    .main {
        padding: 25px;
    }

    .top-grid {
        grid-template-columns: 1fr;
    }
}

@media(max-width:650px) {

    .sidebar {
        display: none;
    }

    .stat-grid {
        grid-template-columns: 1fr;
    }

    .main {
        padding: 20px;
    }

    .score-content {
        flex-direction: column;
        align-items: flex-start;
    }

    .table-card {
        overflow-x: auto;
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
                <div class="icon">⌂</div>
                <span>Dashboard</span>
            </a>
        </li>

        <li>
            <a href="RestroomServlet">
                <div class="icon">🚻</div>
                <span>Restrooms</span>
            </a>
        </li>

        <li>
            <a href="CleanlinessServlet"
               class="active">
                <div class="icon">✓</div>
                <span>Cleanliness</span>
            </a>
        </li>

        <li>
            <a href="report-issue.jsp">
                <div class="icon">⚑</div>
                <span>Issues</span>
            </a>
        </li>

        <li>
            <a href="SupplyServlet">
                <div class="icon">▣</div>
                <span>Supplies</span>
            </a>
        </li>

        <li>
            <a href="ReportsServlet">
                <div class="icon">◫</div>
                <span>Reports</span>
            </a>
        </li>

    </ul>

</aside>


<!-- MAIN -->

<main class="main">

    <div class="header">

        <div>

            <h1>
                Cleanliness Monitoring
            </h1>

            <p>
                Track hygiene conditions and cleaning
                performance across campus.
            </p>

        </div>

        <button
            class="refresh-btn"
            onclick="refreshData()">

            ↻ Refresh

        </button>

    </div>


    <!-- TOP SECTION -->

    <div class="top-grid">


        <!-- SCORE -->

        <div class="score-card">

            <div class="score-title">
                Overall Campus Hygiene
            </div>

            <div class="score-content">

                <div class="circle">

                    <div class="score-number">

                        <%= request.getAttribute(
                            "hygieneScore"
                        ) %><span>%</span>

                    </div>

                </div>

                <div class="score-info">

                    <h3>

                    <%
                        int score =
                            (Integer) request.getAttribute(
                                "hygieneScore"
                            );

                        if (score >= 80) {
                    %>

                        Good condition

                    <%
                        } else if (score >= 60) {
                    %>

                        Needs attention

                    <%
                        } else {
                    %>

                        Requires improvement

                    <%
                        }
                    %>

                    </h3>

                    <p>

                        <%
                            if (score >= 80) {
                        %>

                            Most monitored restrooms are
                            currently clean and ready for use.

                        <%
                            } else if (score >= 60) {
                        %>

                            Some monitored restrooms require
                            additional cleaning or inspection.

                        <%
                            } else {
                        %>

                            Several monitored restrooms require
                            immediate cleaning attention.

                        <%
                            }
                        %>

                    </p>

                </div>

            </div>

        </div>


        <!-- STATS -->

        <div class="stat-grid">


            <div class="stat-card">

                <div class="stat-icon">
                    🧹
                </div>

                <div class="stat-label">
                    Cleaning Records
                </div>

                <div class="stat-value">

                    <%= request.getAttribute(
                        "cleaningRecords"
                    ) %>

                </div>

                <div class="stat-description">
                    Recorded cleaning activities
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    ✓
                </div>

                <div class="stat-label">
                    Clean Restrooms
                </div>

                <div class="stat-value">

                    <%= request.getAttribute(
                        "cleanRestrooms"
                    ) %>

                </div>

                <div class="stat-description">
                    Currently marked clean
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    ⚠
                </div>

                <div class="stat-label">
                    Need Attention
                </div>

                <div class="stat-value">

                    <%= request.getAttribute(
                        "attentionRestrooms"
                    ) %>

                </div>

                <div class="stat-description">
                    Require inspection
                </div>

            </div>


            <div class="stat-card">

                <div class="stat-icon">
                    ◷
                </div>

                <div class="stat-label">
                    Total Restrooms
                </div>

                <div class="stat-value">

                    <%= request.getAttribute(
                        "totalRestrooms"
                    ) %>

                </div>

                <div class="stat-description">
                    Monitored campus facilities
                </div>

            </div>


        </div>

    </div>


    <!-- TABLE -->

    <div class="table-card">

        <div class="table-header">

            <h2>
                Restroom Hygiene Status
            </h2>

            <p>
                Latest cleanliness assessment
                for each monitored facility
            </p>

        </div>


        <table>

            <thead>

                <tr>

                    <th>
                        Restroom
                    </th>

                    <th>
                        Cleanliness
                    </th>

                    <th>
                        Hygiene Score
                    </th>

                    <th>
                        Last Checked
                    </th>

                    <th>
                        Staff
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

            </thead>


            <tbody>


            <%

                ResultSet cleanlinessResult =
                    (ResultSet)
                    request.getAttribute(
                        "cleanlinessResult"
                    );

                while (
                    cleanlinessResult != null
                    &&
                    cleanlinessResult.next()
                ) {

                    String restroomName =
                        cleanlinessResult.getString(
                            "restroom_name"
                        );

                    String status =
                        cleanlinessResult.getString(
                            "cleanliness_status"
                        );

                    String block =
                        cleanlinessResult.getString(
                            "block_name"
                        );

                    String lastCleaned =
                        String.valueOf(
                            cleanlinessResult.getTimestamp(
                                "last_cleaned"
                            )
                        );

                    String staff =
                        cleanlinessResult.getString(
                            "assigned_staff"
                        );


                    int restroomScore = 0;

                    if ("Clean".equalsIgnoreCase(status)) {

                        restroomScore = 100;

                    } else if (
                        "Attention".equalsIgnoreCase(status)
                    ) {

                        restroomScore = 60;

                    } else {

                        restroomScore = 40;

                    }


                    String statusText = status;

                    if ("Clean".equalsIgnoreCase(status)) {

                        statusText = "Good";

                    } else if (
                        "Attention".equalsIgnoreCase(status)
                    ) {

                        statusText = "Attention";

                    }

            %>


                <tr>


                    <td>

                        <strong>
                            <%= restroomName %>
                        </strong>

                        <br>

                        <span style="
                            color:#686270;
                            font-size:10px;
                        ">

                            <%= block %>

                        </span>

                    </td>


                    <td>

                        <%

                            if (
                                "Clean".equalsIgnoreCase(
                                    status
                                )
                            ) {

                        %>

                            <span class="status good">

                                <%= statusText %>

                            </span>

                        <%

                            } else {

                        %>

                            <span class="status warning">

                                <%= statusText %>

                            </span>

                        <%

                            }

                        %>

                    </td>


                    <td>

                        <div class="progress-container">

                            <div class="progress-bar">

                                <div
                                    class="progress-fill"
                                    style="width:<%= restroomScore %>%">
                                </div>

                            </div>

                            <div class="progress-text">

                                <%= restroomScore %> / 100

                            </div>

                        </div>

                    </td>


                    <td>

                        <%= lastCleaned %>

                    </td>


                    <td>

                        <%= staff %>

                    </td>


                    <td>

                        <button
                            class="check-btn"
                            onclick="checkRestroom(
                                '<%= restroomName %>'
                            )">

                            Details

                        </button>

                    </td>


                </tr>


            <%

                }

            %>


            </tbody>

        </table>

    </div>

</main>

</div>


<script>

function refreshData() {

    window.location.href =
        "CleanlinessServlet";

}


function checkRestroom(name) {

    alert(
        "Cleanliness details for " +
        name +
        " are being monitored through SantiHer."
    );

}

</script>


</body>

</html>