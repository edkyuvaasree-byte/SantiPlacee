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

@WebServlet("/SupplyServlet")
public class SupplyServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            con = DBConnection.getConnection();

            /*
             * -----------------------------------
             * TOTAL RESTROOMS
             * -----------------------------------
             */

            String totalSql =
                    "SELECT COUNT(*) FROM supplies";

            ps = con.prepareStatement(totalSql);
            rs = ps.executeQuery();

            int totalSupplies = 0;

            if (rs.next()) {
                totalSupplies = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * -----------------------------------
             * SOAP AVAILABLE
             * -----------------------------------
             */

            String soapSql =
                    "SELECT COUNT(*) FROM supplies "
                    + "WHERE soap_status = 'Available'";

            ps = con.prepareStatement(soapSql);
            rs = ps.executeQuery();

            int soapAvailable = 0;

            if (rs.next()) {
                soapAvailable = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * -----------------------------------
             * TISSUE AVAILABLE
             * -----------------------------------
             */

            String tissueSql =
                    "SELECT COUNT(*) FROM supplies "
                    + "WHERE tissue_status = 'Available'";

            ps = con.prepareStatement(tissueSql);
            rs = ps.executeQuery();

            int tissueAvailable = 0;

            if (rs.next()) {
                tissueAvailable = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * -----------------------------------
             * WATER AVAILABLE
             * -----------------------------------
             */

            String waterSql =
                    "SELECT COUNT(*) FROM supplies "
                    + "WHERE water_status = 'Available'";

            ps = con.prepareStatement(waterSql);
            rs = ps.executeQuery();

            int waterAvailable = 0;

            if (rs.next()) {
                waterAvailable = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * -----------------------------------
             * SANITARY BIN AVAILABLE
             * -----------------------------------
             */

            String binSql =
                    "SELECT COUNT(*) FROM supplies "
                    + "WHERE sanitary_bin_status = 'Available'";

            ps = con.prepareStatement(binSql);
            rs = ps.executeQuery();

            int binAvailable = 0;

            if (rs.next()) {
                binAvailable = rs.getInt(1);
            }

            rs.close();
            ps.close();


            /*
             * -----------------------------------
             * CALCULATE PERCENTAGES
             * -----------------------------------
             */

            int soapPercentage = 0;
            int tissuePercentage = 0;
            int waterPercentage = 0;
            int binPercentage = 0;

            if (totalSupplies > 0) {

                soapPercentage =
                        (soapAvailable * 100)
                        / totalSupplies;

                tissuePercentage =
                        (tissueAvailable * 100)
                        / totalSupplies;

                waterPercentage =
                        (waterAvailable * 100)
                        / totalSupplies;

                binPercentage =
                        (binAvailable * 100)
                        / totalSupplies;
            }


            /*
             * -----------------------------------
             * SEND VALUES TO JSP
             * -----------------------------------
             */

            request.setAttribute(
                    "soapPercentage",
                    soapPercentage
            );

            request.setAttribute(
                    "tissuePercentage",
                    tissuePercentage
            );

            request.setAttribute(
                    "waterPercentage",
                    waterPercentage
            );

            request.setAttribute(
                    "binPercentage",
                    binPercentage
            );


            /*
             * -----------------------------------
             * GET SUPPLY TABLE DATA
             * -----------------------------------
             */

            String sql =
                    "SELECT s.supply_id, "
                    + "s.restroom_id, "
                    + "r.restroom_name, "
                    + "r.block_name, "
                    + "r.floor_name, "
                    + "s.soap_status, "
                    + "s.tissue_status, "
                    + "s.water_status, "
                    + "s.sanitary_bin_status, "
                    + "s.checked_at "
                    + "FROM supplies s "
                    + "JOIN restrooms r "
                    + "ON s.restroom_id = r.restroom_id "
                    + "ORDER BY s.checked_at DESC";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            request.setAttribute(
                    "supplyResult",
                    rs
            );


            /*
             * -----------------------------------
             * OPEN JSP
             * -----------------------------------
             */

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "supplies.jsp"
                    );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html"
            );

            response.getWriter().println(
                    "<h2>SantiHer Supply Database Error</h2>"
            );

            response.getWriter().println(
                    "<p>"
                    + e.getMessage()
                    + "</p>"
            );

        }

    }

}