
<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<%@ page import="com.santiher.DBConnection"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>SantiHer - Report an Issue</title>


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
   MAIN
===================================================== */

.container {

    width: 90%;

    max-width: 1000px;

    margin: 50px auto;

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
   FORM CARD
===================================================== */

.form-card {

    background:
        rgba(255,255,255,0.055);

    border:
        1px solid
        rgba(255,255,255,0.09);

    border-radius: 22px;

    padding: 35px;

    backdrop-filter: blur(18px);

    box-shadow:
        0 20px 60px
        rgba(0,0,0,0.3);

}


/* =====================================================
   FORM GRID
===================================================== */

.form-grid {

    display: grid;

    grid-template-columns:
        1fr 1fr;

    gap: 22px;

}


.form-group {

    display: flex;

    flex-direction: column;

}


.full-width {

    grid-column: span 2;

}


label {

    margin-bottom: 8px;

    font-size: 13px;

    color: #c9becd;

}


/* =====================================================
   INPUTS
===================================================== */

input,
select,
textarea {

    width: 100%;

    padding: 13px 15px;

    border-radius: 11px;

    border:
        1px solid
        rgba(255,255,255,0.1);

    background:
        rgba(255,255,255,0.06);

    color: white;

    outline: none;

    font-family:
        Arial,
        Helvetica,
        sans-serif;

    font-size: 14px;

    transition: 0.25s;

}


input:focus,
select:focus,
textarea:focus {

    border-color: #c47cff;

    box-shadow:
        0 0 0 3px
        rgba(196,124,255,0.08);

}


select option {

    background: #28202f;

    color: white;

}


textarea {

    min-height: 130px;

    resize: vertical;

}


/* =====================================================
   SUBMIT BUTTON
===================================================== */

.submit-area {

    display: flex;

    justify-content: flex-end;

    margin-top: 28px;

}


.submit-btn {

    border: none;

    cursor: pointer;

    padding: 13px 25px;

    border-radius: 11px;

    background:
        linear-gradient(
            135deg,
            #dca6ff,
            #a95cff
        );

    color: #201126;

    font-weight: bold;

    font-size: 14px;

    transition: 0.3s;

}


.submit-btn:hover {

    transform:
        translateY(-2px);

    box-shadow:
        0 10px 30px
        rgba(169,92,255,0.3);

}


/* =====================================================
   INFO BOX
===================================================== */

.info-box {

    margin-top: 25px;

    padding: 17px;

    border-radius: 13px;

    background:
        rgba(196,124,255,0.07);

    border:
        1px solid
        rgba(196,124,255,0.12);

    color: #bdb3c1;

    font-size: 13px;

    line-height: 1.6;

}


/* =====================================================
   RESPONSIVE
===================================================== */

@media(max-width:700px) {

    .container {

        width: 94%;

        margin: 30px auto;

    }


    .form-grid {

        grid-template-columns: 1fr;

    }


    .full-width {

        grid-column: span 1;

    }


    .navbar {

        padding: 0 18px;

    }


    .brand {

        font-size: 18px;

    }


    .form-card {

        padding: 25px;

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
         Dashboard uses DashboardServlet -->

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

            Report an Issue

        </div>


        <div class="page-subtitle">

            Help us maintain clean, safe and hygienic
            restroom facilities across the campus.

        </div>


    </div>



    <!-- =================================================
         FORM CARD
    ================================================== -->

    <div class="form-card">


        <form
            action="IssueServlet"
            method="post">


            <div class="form-grid">


                <!-- =====================================
                     RESTROOM
                ====================================== -->

                <div class="form-group">


                    <label>

                        Restroom

                    </label>


                    <select
                        name="restroom_id"
                        required>


                        <option value="">

                            Select Restroom

                        </option>


                        <%

                        Connection con = null;

                        PreparedStatement ps = null;

                        ResultSet restroomRs = null;


                        try {


                            con =
                                DBConnection.getConnection();


                            String sql =
                                "SELECT restroom_id, restroom_name "
                                + "FROM restrooms "
                                + "ORDER BY restroom_id";


                            ps =
                                con.prepareStatement(sql);


                            restroomRs =
                                ps.executeQuery();


                            while (restroomRs.next()) {

                        %>


                        <option
                            value="<%= restroomRs.getInt("restroom_id") %>">

                            <%= restroomRs.getString("restroom_name") %>

                        </option>


                        <%

                            }


                        }
                        catch (Exception e) {

                            e.printStackTrace();

                        }
                        finally {


                            try {

                                if (restroomRs != null)
                                    restroomRs.close();

                            }
                            catch (Exception e) {

                                e.printStackTrace();

                            }


                            try {

                                if (ps != null)
                                    ps.close();

                            }
                            catch (Exception e) {

                                e.printStackTrace();

                            }


                            try {

                                if (con != null)
                                    con.close();

                            }
                            catch (Exception e) {

                                e.printStackTrace();

                            }

                        }

                        %>


                    </select>


                </div>



                <!-- =====================================
                     ISSUE TYPE
                ====================================== -->

                <div class="form-group">


                    <label>

                        Issue Type

                    </label>


                    <select
                        name="issue_type"
                        required>


                        <option value="">

                            Select Issue Type

                        </option>


                        <option value="Water Supply">

                            Water Supply

                        </option>


                        <option value="Soap Dispenser">

                            Soap Dispenser

                        </option>


                        <option value="Sanitary Bin">

                            Sanitary Bin

                        </option>


                        <option value="Cleaning Required">

                            Cleaning Required

                        </option>


                        <option value="Light Problem">

                            Light Problem

                        </option>


                        <option value="Door Lock">

                            Door Lock

                        </option>


                        <option value="Other">

                            Other

                        </option>


                    </select>


                </div>



                <!-- =====================================
                     REPORTED BY
                ====================================== -->

                <div class="form-group">


                    <label>

                        Your Name

                    </label>


                    <input
                        type="text"
                        name="reported_by"
                        placeholder="Enter your name"
                        required>


                </div>



                <!-- =====================================
                     STATUS
                ====================================== -->

                <div class="form-group">


                    <label>

                        Status

                    </label>


                    <select
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



                <!-- =====================================
                     DESCRIPTION
                ====================================== -->

                <div class="form-group full-width">


                    <label>

                        Describe the Issue

                    </label>


                    <textarea
                        name="description"
                        placeholder="Describe the problem clearly..."
                        required></textarea>


                </div>


            </div>



            <!-- =========================================
                 SUBMIT
            ========================================== -->

            <div class="submit-area">


                <button
                    type="submit"
                    class="submit-btn">

                    Submit Report →

                </button>


            </div>



            <!-- =========================================
                 INFORMATION
            ========================================== -->

            <div class="info-box">


                <strong>

                    How it works

                </strong>


                <br>


                Your report will be stored in the
                SantiHer database and displayed in the
                Issue Management panel for the
                maintenance team to review.


            </div>


        </form>


    </div>


</div>


</body>

</html>

