
package com.santiher;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig)
            throws ServletException {
    }


    public void doFilter(ServletRequest request,
                         ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest httpRequest =
            (HttpServletRequest) request;

        HttpServletResponse httpResponse =
            (HttpServletResponse) response;


        String requestURI =
            httpRequest.getRequestURI();

        String contextPath =
            httpRequest.getContextPath();


        /* ================= PUBLIC PAGES ================= */

        boolean isLoginPage =
            requestURI.endsWith("/login.jsp");

        boolean isSignupPage =
            requestURI.endsWith("/signup.jsp");

        boolean isLoginServlet =
            requestURI.endsWith("/LoginServlet");

        boolean isSignupServlet =
            requestURI.endsWith("/SignupServlet");


        /* ================= STATIC RESOURCES ================= */

        boolean isCss =
            requestURI.endsWith(".css");

        boolean isJs =
            requestURI.endsWith(".js");

        boolean isImage =
            requestURI.endsWith(".png") ||
            requestURI.endsWith(".jpg") ||
            requestURI.endsWith(".jpeg") ||
            requestURI.endsWith(".gif") ||
            requestURI.endsWith(".svg");


        /* ================= ALLOW PUBLIC ACCESS ================= */

        if (isLoginPage ||
            isSignupPage ||
            isLoginServlet ||
            isSignupServlet ||
            isCss ||
            isJs ||
            isImage) {

            chain.doFilter(
                request,
                response
            );

            return;
        }


        /* ================= CHECK SESSION ================= */

        HttpSession session =
            httpRequest.getSession(false);


        boolean loggedIn =
            session != null &&
            session.getAttribute("user_id") != null;


        /* ================= ALLOW LOGGED USER ================= */

        if (loggedIn) {

            chain.doFilter(
                request,
                response
            );

        } else {

            /* ================= REDIRECT TO LOGIN ================= */

            httpResponse.sendRedirect(
                contextPath + "/login.jsp"
            );

        }
    }


    public void destroy() {
    }
}

