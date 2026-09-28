
package com.santiher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {

            /* ================= GET LOGIN DATA ================= */

            String email =
                request.getParameter("email");

            String password =
                request.getParameter("password");


            /* ================= VALIDATION ================= */

            if (email == null ||
                password == null ||
                email.trim().isEmpty() ||
                password.trim().isEmpty()) {

                response.sendRedirect(
                    "login.jsp?error=empty"
                );

                return;
            }


            /* ================= DATABASE ================= */

            con = DBConnection.getConnection();


            /* ================= CHECK USER ================= */

            String sql =
                "SELECT user_id, full_name, email, role " +
                "FROM users " +
                "WHERE email = ? AND password = ?";

            ps = con.prepareStatement(sql);

            ps.setString(1, email);
            ps.setString(2, password);

            rs = ps.executeQuery();


            /* ================= LOGIN SUCCESS ================= */

            if (rs.next()) {

                int userId =
                    rs.getInt("user_id");

                String fullName =
                    rs.getString("full_name");

                String userEmail =
                    rs.getString("email");

                String role =
                    rs.getString("role");


                /* ================= SESSION ================= */

                HttpSession session =
                    request.getSession();

                session.setAttribute(
                    "user_id",
                    userId
                );

                session.setAttribute(
                    "full_name",
                    fullName
                );

                session.setAttribute(
                    "email",
                    userEmail
                );

                session.setAttribute(
                    "role",
                    role
                );


                /* ================= GO TO DASHBOARD ================= */

                response.sendRedirect(
                    "DashboardServlet"
                );


            } else {

                /* ================= INVALID LOGIN ================= */

                response.sendRedirect(
                    "login.jsp?error=invalid"
                );

            }


        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html"
            );

            response.getWriter().println(
                "<html>"
                + "<head>"
                + "<title>SantiHer Login Error</title>"
                + "</head>"
                + "<body>"
                + "<h2>SantiHer Login Error</h2>"
                + "<p>" + e.getMessage() + "</p>"
                + "<br>"
                + "<a href='login.jsp'>Back to Login</a>"
                + "</body>"
                + "</html>"
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

