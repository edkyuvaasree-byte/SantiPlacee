package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SanitaryPadUpdateServlet")
public class SanitaryPadUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            int supplyId =
                Integer.parseInt(
                    request.getParameter("supply_id")
                );

            int padQuantity =
                Integer.parseInt(
                    request.getParameter("pad_quantity")
                );

            if (padQuantity < 0) {
                padQuantity = 0;
            }

            String padStatus;

            if (padQuantity >= 10) {

                padStatus = "Available";

            } else if (padQuantity > 0) {

                padStatus = "Low";

            } else {

                padStatus = "Out of Stock";
            }

            con = DBConnection.getConnection();

            String sql =
                "UPDATE supplies " +
                "SET pad_quantity = ?, " +
                "pad_status = ?, " +
                "checked_at = NOW() " +
                "WHERE supply_id = ?";

            ps = con.prepareStatement(sql);

            ps.setInt(1, padQuantity);
            ps.setString(2, padStatus);
            ps.setInt(3, supplyId);

            ps.executeUpdate();

            response.sendRedirect("SanitaryPadServlet");

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>SantiHer Sanitary Pad Update Error</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );

            response.getWriter().println(
                "<br><a href='SanitaryPadServlet'>" +
                "Back to Sanitary Pad Availability" +
                "</a>"
            );

        } finally {

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