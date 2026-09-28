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

@WebServlet("/SanitaryPadServlet")
public class SanitaryPadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            String sql =
                "SELECT s.supply_id, s.restroom_id, " +
                "r.restroom_name, r.block_name, r.floor_name, " +
                "s.pad_quantity, s.pad_status " +
                "FROM supplies s " +
                "INNER JOIN restrooms r " +
                "ON s.restroom_id = r.restroom_id " +
                "ORDER BY r.block_name, r.floor_name, r.restroom_name";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            request.setAttribute("padResult", rs);

            RequestDispatcher rd =
                request.getRequestDispatcher("sanitary-pad.jsp");

            rd.forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>SantiHer Sanitary Pad Error</h2>"
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