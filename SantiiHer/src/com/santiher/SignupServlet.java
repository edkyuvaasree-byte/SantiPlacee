
package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;

        try {

            /* ================= GET FORM DATA ================= */

            String fullName =
                request.getParameter("full_name");

            String email =
                request.getParameter("email");

            String password =
                request.getParameter("password");


            /* ================= BASIC VALIDATION ================= */

            if (fullName == null ||
                email == null ||
                password == null ||
                fullName.trim().isEmpty() ||
                email.trim().isEmpty() ||
                password.trim().isEmpty()) {

                response.setContentType("text/html");

                response.getWriter().println(
                    "<h2>Signup Error</h2>"
                );

                response.getWriter().println(
                    "<p>All fields are required.</p>"
                );

                response.getWriter().println(
                    "<br><a href='signup.jsp'>Back to Signup</a>"
                );

                return;
            }


            /* ================= DATABASE CONNECTION ================= */

            con = DBConnection.getConnection();


            /* ================= INSERT USER ================= */

            String sql =
                "INSERT INTO users " +
                "(full_name, email, password, role) " +
                "VALUES (?, ?, ?, ?)";

            ps = con.prepareStatement(sql);

            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.setString(4, "User");

            ps.executeUpdate();


            /* ================= SUCCESS ================= */

            response.sendRedirect("login.jsp?signup=success");


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<html>"
                + "<head>"
                + "<title>SantiHer Signup Error</title>"
                + "</head>"
                + "<body>"
                + "<h2>SantiHer Signup Error</h2>"
                + "<p>" + e.getMessage() + "</p>"
                + "<br>"
                + "<a href='signup.jsp'>Back to Signup</a>"
                + "</body>"
                + "</html>"
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

