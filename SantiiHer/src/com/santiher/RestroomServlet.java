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

@WebServlet("/RestroomServlet")
public class RestroomServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =====================================================
    // GET METHOD
    // DISPLAY RESTROOMS + DELETE
    // =====================================================

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            String action =
                    request.getParameter("action");


            // =================================================
            // DELETE RESTROOM
            // =================================================

            if ("delete".equals(action)) {

                String id =
                        request.getParameter("id");

                con = DBConnection.getConnection();

                String deleteSql =
                        "DELETE FROM restrooms WHERE restroom_id = ?";

                ps = con.prepareStatement(deleteSql);

                ps.setInt(1, Integer.parseInt(id));

                ps.executeUpdate();

                response.sendRedirect("RestroomServlet");

                return;
            }


            // =================================================
            // DISPLAY RESTROOMS
            // =================================================

            con = DBConnection.getConnection();

            String sql =
                    "SELECT * FROM restrooms";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();

            request.setAttribute(
                    "restroomResult",
                    rs
            );

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "restrooms.jsp"
                    );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>SantiHer Database Error</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
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


    // =====================================================
    // POST METHOD
    // ADD + UPDATE RESTROOM
    // =====================================================

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            // =================================================
            // GET FORM VALUES
            // =================================================

            String restroomId =
                    request.getParameter(
                            "restroom_id"
                    );

            String restroomName =
                    request.getParameter(
                            "restroom_name"
                    );

            String blockName =
                    request.getParameter(
                            "block_name"
                    );

            String floorName =
                    request.getParameter(
                            "floor_name"
                    );

            String gender =
                    request.getParameter(
                            "gender"
                    );

            String status =
                    request.getParameter(
                            "cleanliness_status"
                    );

            String assignedStaff =
                    request.getParameter(
                            "assigned_staff"
                    );


            // =================================================
            // CONNECT TO DATABASE
            // =================================================

            con = DBConnection.getConnection();


            // =================================================
            // UPDATE EXISTING RESTROOM
            // =================================================

            if (restroomId != null &&
                !restroomId.trim().equals("")) {


                String updateSql =
                        "UPDATE restrooms SET "
                        + "restroom_name = ?, "
                        + "block_name = ?, "
                        + "floor_name = ?, "
                        + "gender = ?, "
                        + "cleanliness_status = ?, "
                        + "assigned_staff = ? "
                        + "WHERE restroom_id = ?";


                ps = con.prepareStatement(
                        updateSql
                );


                ps.setString(
                        1,
                        restroomName
                );


                ps.setString(
                        2,
                        blockName
                );


                ps.setString(
                        3,
                        floorName
                );


                ps.setString(
                        4,
                        gender
                );


                ps.setString(
                        5,
                        status
                );


                ps.setString(
                        6,
                        assignedStaff
                );


                ps.setInt(
                        7,
                        Integer.parseInt(
                                restroomId
                        )
                );


                ps.executeUpdate();


                System.out.println(
                        "Restroom Updated Successfully!"
                );


            }


            // =================================================
            // ADD NEW RESTROOM
            // =================================================

            else {


                String insertSql =
                        "INSERT INTO restrooms "
                        + "(restroom_name, block_name, "
                        + "floor_name, gender, "
                        + "cleanliness_status, "
                        + "assigned_staff) "
                        + "VALUES (?, ?, ?, ?, ?, ?)";


                ps = con.prepareStatement(
                        insertSql
                );


                ps.setString(
                        1,
                        restroomName
                );


                ps.setString(
                        2,
                        blockName
                );


                ps.setString(
                        3,
                        floorName
                );


                ps.setString(
                        4,
                        gender
                );


                ps.setString(
                        5,
                        status
                );


                ps.setString(
                        6,
                        assignedStaff
                );


                ps.executeUpdate();


                System.out.println(
                        "Restroom Added Successfully!"
                );

            }


            // =================================================
            // RETURN TO RESTROOM PAGE
            // =================================================

            response.sendRedirect(
                    "RestroomServlet"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Unable to Process Restroom</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
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