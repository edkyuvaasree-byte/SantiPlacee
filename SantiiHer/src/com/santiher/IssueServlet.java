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

@WebServlet("/IssueServlet")
public class IssueServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;


    // =====================================================
    // GET METHOD
    // DISPLAY ISSUES + DELETE ISSUE
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
            // DELETE ISSUE
            // =================================================

            if ("delete".equals(action)) {

                String id =
                        request.getParameter("id");

                con = DBConnection.getConnection();

                String deleteSql =
                        "DELETE FROM issues WHERE issue_id = ?";

                ps = con.prepareStatement(deleteSql);

                ps.setInt(
                        1,
                        Integer.parseInt(id)
                );

                ps.executeUpdate();

                response.sendRedirect("IssueServlet");

                return;
            }


            // =================================================
            // DISPLAY ISSUES
            // =================================================

            con = DBConnection.getConnection();

            String sql =
                    "SELECT i.issue_id, "
                    + "i.restroom_id, "
                    + "r.restroom_name, "
                    + "i.issue_type, "
                    + "i.description, "
                    + "i.reported_by, "
                    + "i.status, "
                    + "i.reported_at, "
                    + "i.resolved_at "
                    + "FROM issues i "
                    + "JOIN restrooms r "
                    + "ON i.restroom_id = r.restroom_id "
                    + "ORDER BY i.reported_at DESC";

            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();


            request.setAttribute(
                    "issueResult",
                    rs
            );


            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "issues.jsp"
                    );

            rd.forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>SantiHer Issue Database Error</h2>"
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
    // ADD + UPDATE ISSUE
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

            String issueId =
                    request.getParameter(
                            "issue_id"
                    );

            String restroomId =
                    request.getParameter(
                            "restroom_id"
                    );

            String issueType =
                    request.getParameter(
                            "issue_type"
                    );

            String description =
                    request.getParameter(
                            "description"
                    );

            String reportedBy =
                    request.getParameter(
                            "reported_by"
                    );

            String status =
                    request.getParameter(
                            "status"
                    );


            // =================================================
            // CONNECT TO DATABASE
            // =================================================

            con = DBConnection.getConnection();


            // =================================================
            // UPDATE ISSUE
            // =================================================

            if (issueId != null &&
                !issueId.trim().equals("")) {


                String updateSql =
                        "UPDATE issues SET "
                        + "restroom_id = ?, "
                        + "issue_type = ?, "
                        + "description = ?, "
                        + "reported_by = ?, "
                        + "status = ? "
                        + "WHERE issue_id = ?";


                ps = con.prepareStatement(
                        updateSql
                );


                ps.setInt(
                        1,
                        Integer.parseInt(
                                restroomId
                        )
                );


                ps.setString(
                        2,
                        issueType
                );


                ps.setString(
                        3,
                        description
                );


                ps.setString(
                        4,
                        reportedBy
                );


                ps.setString(
                        5,
                        status
                );


                ps.setInt(
                        6,
                        Integer.parseInt(
                                issueId
                        )
                );


                ps.executeUpdate();


                System.out.println(
                        "Issue Updated Successfully!"
                );

            }


            // =================================================
            // ADD NEW ISSUE
            // =================================================

            else {


                String insertSql =
                        "INSERT INTO issues "
                        + "(restroom_id, issue_type, "
                        + "description, reported_by, status) "
                        + "VALUES (?, ?, ?, ?, ?)";


                ps = con.prepareStatement(
                        insertSql
                );


                ps.setInt(
                        1,
                        Integer.parseInt(
                                restroomId
                        )
                );


                ps.setString(
                        2,
                        issueType
                );


                ps.setString(
                        3,
                        description
                );


                ps.setString(
                        4,
                        reportedBy
                );


                ps.setString(
                        5,
                        status
                );


                ps.executeUpdate();


                System.out.println(
                        "Issue Added Successfully!"
                );

            }


            // =================================================
            // RETURN TO ISSUE PAGE
            // =================================================

            response.sendRedirect(
                    "IssueServlet"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                    "<h2>Unable to Process Issue</h2>"
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