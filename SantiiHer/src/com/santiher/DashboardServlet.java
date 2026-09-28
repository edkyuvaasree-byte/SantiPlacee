
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

@WebServlet("/DashboardServlet")
public class DashboardServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            /* ================= TOTAL RESTROOMS ================= */

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


            /* ================= CLEAN RESTROOMS ================= */

            String cleanSql =
                "SELECT COUNT(*) FROM restrooms " +
                "WHERE cleanliness_status = 'Clean'";

            ps = con.prepareStatement(cleanSql);
            rs = ps.executeQuery();

            int cleanRestrooms = 0;

            if (rs.next()) {
                cleanRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= ATTENTION RESTROOMS ================= */

            String attentionSql =
                "SELECT COUNT(*) FROM restrooms " +
                "WHERE cleanliness_status = 'Attention'";

            ps = con.prepareStatement(attentionSql);
            rs = ps.executeQuery();

            int attentionRestrooms = 0;

            if (rs.next()) {
                attentionRestrooms = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= OPEN ISSUES ================= */

            String issueSql =
                "SELECT COUNT(*) FROM issues " +
                "WHERE status != 'Resolved'";

            ps = con.prepareStatement(issueSql);
            rs = ps.executeQuery();

            int openIssues = 0;

            if (rs.next()) {
                openIssues = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= SANITARY PADS ================= */

            String padSql =
                "SELECT COALESCE(SUM(pad_quantity), 0) " +
                "FROM supplies";

            ps = con.prepareStatement(padSql);
            rs = ps.executeQuery();

            int totalPads = 0;

            if (rs.next()) {
                totalPads = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= LOW PAD LOCATIONS ================= */

            String lowPadSql =
                "SELECT COUNT(*) " +
                "FROM supplies " +
                "WHERE pad_quantity > 0 " +
                "AND pad_quantity < 10";

            ps = con.prepareStatement(lowPadSql);
            rs = ps.executeQuery();

            int lowPadLocations = 0;

            if (rs.next()) {
                lowPadLocations = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= OUT OF STOCK ================= */

            String outPadSql =
                "SELECT COUNT(*) " +
                "FROM supplies " +
                "WHERE pad_quantity = 0";

            ps = con.prepareStatement(outPadSql);
            rs = ps.executeQuery();

            int outOfStockPads = 0;

            if (rs.next()) {
                outOfStockPads = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /* ================= HYGIENE SCORE ================= */

            int hygieneScore = 0;

            if (totalRestrooms > 0) {

                hygieneScore =
                    (cleanRestrooms * 100)
                    / totalRestrooms;
            }


            /* ================= SEND DATA TO JSP ================= */

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
                "openIssues",
                openIssues
            );

            request.setAttribute(
                "hygieneScore",
                hygieneScore
            );

            request.setAttribute(
                "totalPads",
                totalPads
            );

            request.setAttribute(
                "lowPadLocations",
                lowPadLocations
            );

            request.setAttribute(
                "outOfStockPads",
                outOfStockPads
            );


            /* ================= OPEN DASHBOARD ================= */

            RequestDispatcher rd =
                request.getRequestDispatcher(
                    "dashboard.jsp"
                );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html"
            );

            response.getWriter().println(
                "<h2>SantiHer Dashboard Error</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
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

