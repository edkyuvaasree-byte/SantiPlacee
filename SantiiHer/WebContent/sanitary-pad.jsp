
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>SantiHer - Sanitary Pad Availability</title>

<style>

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {

    font-family: "Segoe UI", Arial, sans-serif;

    background:
        radial-gradient(circle at top left,
            rgba(126,34,206,0.18),
            transparent 35%),

        radial-gradient(circle at bottom right,
            rgba(236,72,153,0.12),
            transparent 35%),

        #0d0b14;

    color: white;

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
            #0d0b14
        );

    border-right:
        1px solid rgba(255,255,255,0.08);

    padding: 28px 18px;

    z-index: 10;
}

.logo {

    font-size: 28px;

    font-weight: 700;

    color: #f472b6;

    margin-bottom: 4px;
}

.logo-sub {

    color: #aaa;

    font-size: 12px;

    margin-bottom: 35px;
}

.nav-title {

    color: #777;

    font-size: 11px;

    text-transform: uppercase;

    letter-spacing: 1.5px;

    margin: 20px 12px 10px;
}

.sidebar a {

    display: block;

    text-decoration: none;

    color: #b9b2c5;

    padding: 13px 15px;

    margin-bottom: 5px;

    border-radius: 10px;

    transition: 0.3s;

    font-size: 14px;
}

.sidebar a:hover {

    background:
        rgba(236,72,153,0.12);

    color: white;

    transform: translateX(3px);
}

.sidebar a.active {

    background:
        linear-gradient(
            135deg,
            rgba(219,39,119,0.25),
            rgba(126,34,206,0.2)
        );

    color: #f9a8d4;

    border:
        1px solid rgba(236,72,153,0.2);
}


/* ================= MAIN ================= */

.main {

    margin-left: 250px;

    padding: 40px;

    min-height: 100vh;
}


/* ================= HEADER ================= */

.header {

    display: flex;

    justify-content: space-between;

    align-items: center;

    margin-bottom: 35px;
}

.header-left h1 {

    font-size: 31px;

    margin-bottom: 7px;
}

.header-left p {

    color: #999;

    font-size: 14px;
}

.dashboard-btn {

    text-decoration: none;

    color: white;

    padding: 11px 18px;

    border-radius: 10px;

    background:
        rgba(255,255,255,0.06);

    border:
        1px solid rgba(255,255,255,0.1);

    transition: 0.3s;
}

.dashboard-btn:hover {

    background:
        rgba(236,72,153,0.18);

    border-color:
        rgba(236,72,153,0.3);
}


/* ================= CARDS GRID ================= */

.cards {

    display: grid;

    grid-template-columns:
        repeat(auto-fit, minmax(320px, 1fr));

    gap: 25px;
}


/* ================= PAD CARD ================= */

.pad-card {

    position: relative;

    padding: 27px;

    border-radius: 20px;

    background:
        linear-gradient(
            145deg,
            rgba(255,255,255,0.065),
            rgba(255,255,255,0.025)
        );

    border:
        1px solid rgba(255,255,255,0.08);

    box-shadow:
        0 15px 40px rgba(0,0,0,0.25);

    backdrop-filter: blur(12px);

    transition: 0.35s;
}

.pad-card:hover {

    transform: translateY(-5px);

    border-color:
        rgba(236,72,153,0.3);

    box-shadow:
        0 20px 45px rgba(236,72,153,0.08);
}


/* ================= LOCATION ================= */

.location {

    font-size: 19px;

    font-weight: 600;

    margin-bottom: 6px;
}

.location-details {

    color: #999;

    font-size: 13px;

    margin-bottom: 25px;
}


/* ================= PAD ICON ================= */

.pad-icon {

    width: 75px;

    height: 75px;

    margin: 10px auto 18px;

    border-radius: 50%;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 35px;

    background:
        radial-gradient(
            circle,
            rgba(236,72,153,0.25),
            rgba(126,34,206,0.12)
        );

    border:
        1px solid rgba(236,72,153,0.2);

    box-shadow:
        0 0 30px rgba(236,72,153,0.12);
}


/* ================= QUANTITY ================= */

.quantity-label {

    text-align: center;

    color: #999;

    font-size: 12px;

    margin-bottom: 5px;
}

.quantity {

    text-align: center;

    font-size: 42px;

    font-weight: 700;

    color: #f9a8d4;

    line-height: 1;
}

.quantity-unit {

    text-align: center;

    color: #777;

    font-size: 12px;

    margin-top: 7px;
}


/* ================= STATUS ================= */

.status {

    display: block;

    width: fit-content;

    margin: 18px auto 0;

    padding: 7px 15px;

    border-radius: 30px;

    font-size: 12px;

    font-weight: 600;
}

.status.available {

    color: #86efac;

    background:
        rgba(34,197,94,0.12);

    border:
        1px solid rgba(34,197,94,0.2);
}

.status.low {

    color: #fde68a;

    background:
        rgba(234,179,8,0.12);

    border:
        1px solid rgba(234,179,8,0.2);
}

.status.out {

    color: #fca5a5;

    background:
        rgba(239,68,68,0.12);

    border:
        1px solid rgba(239,68,68,0.2);
}


/* ================= UPDATE BOX ================= */

.update-box {

    margin-top: 25px;

    padding-top: 22px;

    border-top:
        1px solid rgba(255,255,255,0.08);
}

.update-title {

    font-size: 15px;

    font-weight: 600;

    color: #e5d5f5;

    margin-bottom: 15px;
}

.update-box label {

    display: block;

    color: #aaa;

    font-size: 12px;

    margin-bottom: 7px;
}

.update-box input {

    width: 100%;

    padding: 12px 13px;

    border-radius: 9px;

    border:
        1px solid rgba(255,255,255,0.1);

    background:
        rgba(0,0,0,0.25);

    color: white;

    outline: none;

    font-size: 14px;
}

.update-box input::placeholder {

    color: #666;
}

.update-box input:focus {

    border-color: #ec4899;

    box-shadow:
        0 0 10px rgba(236,72,153,0.2);
}

.update-btn {

    width: 100%;

    padding: 12px;

    margin-top: 13px;

    border: none;

    border-radius: 10px;

    background:
        linear-gradient(
            135deg,
            #db2777,
            #ec4899
        );

    color: white;

    font-weight: 600;

    cursor: pointer;

    transition: 0.3s;
}

.update-btn:hover {

    transform: translateY(-2px);

    box-shadow:
        0 8px 20px
        rgba(236,72,153,0.35);
}


/* ================= EMPTY STATE ================= */

.empty {

    text-align: center;

    padding: 70px 20px;

    color: #777;

    border:
        1px dashed rgba(255,255,255,0.1);

    border-radius: 20px;
}


/* ================= RESPONSIVE ================= */

@media(max-width: 900px) {

    .sidebar {

        width: 210px;
    }

    .main {

        margin-left: 210px;

        padding: 25px;
    }
}

@media(max-width: 700px) {

    .sidebar {

        position: relative;

        width: 100%;

        height: auto;
    }

    .main {

        margin-left: 0;

        padding: 20px;
    }

    .header {

        flex-direction: column;

        align-items: flex-start;

        gap: 20px;
    }

}

</style>

</head>

<body>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar">

    <div class="logo">
        SantiHer
    </div>

    <div class="logo-sub">
        Smart Restroom Hygiene
    </div>


    <div class="nav-title">
        Main
    </div>

    <a href="DashboardServlet">
        🏠 Dashboard
    </a>

    <a href="RestroomServlet">
        🚻 Restrooms
    </a>

    <a href="CleanlinessServlet">
        🧹 Cleanliness
    </a>

    <a href="IssueServlet">
        ⚠️ Issues
    </a>


    <div class="nav-title">
        Hygiene Tracking
    </div>

    <a href="SupplyServlet">
        🧴 Supplies
    </a>

    <a href="WaterLevelServlet">
        💧 Water Level
    </a>

    <a href="SanitaryPadServlet" class="active">
        🩷 Sanitary Pad Availability
    </a>

</div>



<!-- ================= MAIN ================= -->

<div class="main">


    <!-- HEADER -->

    <div class="header">

        <div class="header-left">

            <h1>
                Sanitary Pad Availability
            </h1>

            <p>
                Monitor sanitary pad availability across college restrooms
            </p>

        </div>


        <a
            href="DashboardServlet"
            class="dashboard-btn">

            ← Dashboard

        </a>

    </div>



    <!-- ================= CARDS ================= -->

    <div class="cards">

        <%

        ResultSet padResult =
            (ResultSet) request.getAttribute("padResult");

        boolean hasRecords = false;


        if (padResult != null) {

            while (padResult.next()) {

                hasRecords = true;


                int quantity =
                    padResult.getInt("pad_quantity");

                String padStatus =
                    padResult.getString("pad_status");


                String statusClass;


                if (quantity >= 10) {

                    statusClass = "available";

                } else if (quantity > 0) {

                    statusClass = "low";

                } else {

                    statusClass = "out";

                }

        %>


        <!-- ================= SINGLE CARD ================= -->

        <div class="pad-card">


            <div class="location">

                <%= padResult.getString("restroom_name") %>

            </div>


            <div class="location-details">

                <%= padResult.getString("block_name") %>
                •
                <%= padResult.getString("floor_name") %>

            </div>


            <!-- PAD ICON -->

            <div class="pad-icon">

                🩷

            </div>


            <!-- QUANTITY -->

            <div class="quantity-label">

                Available Pads

            </div>


            <div class="quantity">

                <%= quantity %>

            </div>


            <div class="quantity-unit">

                sanitary pads

            </div>


            <!-- STATUS -->

            <span class="status <%= statusClass %>">

                <%= padStatus %>

            </span>


            <!-- ================= UPDATE BOX ================= -->

            <div class="update-box">

                <div class="update-title">

                    Update Pad Availability

                </div>


                <form
                    action="SanitaryPadUpdateServlet"
                    method="post">


                    <!-- SUPPLY ID -->

                    <input
                        type="hidden"
                        name="supply_id"
                        value="<%= padResult.getInt("supply_id") %>">


                    <label>

                        Available Pad Quantity

                    </label>


                    <input
                        type="number"
                        name="pad_quantity"
                        min="0"
                        step="1"
                        placeholder="Enter quantity"
                        required>


                    <button
                        type="submit"
                        class="update-btn">

                        🩷 Update Availability

                    </button>


                </form>

            </div>


        </div>


        <%

            }

        }


        if (!hasRecords) {

        %>


        <div class="empty">

            <h2>
                No sanitary pad records found
            </h2>

            <p>
                Add a supply record for a restroom first.
            </p>

        </div>


        <%

        }

        %>

    </div>


</div>


</body>
</html>
