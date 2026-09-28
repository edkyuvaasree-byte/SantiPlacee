
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>SantiHer | Hygiene & Supplies</title>

<style>

/* ==============================
   RESET
============================== */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, Helvetica, sans-serif;
}

body {
    background: #f7f5fb;
    color: #29233d;
}


/* ==============================
   SIDEBAR
============================== */

.sidebar {
    position: fixed;
    left: 0;
    top: 0;
    width: 240px;
    height: 100vh;

    background:
        linear-gradient(
            180deg,
            #211b35,
            #302548
        );

    color: white;
    padding: 28px 18px;

    box-shadow:
        5px 0 25px rgba(0,0,0,0.08);
}

.logo {
    font-size: 25px;
    font-weight: bold;
    text-align: center;
    margin-bottom: 35px;
    letter-spacing: 1px;
}

.logo span {
    color: #e8a7c8;
}

.sidebar a {
    display: block;
    color: #dcd7e8;
    text-decoration: none;
    padding: 14px 16px;
    margin: 6px 0;
    border-radius: 12px;
    transition: 0.3s;
    font-size: 14px;
}

.sidebar a:hover {
    background: rgba(255,255,255,0.10);
    color: white;
    transform: translateX(4px);
}

.sidebar a.active {
    background:
        linear-gradient(
            135deg,
            #a979c9,
            #d98db8
        );

    color: white;

    box-shadow:
        0 8px 20px
        rgba(180,120,190,0.25);
}


/* ==============================
   MAIN
============================== */

.main {
    margin-left: 240px;
    padding: 35px;
}


/* ==============================
   HEADER
============================== */

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
}

.header h1 {
    font-size: 30px;
}

.header p {
    color: #817a91;
    margin-top: 5px;
}

.refresh-btn {
    border: none;

    background:
        linear-gradient(
            135deg,
            #a979c9,
            #d98db8
        );

    color: white;

    padding: 12px 20px;

    border-radius: 12px;

    cursor: pointer;

    font-weight: bold;

    transition: 0.3s;
}

.refresh-btn:hover {
    transform: translateY(-2px);

    box-shadow:
        0 8px 20px
        rgba(150,100,170,0.25);
}


/* ==============================
   STATISTICS
============================== */

.stats {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 30px;
}

.card {
    background: white;

    border-radius: 20px;

    padding: 25px;

    box-shadow:
        0 8px 30px
        rgba(40,30,70,0.07);

    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);

    box-shadow:
        0 15px 35px
        rgba(40,30,70,0.10);
}

.card-title {
    font-size: 14px;
    color: #817a91;
    margin-bottom: 12px;
}

.stat-number {
    font-size: 32px;
    font-weight: bold;
    color: #302548;
}

.stat-label {
    font-size: 12px;
    color: #9992a8;
    margin-top: 5px;
}


/* ==============================
   SECTION
============================== */

.section-title {
    font-size: 21px;
    margin-bottom: 18px;
}


/* ==============================
   OVERVIEW
============================== */

.overview {
    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 18px;

    margin-bottom: 30px;
}

.overview-card {
    background: white;

    padding: 22px;

    border-radius: 18px;

    box-shadow:
        0 8px 25px
        rgba(40,30,70,0.06);

    text-align: center;

    transition: 0.3s;
}

.overview-card:hover {
    transform: translateY(-4px);
}

.icon {
    font-size: 32px;
    margin-bottom: 12px;
}

.overview-card h3 {
    font-size: 15px;
    margin-bottom: 6px;
}

.overview-card p {
    font-size: 12px;
    color: #928b9e;
}


/* ==============================
   TABLE
============================== */

.table-container {
    background: white;

    border-radius: 20px;

    padding: 25px;

    box-shadow:
        0 8px 30px
        rgba(40,30,70,0.07);

    overflow-x: auto;
}

table {
    width: 100%;
    border-collapse: collapse;
}

th {
    text-align: left;

    padding: 15px;

    font-size: 13px;

    color: #777087;

    border-bottom:
        1px solid #eeeaf3;
}

td {
    padding: 15px;

    font-size: 13px;

    border-bottom:
        1px solid #f1eef5;
}

tr:hover {
    background: #faf8fc;
}


/* ==============================
   STATUS
============================== */

.status {
    display: inline-block;

    padding: 6px 11px;

    border-radius: 20px;

    font-size: 11px;

    font-weight: bold;
}

.available {
    background: #e6f7ed;
    color: #278451;
}

.low {
    background: #fff2d8;
    color: #a56b00;
}

.empty {
    background: #fde7e7;
    color: #b23a3a;
}


/* ==============================
   UPDATE BUTTON
============================== */

.update-btn {
    border: none;

    background: #eee8f7;

    color: #694b8f;

    padding: 8px 12px;

    border-radius: 9px;

    cursor: pointer;

    font-size: 12px;

    transition: 0.3s;
}

.update-btn:hover {
    background: #dcd0ed;

    transform: translateY(-1px);
}


/* ==============================
   MODAL
============================== */

.modal {
    display: none;

    position: fixed;

    z-index: 1000;

    left: 0;
    top: 0;

    width: 100%;
    height: 100%;

    background:
        rgba(35,27,55,0.55);

    backdrop-filter: blur(6px);

    align-items: center;

    justify-content: center;
}

.modal-content {
    width: 450px;

    max-width: 90%;

    background: white;

    border-radius: 22px;

    padding: 28px;

    box-shadow:
        0 25px 70px
        rgba(30,20,50,0.25);

    animation:
        modalOpen 0.25s ease;
}

@keyframes modalOpen {

    from {
        opacity: 0;

        transform:
            translateY(20px)
            scale(0.96);
    }

    to {
        opacity: 1;

        transform:
            translateY(0)
            scale(1);
    }
}

.modal-header {
    display: flex;

    justify-content: space-between;

    align-items: flex-start;

    margin-bottom: 25px;
}

.modal-header h2 {
    font-size: 21px;

    color: #302548;

    margin-bottom: 5px;
}

.modal-header p {
    color: #8b8497;

    font-size: 12px;
}

.close-btn {
    border: none;

    background: #f1edf6;

    color: #5d526d;

    width: 34px;
    height: 34px;

    border-radius: 50%;

    font-size: 22px;

    cursor: pointer;
}

.close-btn:hover {
    background: #e7deef;
}


/* ==============================
   FORM
============================== */

.form-group {
    margin-bottom: 17px;
}

.form-group label {
    display: block;

    font-size: 13px;

    font-weight: bold;

    color: #51475f;

    margin-bottom: 7px;
}

.form-group select {
    width: 100%;

    padding: 12px 14px;

    border:
        1px solid #e5dfed;

    border-radius: 11px;

    background: #faf8fc;

    color: #40364d;

    outline: none;

    font-size: 13px;
}

.form-group select:focus {
    border-color: #a979c9;

    box-shadow:
        0 0 0 3px
        rgba(169,121,201,0.12);
}


/* ==============================
   MODAL BUTTONS
============================== */

.modal-actions {
    display: flex;

    justify-content: flex-end;

    gap: 10px;

    margin-top: 25px;
}

.cancel-btn {
    border: none;

    background: #eeeaf3;

    color: #62586e;

    padding: 11px 18px;

    border-radius: 10px;

    cursor: pointer;
}

.cancel-btn:hover {
    background: #e2dce9;
}

.save-btn {
    border: none;

    background:
        linear-gradient(
            135deg,
            #a979c9,
            #d98db8
        );

    color: white;

    padding: 11px 20px;

    border-radius: 10px;

    cursor: pointer;

    font-weight: bold;

    transition: 0.3s;
}

.save-btn:hover {
    transform:
        translateY(-2px);

    box-shadow:
        0 7px 18px
        rgba(160,110,180,0.25);
}


/* ==============================
   RESPONSIVE
============================== */

@media(max-width:1100px) {

    .stats,
    .overview {

        grid-template-columns:
            repeat(2, 1fr);
    }
}


@media(max-width:700px) {

    .sidebar {
        width: 190px;
    }

    .main {
        margin-left: 190px;
        padding: 20px;
    }

    .stats,
    .overview {

        grid-template-columns: 1fr;
    }
}

</style>

</head>


<body>


<!-- =================================
     SIDEBAR
================================= -->

<div class="sidebar">

    <div class="logo">
        Santi<span>Her</span>
    </div>


    <a href="DashboardServlet">
        Dashboard
    </a>


    <a href="RestroomServlet">
        Restrooms
    </a>


    <!-- CORRECTED -->
    <a href="CleanlinessServlet">
        Cleanliness
    </a>


    <a href="report-issue.jsp">
        Report an Issue
    </a>


    <a href="IssueServlet">
        Issue Management
    </a>


    <a href="SupplyServlet"
       class="active">

        Hygiene & Supplies

    </a>


    <a href="ReportsServlet">

        Reports

    </a>


    <a href="#">

        Settings

    </a>


    <a href="index.html">

        Logout

    </a>

</div>



<!-- =================================
     MAIN
================================= -->

<div class="main">


    <!-- HEADER -->

    <div class="header">

        <div>

            <h1>
                Hygiene & Supplies
            </h1>

            <p>
                Monitor essential restroom supplies across campus
            </p>

        </div>


        <button
            class="refresh-btn"
            onclick="refreshSupplies()">

            &#8635; Refresh

        </button>

    </div>



    <!-- =================================
         DYNAMIC STATISTICS
    ================================= -->

    <div class="stats">


        <div class="card">

            <div class="card-title">
                Soap Availability
            </div>

            <div class="stat-number">

                <%= request.getAttribute(
                    "soapPercentage"
                ) %>%

            </div>

            <div class="stat-label">
                Across monitored restrooms
            </div>

        </div>



        <div class="card">

            <div class="card-title">
                Tissue Availability
            </div>

            <div class="stat-number">

                <%= request.getAttribute(
                    "tissuePercentage"
                ) %>%

            </div>

            <div class="stat-label">
                Across monitored restrooms
            </div>

        </div>



        <div class="card">

            <div class="card-title">
                Water Availability
            </div>

            <div class="stat-number">

                <%= request.getAttribute(
                    "waterPercentage"
                ) %>%

            </div>

            <div class="stat-label">
                Across monitored restrooms
            </div>

        </div>



        <div class="card">

            <div class="card-title">
                Bin Availability
            </div>

            <div class="stat-number">

                <%= request.getAttribute(
                    "binPercentage"
                ) %>%

            </div>

            <div class="stat-label">
                Across monitored restrooms
            </div>

        </div>

    </div>



    <!-- =================================
         CAMPUS SUPPLY OVERVIEW
    ================================= -->

    <div class="section-title">

        Campus Supply Overview

    </div>


    <div class="overview">


        <div class="overview-card">

            <div class="icon">
                &#129529;
            </div>

            <h3>
                Soap
            </h3>

            <p>
                Hand hygiene essential
            </p>

        </div>



        <div class="overview-card">

            <div class="icon">
                &#129531;
            </div>

            <h3>
                Tissue
            </h3>

            <p>
                Restroom paper supply
            </p>

        </div>



        <div class="overview-card">

            <div class="icon">
                &#128167;
            </div>

            <h3>
                Water
            </h3>

            <p>
                Essential facility resource
            </p>

        </div>



        <div class="overview-card">

            <div class="icon">
                &#128465;
            </div>

            <h3>
                Sanitary Bin
            </h3>

            <p>
                Hygiene waste management
            </p>

        </div>

    </div>



    <!-- =================================
         TABLE
    ================================= -->

    <div class="section-title">

        Restroom Supply Status

    </div>


    <div class="table-container">

        <table>

            <thead>

                <tr>

                    <th>
                        Restroom
                    </th>

                    <th>
                        Block
                    </th>

                    <th>
                        Floor
                    </th>

                    <th>
                        Soap
                    </th>

                    <th>
                        Tissue
                    </th>

                    <th>
                        Water
                    </th>

                    <th>
                        Sanitary Bin
                    </th>

                    <th>
                        Last Checked
                    </th>

                    <th>
                        Action
                    </th>

                </tr>

            </thead>


            <tbody>


            <%

                ResultSet supplyResult =
                    (ResultSet)
                    request.getAttribute(
                        "supplyResult"
                    );


                while (
                    supplyResult != null
                    &&
                    supplyResult.next()
                ) {


                    int supplyId =
                        supplyResult.getInt(
                            "supply_id"
                        );


                    String soap =
                        supplyResult.getString(
                            "soap_status"
                        );


                    String tissue =
                        supplyResult.getString(
                            "tissue_status"
                        );


                    String water =
                        supplyResult.getString(
                            "water_status"
                        );


                    String bin =
                        supplyResult.getString(
                            "sanitary_bin_status"
                        );

            %>


            <tr>


                <!-- RESTROOM -->

                <td>

                    <strong>

                        <%= supplyResult.getString(
                            "restroom_name"
                        ) %>

                    </strong>

                </td>


                <!-- BLOCK -->

                <td>

                    <%= supplyResult.getString(
                        "block_name"
                    ) %>

                </td>


                <!-- FLOOR -->

                <td>

                    <%= supplyResult.getString(
                        "floor_name"
                    ) %>

                </td>


                <!-- SOAP -->

                <td>

                    <span class="status
                    <%

                        if (
                            "Available".equals(
                                soap
                            )
                        ) {

                    %>
                        available
                    <%

                        } else if (
                            "Low".equals(
                                soap
                            )
                        ) {

                    %>
                        low
                    <%

                        } else {

                    %>
                        empty
                    <%

                        }

                    %>
                    ">

                        <%= soap %>

                    </span>

                </td>


                <!-- TISSUE -->

                <td>

                    <span class="status
                    <%

                        if (
                            "Available".equals(
                                tissue
                            )
                        ) {

                    %>
                        available
                    <%

                        } else if (
                            "Low".equals(
                                tissue
                            )
                        ) {

                    %>
                        low
                    <%

                        } else {

                    %>
                        empty
                    <%

                        }

                    %>
                    ">

                        <%= tissue %>

                    </span>

                </td>


                <!-- WATER -->

                <td>

                    <span class="status
                    <%

                        if (
                            "Available".equals(
                                water
                            )
                        ) {

                    %>
                        available
                    <%

                        } else if (
                            "Low".equals(
                                water
                            )
                        ) {

                    %>
                        low
                    <%

                        } else {

                    %>
                        empty
                    <%

                        }

                    %>
                    ">

                        <%= water %>

                    </span>

                </td>


                <!-- SANITARY BIN -->

                <td>

                    <span class="status
                    <%

                        if (
                            "Available".equals(
                                bin
                            )
                        ) {

                    %>
                        available
                    <%

                        } else if (
                            "Low".equals(
                                bin
                            )
                        ) {

                    %>
                        low
                    <%

                        } else {

                    %>
                        empty
                    <%

                        }

                    %>
                    ">

                        <%= bin %>

                    </span>

                </td>


                <!-- LAST CHECKED -->

                <td>

                    <%= supplyResult.getTimestamp(
                        "checked_at"
                    ) %>

                </td>


                <!-- UPDATE BUTTON -->

                <td>

                    <button
                        type="button"
                        class="update-btn"

                        onclick="openUpdateModal(
                            '<%= supplyId %>',
                            '<%= soap %>',
                            '<%= tissue %>',
                            '<%= water %>',
                            '<%= bin %>'
                        )">

                        Update

                    </button>

                </td>


            </tr>


            <%

                }

            %>


            </tbody>

        </table>

    </div>

</div>



<!-- =================================
     UPDATE MODAL
================================= -->

<div
    id="updateModal"
    class="modal">


    <div class="modal-content">


        <div class="modal-header">


            <div>

                <h2>
                    Update Supply Status
                </h2>

                <p>
                    Update the current availability
                    of restroom supplies.
                </p>

            </div>


            <button
                type="button"
                class="close-btn"
                onclick="closeUpdateModal()">

                &times;

            </button>

        </div>



        <form
            action="SupplyUpdateServlet"
            method="post">


            <!-- SUPPLY ID -->

            <input
                type="hidden"
                id="modalSupplyId"
                name="supply_id">



            <!-- SOAP -->

            <div class="form-group">

                <label>
                    Soap Status
                </label>

                <select
                    id="modalSoap"
                    name="soap_status">

                    <option value="Available">
                        Available
                    </option>

                    <option value="Low">
                        Low
                    </option>

                    <option value="Empty">
                        Empty
                    </option>

                </select>

            </div>



            <!-- TISSUE -->

            <div class="form-group">

                <label>
                    Tissue Status
                </label>

                <select
                    id="modalTissue"
                    name="tissue_status">

                    <option value="Available">
                        Available
                    </option>

                    <option value="Low">
                        Low
                    </option>

                    <option value="Empty">
                        Empty
                    </option>

                </select>

            </div>



            <!-- WATER -->

            <div class="form-group">

                <label>
                    Water Status
                </label>

                <select
                    id="modalWater"
                    name="water_status">

                    <option value="Available">
                        Available
                    </option>

                    <option value="Low">
                        Low
                    </option>

                    <option value="Empty">
                        Empty
                    </option>

                </select>

            </div>



            <!-- SANITARY BIN -->

            <div class="form-group">

                <label>
                    Sanitary Bin Status
                </label>

                <select
                    id="modalBin"
                    name="sanitary_bin_status">

                    <option value="Available">
                        Available
                    </option>

                    <option value="Low">
                        Low
                    </option>

                    <option value="Empty">
                        Empty
                    </option>

                    <option value="Needs Check">
                        Needs Check
                    </option>

                </select>

            </div>



            <!-- BUTTONS -->

            <div class="modal-actions">


                <button
                    type="button"
                    class="cancel-btn"
                    onclick="closeUpdateModal()">

                    Cancel

                </button>


                <button
                    type="submit"
                    class="save-btn">

                    Save Changes

                </button>


            </div>


        </form>

    </div>

</div>



<!-- =================================
     JAVASCRIPT
================================= -->

<script>


/* ==============================
   OPEN UPDATE MODAL
============================== */

function openUpdateModal(
    supplyId,
    soap,
    tissue,
    water,
    bin
) {

    document.getElementById(
        "modalSupplyId"
    ).value = supplyId;


    document.getElementById(
        "modalSoap"
    ).value = soap;


    document.getElementById(
        "modalTissue"
    ).value = tissue;


    document.getElementById(
        "modalWater"
    ).value = water;


    document.getElementById(
        "modalBin"
    ).value = bin;


    document.getElementById(
        "updateModal"
    ).style.display = "flex";

}


/* ==============================
   CLOSE MODAL
============================== */

function closeUpdateModal() {

    document.getElementById(
        "updateModal"
    ).style.display = "none";

}


/* ==============================
   CLOSE OUTSIDE MODAL
============================== */

window.onclick = function(event) {

    const modal =
        document.getElementById(
            "updateModal"
        );

    if (event.target === modal) {

        closeUpdateModal();

    }

};


/* ==============================
   REFRESH
============================== */

function refreshSupplies() {

    window.location.href =
        "SupplyServlet";

}

</script>


</body>

</html>

