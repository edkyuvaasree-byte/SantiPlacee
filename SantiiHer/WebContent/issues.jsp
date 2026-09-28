
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>SantiHer - Issue Management</title>


<style>

/* =====================================================
   RESET
===================================================== */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}


/* =====================================================
   BODY
===================================================== */

body {

    font-family: Arial, Helvetica, sans-serif;

    background:
        radial-gradient(
            circle at 15% 20%,
            #3b214f 0%,
            transparent 35%
        ),
        radial-gradient(
            circle at 85% 80%,
            #4b263d 0%,
            transparent 35%
        ),
        #100d16;

    color: #f5eef7;

    min-height: 100vh;

}


/* =====================================================
   NAVBAR
===================================================== */

.navbar {

    height: 75px;

    display: flex;

    align-items: center;

    justify-content: space-between;

    padding: 0 40px;

    background: rgba(25,20,31,0.78);

    border-bottom:
        1px solid rgba(255,255,255,0.08);

    backdrop-filter: blur(15px);

}


.logo-area {

    display: flex;

    align-items: center;

    gap: 12px;

}


.logo {

    width: 42px;

    height: 42px;

    border-radius: 13px;

    display: flex;

    align-items: center;

    justify-content: center;

    font-size: 20px;

    font-weight: bold;

    background:
        linear-gradient(
            135deg,
            #e6b7ff,
            #b76cff
        );

    color: #211329;

    box-shadow:
        0 0 25px
        rgba(183,108,255,0.35);

}


.brand {

    font-size: 22px;

    font-weight: bold;

}


.brand span {

    color: #d69cff;

}


.dashboard-btn {

    text-decoration: none;

    color: #eee;

    padding: 10px 18px;

    border-radius: 10px;

    background:
        rgba(255,255,255,0.07);

    border:
        1px solid
        rgba(255,255,255,0.1);

    transition: 0.3s;

}


.dashboard-btn:hover {

    background:
        rgba(255,255,255,0.14);

    transform:
        translateY(-2px);

}


/* =====================================================
   MAIN CONTAINER
===================================================== */

.container {

    padding: 40px;

    max-width: 1500px;

    margin: auto;

}


.page-header {

    margin-bottom: 30px;

}


.page-title {

    font-size: 34px;

    margin-bottom: 8px;

}


.page-subtitle {

    color: #aaa0b1;

    font-size: 14px;

}


/* =====================================================
   STAT CARDS
===================================================== */

.stats-grid {

    display: grid;

    grid-template-columns:
        repeat(4, 1fr);

    gap: 20px;

    margin-bottom: 30px;

}


.stat-card {

    padding: 23px;

    border-radius: 18px;

    background:
        rgba(255,255,255,0.055);

    border:
        1px solid
        rgba(255,255,255,0.09);

    backdrop-filter: blur(18px);

    transition: 0.3s;

}


.stat-card:hover {

    transform:
        translateY(-4px);

}


.stat-label {

    color: #aaa0b1;

    font-size: 13px;

    margin-bottom: 10px;

}


.stat-number {

    font-size: 30px;

    font-weight: bold;

}


/* =====================================================
   TABLE CARD
===================================================== */

.table-card {

    background:
        rgba(255,255,255,0.045);

    border:
        1px solid
        rgba(255,255,255,0.08);

    border-radius: 20px;

    padding: 25px;

    backdrop-filter: blur(18px);

    overflow-x: auto;

}


table {

    width: 100%;

    border-collapse: collapse;

}


thead {

    background:
        rgba(255,255,255,0.05);

}


th {

    text-align: left;

    padding: 15px 12px;

    font-size: 11px;

    color: #b8aebe;

    text-transform: uppercase;

    letter-spacing: 0.5px;

}


td {

    padding: 17px 12px;

    border-top:
        1px solid
        rgba(255,255,255,0.06);

    font-size: 13px;

    color: #eee8f0;

}


tbody tr {

    transition: 0.25s;

}


tbody tr:hover {

    background:
        rgba(255,255,255,0.035);

}


/* =====================================================
   EMPTY MESSAGE
===================================================== */

.empty-message {

    text-align: center;

    padding: 45px 20px;

    color: #aaa0b1;

    font-size: 14px;

}


/* =====================================================
   STATUS
===================================================== */

.status {

    display: inline-block;

    padding: 6px 11px;

    border-radius: 20px;

    font-size: 11px;

    font-weight: bold;

}


.pending {

    background:
        rgba(255,178,75,0.13);

    color: #ffc16b;

}


.progress {

    background:
        rgba(110,170,255,0.13);

    color: #8dbbff;

}


.resolved {

    background:
        rgba(85,220,150,0.12);

    color: #70e0a4;

}


/* =====================================================
   ACTION BUTTONS
===================================================== */

.action-area {

    display: flex;

    gap: 8px;

}


.edit-btn {

    border: none;

    cursor: pointer;

    padding: 7px 12px;

    border-radius: 8px;

    background:
        rgba(170,110,255,0.15);

    color: #d7a5ff;

    transition: 0.25s;

}


.edit-btn:hover {

    background:
        rgba(170,110,255,0.28);

    transform:
        translateY(-2px);

}


.delete-btn {

    text-decoration: none;

    padding: 7px 12px;

    border-radius: 8px;

    background:
        rgba(255,80,100,0.12);

    color: #ff8998;

    transition: 0.25s;

}


.delete-btn:hover {

    background:
        rgba(255,80,100,0.25);

    transform:
        translateY(-2px);

}


/* =====================================================
   MODAL
===================================================== */

.modal {

    display: none;

    position: fixed;

    z-index: 1000;

    left: 0;

    top: 0;

    width: 100%;

    height: 100%;

    background:
        rgba(0,0,0,0.72);

    backdrop-filter: blur(7px);

    align-items: center;

    justify-content: center;

}


.modal-content {

    width: 520px;

    max-width: 90%;

    max-height: 90vh;

    overflow-y: auto;

    background:
        linear-gradient(
            145deg,
            rgba(44,32,52,0.98),
            rgba(25,20,31,0.98)
        );

    border:
        1px solid
        rgba(255,255,255,0.1);

    border-radius: 22px;

    padding: 30px;

    box-shadow:
        0 25px 80px
        rgba(0,0,0,0.55);

    animation:
        popup 0.25s ease;

}


@keyframes popup {

    from {

        opacity: 0;

        transform:
            translateY(15px)
            scale(0.97);

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

    align-items: center;

    margin-bottom: 25px;

}


.modal-header h2 {

    font-size: 23px;

}


.close {

    font-size: 25px;

    cursor: pointer;

    color: #aaa;

}


.close:hover {

    color: white;

}


/* =====================================================
   FORM
===================================================== */

.form-group {

    margin-bottom: 16px;

}


.form-group label {

    display: block;

    margin-bottom: 7px;

    font-size: 12px;

    color: #bcb1c3;

}


.form-group input,
.form-group textarea,
.form-group select {

    width: 100%;

    padding: 12px 13px;

    border-radius: 10px;

    border:
        1px solid
        rgba(255,255,255,0.1);

    background:
        rgba(255,255,255,0.06);

    color: white;

    outline: none;

}


.form-group textarea {

    height: 90px;

    resize: vertical;

}


.form-group select option {

    background: #28202f;

    color: white;

}


.form-group input:focus,
.form-group textarea:focus,
.form-group select:focus {

    border-color: #c47cff;

    box-shadow:
        0 0 0 3px
        rgba(196,124,255,0.08);

}


.form-actions {

    display: flex;

    justify-content: flex-end;

    gap: 10px;

    margin-top: 22px;

}


.cancel-btn {

    border: none;

    cursor: pointer;

    padding: 11px 18px;

    border-radius: 10px;

    background:
        rgba(255,255,255,0.08);

    color: #ddd;

}


.save-btn {

    border: none;

    cursor: pointer;

    padding: 11px 20px;

    border-radius: 10px;

    background:
        linear-gradient(
            135deg,
            #dca6ff,
            #a95cff
        );

    color: #201126;

    font-weight: bold;

}


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width: 1000px) {

    .stats-grid {

        grid-template-columns:
            repeat(2,1fr);

    }

}


@media(max-width: 650px) {

    .container {

        padding: 25px 15px;

    }


    .navbar {

        padding: 0 18px;

    }


    .brand {

        font-size: 18px;

    }


    .stats-grid {

        grid-template-columns: 1fr;

    }


    .page-title {

        font-size: 28px;

    }

}

</style>

</head>


<body>


<!-- =====================================================
     NAVBAR
===================================================== -->

<div class="navbar">


    <div class="logo-area">

        <div class="logo">
            S
        </div>


        <div class="brand">

            Santi<span>Her</span>

        </div>

    </div>


    <!-- IMPORTANT:
         Dashboard is handled by DashboardServlet -->

    <a href="DashboardServlet"
       class="dashboard-btn">

        ← Dashboard

    </a>


</div>



<!-- =====================================================
     MAIN
===================================================== -->

<div class="container">


    <div class="page-header">

        <div class="page-title">

            Issue Management

        </div>


        <div class="page-subtitle">

            Monitor and manage restroom maintenance issues reported across campus.

        </div>

    </div>



<%

/* =====================================================
   GET RESULTSET FROM ISSUESERVLET
===================================================== */

ResultSet rs =
    (ResultSet) request.getAttribute("issueResult");


int total = 0;

int pending = 0;

int progress = 0;

int resolved = 0;


/*
 * We cannot safely use beforeFirst() because the ResultSet
 * may not be scrollable.
 *
 * Therefore we first store the required records in arrays.
 */


java.util.List<java.util.Map<String,Object>> issueList =
    new java.util.ArrayList<java.util.Map<String,Object>>();


if (rs != null) {

    try {

        while (rs.next()) {

            java.util.Map<String,Object> issue =
                new java.util.HashMap<String,Object>();


            issue.put(
                "issue_id",
                rs.getInt("issue_id")
            );


            issue.put(
                "restroom_id",
                rs.getInt("restroom_id")
            );


            issue.put(
                "restroom_name",
                rs.getString("restroom_name")
            );


            issue.put(
                "issue_type",
                rs.getString("issue_type")
            );


            issue.put(
                "description",
                rs.getString("description")
            );


            issue.put(
                "reported_by",
                rs.getString("reported_by")
            );


            issue.put(
                "status",
                rs.getString("status")
            );


            issue.put(
                "reported_at",
                rs.getString("reported_at")
            );


            issueList.add(issue);


            total++;


            String currentStatus =
                rs.getString("status");


            if ("Pending".equalsIgnoreCase(currentStatus)) {

                pending++;

            }

            else if ("In Progress".equalsIgnoreCase(currentStatus)) {

                progress++;

            }

            else if ("Resolved".equalsIgnoreCase(currentStatus)) {

                resolved++;

            }

        }

    }

    catch(Exception e) {

        out.println(
            "<div style='color:#ff8998;padding:20px;'>"
            + "Unable to read issue records: "
            + e.getMessage()
            + "</div>"
        );

    }

}

%>



<!-- =====================================================
     STAT CARDS
===================================================== -->

<div class="stats-grid">


    <div class="stat-card">

        <div class="stat-label">

            Total Issues

        </div>

        <div class="stat-number">

            <%= total %>

        </div>

    </div>



    <div class="stat-card">

        <div class="stat-label">

            Pending

        </div>

        <div class="stat-number">

            <%= pending %>

        </div>

    </div>



    <div class="stat-card">

        <div class="stat-label">

            In Progress

        </div>

        <div class="stat-number">

            <%= progress %>

        </div>

    </div>



    <div class="stat-card">

        <div class="stat-label">

            Resolved

        </div>

        <div class="stat-number">

            <%= resolved %>

        </div>

    </div>


</div>



<!-- =====================================================
     TABLE
===================================================== -->

<div class="table-card">


<table>


<thead>

<tr>

    <th>ID</th>

    <th>Restroom</th>

    <th>Issue Type</th>

    <th>Description</th>

    <th>Reported By</th>

    <th>Status</th>

    <th>Reported At</th>

    <th>Action</th>

</tr>

</thead>



<tbody>


<%

if (issueList.isEmpty()) {

%>

<tr>

    <td colspan="8">

        <div class="empty-message">

            No issues have been reported yet.

        </div>

    </td>

</tr>


<%

}

else {


    for (java.util.Map<String,Object> issue : issueList) {


        int issueId =
            ((Integer)issue.get("issue_id")).intValue();


        int restroomId =
            ((Integer)issue.get("restroom_id")).intValue();


        String restroomName =
            (String)issue.get("restroom_name");


        String issueType =
            (String)issue.get("issue_type");


        String description =
            (String)issue.get("description");


        String reportedBy =
            (String)issue.get("reported_by");


        String currentStatus =
            (String)issue.get("status");


        String reportedAt =
            (String)issue.get("reported_at");


%>


<tr>


    <!-- =================================================
         ISSUE ID
    ================================================== -->

    <td>

        <%= issueId %>

    </td>



    <!-- =================================================
         RESTROOM
    ================================================== -->

    <td>

        <strong>

            <%= restroomName == null
                ? "-"
                : restroomName %>

        </strong>

    </td>



    <!-- =================================================
         ISSUE TYPE
    ================================================== -->

    <td>

        <span style="
            color:#d69cff;
            font-weight:bold;
        ">

            <%= issueType == null
                ? "-"
                : issueType %>

        </span>

    </td>



    <!-- =================================================
         DESCRIPTION
    ================================================== -->

    <td>

        <%= description == null
            ? "-"
            : description %>

    </td>



    <!-- =================================================
         REPORTED BY
    ================================================== -->

    <td>

        <%= reportedBy == null
            ? "-"
            : reportedBy %>

    </td>



    <!-- =================================================
         STATUS
    ================================================== -->

    <td>


        <%

        if ("Pending".equalsIgnoreCase(currentStatus)) {

        %>

            <span class="status pending">

                Pending

            </span>


        <%

        }

        else if ("In Progress".equalsIgnoreCase(currentStatus)) {

        %>

            <span class="status progress">

                In Progress

            </span>


        <%

        }

        else if ("Resolved".equalsIgnoreCase(currentStatus)) {

        %>

            <span class="status resolved">

                Resolved

            </span>


        <%

        }

        else {

        %>

            <span class="status resolved">

                <%= currentStatus == null
                    ? "Unknown"
                    : currentStatus %>

            </span>


        <%

        }

        %>


    </td>



    <!-- =================================================
         REPORTED DATE
    ================================================== -->

    <td>

        <%= reportedAt == null
            ? "-"
            : reportedAt %>

    </td>



    <!-- =================================================
         ACTION
    ================================================== -->

    <td>


        <div class="action-area">


            <!-- EDIT -->

            <button
                type="button"
                class="edit-btn"

                onclick="openEditForm(
                    '<%= issueId %>',
                    '<%= restroomId %>',
                    '<%= issueType == null ? "" : issueType.replace("'", "\\'") %>',
                    '<%= description == null ? "" : description.replace("'", "\\'").replace("\n", " ") %>',
                    '<%= reportedBy == null ? "" : reportedBy.replace("'", "\\'") %>',
                    '<%= currentStatus == null ? "" : currentStatus %>'
                )">

                Edit

            </button>



            <!-- DELETE -->

            <a

                href="IssueServlet?action=delete&id=<%= issueId %>"

                class="delete-btn"

                onclick="return confirm(
                    'Are you sure you want to delete this issue?'
                );">

                Delete

            </a>


        </div>


    </td>


</tr>


<%

    }

}

%>


</tbody>


</table>


</div>


</div>



<!-- =====================================================
     EDIT ISSUE MODAL
===================================================== -->

<div id="editModal"
     class="modal">


    <div class="modal-content">


        <div class="modal-header">


            <h2>

                Edit Issue

            </h2>


            <span
                class="close"
                onclick="closeEditForm()">

                ×

            </span>


        </div>



        <form
            action="IssueServlet"
            method="post">


            <!-- ISSUE ID -->

            <input
                type="hidden"
                id="edit_issue_id"
                name="issue_id">



            <!-- RESTROOM ID -->

            <div class="form-group">

                <label>

                    Restroom ID

                </label>


                <input
                    type="number"
                    id="edit_restroom_id"
                    name="restroom_id"
                    required>

            </div>



            <!-- ISSUE TYPE -->

            <div class="form-group">

                <label>

                    Issue Type

                </label>


                <input
                    type="text"
                    id="edit_issue_type"
                    name="issue_type"
                    required>

            </div>



            <!-- DESCRIPTION -->

            <div class="form-group">

                <label>

                    Description

                </label>


                <textarea
                    id="edit_description"
                    name="description"
                    required></textarea>

            </div>



            <!-- REPORTED BY -->

            <div class="form-group">

                <label>

                    Reported By

                </label>


                <input
                    type="text"
                    id="edit_reported_by"
                    name="reported_by"
                    required>

            </div>



            <!-- STATUS -->

            <div class="form-group">

                <label>

                    Status

                </label>


                <select
                    id="edit_status"
                    name="status"
                    required>

                    <option value="Pending">

                        Pending

                    </option>


                    <option value="In Progress">

                        In Progress

                    </option>


                    <option value="Resolved">

                        Resolved

                    </option>

                </select>

            </div>



            <!-- FORM BUTTONS -->

            <div class="form-actions">


                <button
                    type="button"
                    class="cancel-btn"
                    onclick="closeEditForm()">

                    Cancel

                </button>


                <button
                    type="submit"
                    class="save-btn">

                    Update Issue

                </button>


            </div>


        </form>


    </div>

</div>



<!-- =====================================================
     JAVASCRIPT
===================================================== -->

<script>


/* =====================================================
   OPEN EDIT FORM
===================================================== */

function openEditForm(
    issueId,
    restroomId,
    issueType,
    description,
    reportedBy,
    status
) {


    document.getElementById(
        "edit_issue_id"
    ).value = issueId;


    document.getElementById(
        "edit_restroom_id"
    ).value = restroomId;


    document.getElementById(
        "edit_issue_type"
    ).value = issueType;


    document.getElementById(
        "edit_description"
    ).value = description;


    document.getElementById(
        "edit_reported_by"
    ).value = reportedBy;


    document.getElementById(
        "edit_status"
    ).value = status;


    document.getElementById(
        "editModal"
    ).style.display = "flex";

}


/* =====================================================
   CLOSE EDIT FORM
===================================================== */

function closeEditForm() {

    document.getElementById(
        "editModal"
    ).style.display = "none";

}


/* =====================================================
   CLOSE WHEN CLICKING OUTSIDE
===================================================== */

window.onclick = function(event) {


    var modal =
        document.getElementById(
            "editModal"
        );


    if (event.target === modal) {

        modal.style.display = "none";

    }

};


</script>


</body>

</html>
