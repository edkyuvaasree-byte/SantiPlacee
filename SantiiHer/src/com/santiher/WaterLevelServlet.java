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

@WebServlet("/WaterLevelServlet")
public class WaterLevelServlet extends HttpServlet {

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
                "SELECT restroom_id, restroom_name, block_name, " +
                "floor_name, tank_capacity, current_water " +
                "FROM restrooms " +
                "ORDER BY block_name, floor_name, restroom_name";

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            request.setAttribute("waterResult", rs);

            RequestDispatcher rd =
                request.getRequestDispatcher("water-level.jsp");

            rd.forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>SantiHer Water Level Error</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );

        }
    }
}