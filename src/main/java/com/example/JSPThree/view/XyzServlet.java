package com.example.JSPThree.view;

import com.example.JSPThree.controller.XyzController;
//import com.example.JSPThree.model.Xyz;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/xyz/*")
public class XyzServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
//    private Xyz xyzDAO;
//
//    public void init() {
//        xyzDAO = new Xyz();
//    }

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
                case "/login":
                    validateLogInForm(request, response);
                    break;
                default:
                    showLogInForm(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    public static void validateLogInForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String location = "../book-list.jsp";
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        boolean status = XyzController.logIn(username, password);
        if (!status) {
            location = "../index.jsp";
            request.setAttribute("alert","Wrong User Name or Password");
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(location);
        dispatcher.forward(request, response);
    }

    public static void showLogInForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../login-form.jsp");
        dispatcher.forward(request, response);
    }

    public void destroy() {
    }
}