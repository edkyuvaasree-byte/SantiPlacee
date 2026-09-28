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

@WebServlet("/CleanlinessServlet")
public class CleanlinessServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            // ==========================================
            // DATABASE CONNECTION
            // ==========================================

            con = DBConnection.getConnection();

            if (con == null) {
                throw new Exception("Database connection failed.");
            }


            // ==========================================
            // TOTAL RESTROOMS
            // ==========================================

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


            // ==========================================
            // CLEAN RESTROOMS
            // ==========================================

            String cleanSql =
                    "SELECT COUNT(*) " +
                    "FROM restrooms " +
                    "WHERE cleanliness_status = 'Clean'";

            ps = con.prepareStatement(cleanSql);
            rs = ps.executeQuery();

            int cleanRestrooms = 0;

            if (rs.next()) {
                cleanRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // ==========================================
            // ATTENTION RESTROOMS
            // ==========================================

            String attentionSql =
                    "SELECT COUNT(*) " +
                    "FROM restrooms " +
                    "WHERE cleanliness_status = 'Attention'";

            ps = con.prepareStatement(attentionSql);
            rs = ps.executeQuery();

            int attentionRestrooms = 0;

            if (rs.next()) {
                attentionRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // ==========================================
            // CLEANING RECORDS
            // ==========================================

            String cleaningSql =
                    "SELECT COUNT(*) FROM cleaning_records";

            ps = con.prepareStatement(cleaningSql);
            rs = ps.executeQuery();

            int cleaningRecords = 0;

            if (rs.next()) {
                cleaningRecords = rs.getInt(1);
            }

            rs.close();
            ps.close();


            // ==========================================
            // HYGIENE SCORE
            // ==========================================

            int hygieneScore = 0;

            if (totalRestrooms > 0) {

                hygieneScore =
                        (cleanRestrooms * 100)
                        / totalRestrooms;
            }


            // ==========================================
            // SEND STATISTICS TO JSP
            // ==========================================

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
                    "cleaningRecords",
                    cleaningRecords
            );

            request.setAttribute(
                    "hygieneScore",
                    hygieneScore
            );


            // ==========================================
            // RESTROOM CLEANLINESS DATA
            // ==========================================

            String sql =
                    "SELECT " +
                    "restroom_id, " +
                    "restroom_name, " +
                    "block_name, " +
                    "floor_name, " +
                    "cleanliness_status, " +
                    "last_cleaned, " +
                    "assigned_staff " +
                    "FROM restrooms " +
                    "ORDER BY last_cleaned DESC";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();


            // ==========================================
            // SEND RESULTSET TO JSP
            // ==========================================

            request.setAttribute(
                    "cleanlinessResult",
                    rs
            );


            // ==========================================
            // OPEN CLEANLINESS JSP
            // ==========================================

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "cleanliness.jsp"
                    );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                    "<h2>SantiHer Cleanliness Error</h2>"
            );

            response.getWriter().println(
                    "<p>" +
                    e.getMessage() +
                    "</p>"
            );


        } finally {

            /*
             * Do NOT close the ResultSet here before the JSP
             * finishes using it.
             *
             * The RequestDispatcher.forward() transfers control
             * to cleanliness.jsp first.
             */

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