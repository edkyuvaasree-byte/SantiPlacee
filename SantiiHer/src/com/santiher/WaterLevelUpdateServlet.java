package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WaterLevelUpdateServlet")
public class WaterLevelUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            int restroomId =
                Integer.parseInt(request.getParameter("restroom_id"));

            double tankCapacity =
                Double.parseDouble(request.getParameter("tank_capacity"));

            double currentWater =
                Double.parseDouble(request.getParameter("current_water"));

            double waterUsed =
                Double.parseDouble(request.getParameter("water_used"));


            /*
             * Calculate the new water level
             */

            double newWater =
                currentWater - waterUsed;


            /*
             * Prevent negative water
             */

            if (newWater < 0) {
                newWater = 0;
            }


            /*
             * Prevent water from exceeding tank capacity
             */

            if (newWater > tankCapacity) {
                newWater = tankCapacity;
            }


            /*
             * Update the existing RESTROOM record.
             *
             * We are NOT using water_levels anymore.
             */

            con = DBConnection.getConnection();

            String sql =
                "UPDATE restrooms " +
                "SET tank_capacity = ?, current_water = ? " +
                "WHERE restroom_id = ?";


            ps = con.prepareStatement(sql);

            ps.setDouble(1, tankCapacity);
            ps.setDouble(2, newWater);
            ps.setInt(3, restroomId);

            ps.executeUpdate();


            /*
             * Return to Water Level page
             */

            response.sendRedirect("WaterLevelServlet");


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<html><head><title>SantiHer Water Update Error</title></head><body>"
            );

            response.getWriter().println(
                "<h2>SantiHer Water Update Error</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );

            response.getWriter().println(
                "<br><a href='WaterLevelServlet'>Back to Water Level</a>"
            );

            response.getWriter().println(
                "</body></html>"
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