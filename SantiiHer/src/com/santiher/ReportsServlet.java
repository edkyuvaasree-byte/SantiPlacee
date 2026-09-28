package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            /* ==============================
               TOTAL RESTROOMS
            ============================== */

            String totalSql =
                    "SELECT COUNT(*) FROM restrooms";

            ps = con.prepareStatement(totalSql);
            rs = ps.executeQuery();

            int totalRestrooms = 0;

            if (rs.next()) {
                totalRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               CLEAN RESTROOMS
            ============================== */

            String cleanSql =
                    "SELECT COUNT(*) "
                    + "FROM restrooms "
                    + "WHERE cleanliness_status = 'Clean'";

            ps = con.prepareStatement(cleanSql);
            rs = ps.executeQuery();

            int cleanRestrooms = 0;

            if (rs.next()) {
                cleanRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               ATTENTION RESTROOMS
            ============================== */

            String attentionSql =
                    "SELECT COUNT(*) "
                    + "FROM restrooms "
                    + "WHERE cleanliness_status = 'Attention'";

            ps = con.prepareStatement(attentionSql);
            rs = ps.executeQuery();

            int attentionRestrooms = 0;

            if (rs.next()) {
                attentionRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               TOTAL ISSUES
            ============================== */

            String issueSql =
                    "SELECT COUNT(*) FROM issues";

            ps = con.prepareStatement(issueSql);
            rs = ps.executeQuery();

            int totalIssues = 0;

            if (rs.next()) {
                totalIssues = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               OPEN ISSUES
            ============================== */

            String openIssueSql =
                    "SELECT COUNT(*) "
                    + "FROM issues "
                    + "WHERE status != 'Resolved'";

            ps = con.prepareStatement(openIssueSql);
            rs = ps.executeQuery();

            int openIssues = 0;

            if (rs.next()) {
                openIssues = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               RESOLVED ISSUES
            ============================== */

            String resolvedIssueSql =
                    "SELECT COUNT(*) "
                    + "FROM issues "
                    + "WHERE status = 'Resolved'";

            ps = con.prepareStatement(resolvedIssueSql);
            rs = ps.executeQuery();

            int resolvedIssues = 0;

            if (rs.next()) {
                resolvedIssues = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               HYGIENE SCORE
            ============================== */

            int hygieneScore = 0;

            if (totalRestrooms > 0) {

                hygieneScore =
                        (cleanRestrooms * 100)
                        / totalRestrooms;
            }


            /* ==============================
               CLEANING RECORDS
            ============================== */

            String cleaningSql =
                    "SELECT COUNT(*) "
                    + "FROM cleaning_records";

            ps = con.prepareStatement(cleaningSql);
            rs = ps.executeQuery();

            int totalCleaningRecords = 0;

            if (rs.next()) {
                totalCleaningRecords = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               SUPPLY RECORDS
            ============================== */

            String supplySql =
                    "SELECT COUNT(*) FROM supplies";

            ps = con.prepareStatement(supplySql);
            rs = ps.executeQuery();

            int totalSupplyRecords = 0;

            if (rs.next()) {
                totalSupplyRecords = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ==============================
               SUPPLY AVAILABILITY
            ============================== */

            int supplyAvailable = 0;

            if (totalSupplyRecords > 0) {

                String availableSql =
                        "SELECT COUNT(*) "
                        + "FROM supplies "
                        + "WHERE soap_status = 'Available' "
                        + "AND tissue_status = 'Available' "
                        + "AND water_status = 'Available' "
                        + "AND sanitary_bin_status = 'Available'";

                ps = con.prepareStatement(availableSql);
                rs = ps.executeQuery();

                if (rs.next()) {
                    supplyAvailable = rs.getInt(1);
                }

                rs.close();
                ps.close();
            }


            int supplyPercentage = 0;

            if (totalSupplyRecords > 0) {

                supplyPercentage =
                        (supplyAvailable * 100)
                        / totalSupplyRecords;
            }


            /* ==============================
               SEND DATA TO JSP
            ============================== */

            request.setAttribute(
                    "totalRestrooms",
                    totalRestrooms
            );

            request.setAttribute(
                    "cleanRestrooms",
                    cleanRestrooms
            );

            request.setAttribute(
                    "attentionRestrooms",
                    attentionRestrooms
            );

            request.setAttribute(
                    "totalIssues",
                    totalIssues
            );

            request.setAttribute(
                    "openIssues",
                    openIssues
            );

            request.setAttribute(
                    "resolvedIssues",
                    resolvedIssues
            );

            request.setAttribute(
                    "hygieneScore",
                    hygieneScore
            );

            request.setAttribute(
                    "totalCleaningRecords",
                    totalCleaningRecords
            );

            request.setAttribute(
                    "totalSupplyRecords",
                    totalSupplyRecords
            );

            request.setAttribute(
                    "supplyAvailable",
                    supplyAvailable
            );

            request.setAttribute(
                    "supplyPercentage",
                    supplyPercentage
            );


            /* ==============================
               OPEN REPORTS PAGE
            ============================== */

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "reports.jsp"
                    );

            rd.forward(
                    request,
                    response
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html"
            );

            response.getWriter().println(
                    "<h2>SantiHer Reports Error</h2>"
            );

            response.getWriter().println(
                    "<p>"
                    + e.getMessage()
                    + "</p>"
            );


        } finally {

            try {

                if (rs != null) {
                    rs.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


            try {

                if (ps != null) {
                    ps.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }


            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}