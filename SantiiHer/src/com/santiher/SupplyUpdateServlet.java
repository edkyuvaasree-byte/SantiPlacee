package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SupplyUpdateServlet")
public class SupplyUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            /*
             * ==========================================
             * GET FORM VALUES
             * ==========================================
             */

            int supplyId =
                    Integer.parseInt(
                            request.getParameter("supply_id")
                    );

            String soap =
                    request.getParameter("soap_status");

            String tissue =
                    request.getParameter("tissue_status");

            String water =
                    request.getParameter("water_status");

            String bin =
                    request.getParameter(
                            "sanitary_bin_status"
                    );


            /*
             * ==========================================
             * DATABASE CONNECTION
             * ==========================================
             */

            con = DBConnection.getConnection();


            /*
             * ==========================================
             * UPDATE SUPPLIES TABLE
             * ==========================================
             */

            String sql =
                    "UPDATE supplies SET "
                    + "soap_status = ?, "
                    + "tissue_status = ?, "
                    + "water_status = ?, "
                    + "sanitary_bin_status = ?, "
                    + "checked_at = NOW() "
                    + "WHERE supply_id = ?";


            ps = con.prepareStatement(sql);


            ps.setString(1, soap);

            ps.setString(2, tissue);

            ps.setString(3, water);

            ps.setString(4, bin);

            ps.setInt(5, supplyId);


            /*
             * ==========================================
             * EXECUTE UPDATE
             * ==========================================
             */

            int result =
                    ps.executeUpdate();


            /*
             * ==========================================
             * CHECK RESULT
             * ==========================================
             */

            if (result > 0) {

                System.out.println(
                        "Supply updated successfully!"
                );

            } else {

                System.out.println(
                        "Supply update failed!"
                );
            }


            /*
             * ==========================================
             * RETURN TO SUPPLY PAGE
             * ==========================================
             */

            response.sendRedirect(
                    "SupplyServlet"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                    "text/html"
            );

            response.getWriter().println(
                    "<h2>SantiHer Supply Update Error</h2>"
            );

            response.getWriter().println(
                    "<p>"
                    + e.getMessage()
                    + "</p>"
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