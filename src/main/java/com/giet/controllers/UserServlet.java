package com.giet.controllers;

import com.giet.dao.UserDAO;
import com.giet.models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import java.io.IOException;

public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO dao = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("register".equals(action)) {
            User u = new User();
            u.setName(req.getParameter("name"));
            u.setEmail(req.getParameter("email"));
            u.setPasswordHash(req.getParameter("password")); // raw password for now
            u.setPhone(req.getParameter("phone"));           // must match DAO

            //u.setRole(req.getParameter("role"));

            if (dao.registerUser(u)) {
                resp.sendRedirect("login.jsp");
            } else {
                resp.sendRedirect("register.jsp?error=1");
            }
        }

        if ("login".equals(action)) {
            String email = req.getParameter("email");
            String pass = req.getParameter("password");

            User u = dao.login(email, pass);

            if (u != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", u);
                resp.sendRedirect("products.jsp");
            } else {
                resp.sendRedirect("login.jsp?error=1");
            }
        }

        if ("logout".equals(action)) {
            HttpSession session = req.getSession();
            session.invalidate();
            resp.sendRedirect("login.jsp");
        }
    }
}