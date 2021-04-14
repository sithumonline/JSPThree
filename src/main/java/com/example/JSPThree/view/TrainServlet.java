package com.example.JSPThree.view;

import com.example.JSPThree.controller.TrainController;
import com.example.JSPThree.model.Train;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/train/*")
public class TrainServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Train trainDAO;

    public void init() {
        trainDAO = new Train();
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
                    insertTrain(request, response);
                    break;
                case "/delete":
                    deleteTrain(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateTrain(request, response);
                    break;
                default:
                    listTrain(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    public static void listTrain(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Train> listTrain = TrainController.getTrainList();
        request.setAttribute("listTrain", listTrain);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../train-list.jsp");
        dispatcher.forward(request, response);
    }

    public static void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../train-form.jsp");
        dispatcher.forward(request, response);
    }

    public static void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Train existingTrain = TrainController.selectTrain(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../train-form.jsp");
        request.setAttribute("train", existingTrain);
        dispatcher.forward(request, response);
    }

    public static void insertTrain(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String trainname = request.getParameter("trainname");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String type = request.getParameter("type");
        Train newTrain = new Train(trainname, from, to, type);
        TrainController.addTrain(newTrain);
        response.sendRedirect("list");
    }

    public static void updateTrain(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String trainname = request.getParameter("trainname");
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String type = request.getParameter("type");
        Train train = new Train(id, trainname, from, to, type);
        TrainController.updateTrain(train);
        response.sendRedirect("list");
    }

    public static void deleteTrain(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        TrainController.deleteTrain(id);
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}