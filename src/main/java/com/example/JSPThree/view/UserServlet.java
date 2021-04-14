package com.example.JSPThree.view;

import java.io.*;
import java.util.List;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import com.example.JSPThree.controller.UserController;
import com.example.JSPThree.model.User;

@WebServlet("/user/*")
public class UserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private User userDAO;

    public void init() {
        userDAO = new User();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        System.out.println(action);
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String action = request.getRequestURI();
        action = action.substring(action.lastIndexOf("/")).toLowerCase();
        System.out.println(action);
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertUser(request, response);
                    break;
                case "/delete":
                    deleteUser(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateUser(request, response);
                    break;
                default:
                    listUser(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    public static void listUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<User> listUser = UserController.getUserList();
        request.setAttribute("listUser", listUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../user-list.jsp");
        dispatcher.forward(request, response);
    }

    public static void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../user-form.jsp");
        dispatcher.forward(request, response);
    }

    public static void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Edit " + id);
        User existingUser = UserController.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../user-form.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);
    }

    public static void insertUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        User newUser = new User(username, password, fullname, email);
        UserController.addUser(newUser);
        response.sendRedirect("list");
    }

    public static void updateUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("upd " + id);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        User user = new User(id, username, password, fullname, email);
        UserController.updateUser(user);
        response.sendRedirect("list");
    }

    public static void deleteUser(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        UserController.deleteUser(id);
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}