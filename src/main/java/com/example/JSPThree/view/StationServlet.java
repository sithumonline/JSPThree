package com.example.JSPThree.view;

import com.example.JSPThree.controller.StationController;
import com.example.JSPThree.model.Station;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/station/*")
public class StationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Station stationDAO;

    public void init() {
        stationDAO = new Station();
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
                    insertStation(request, response);
                    break;
                case "/delete":
                    deleteStation(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateStation(request, response);
                    break;
                default:
                    listStation(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    public static void listStation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Station> listStation = StationController.getStationList();
        request.setAttribute("listStation", listStation);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../station-list.jsp");
        dispatcher.forward(request, response);
    }

    public static void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../station-form.jsp");
        dispatcher.forward(request, response);
    }

    public static void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Station existingStation = StationController.selectStation(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../station-form.jsp");
        request.setAttribute("station", existingStation);
        dispatcher.forward(request, response);
    }

    public static void insertStation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String stationname = request.getParameter("stationname");
        String province = request.getParameter("province");
        String geography_type = request.getParameter("geography_type");
        String block_type = request.getParameter("block_type");
        Station newStation = new Station(stationname, province, geography_type, block_type);
        StationController.addStation(newStation);
        response.sendRedirect("list");
    }

    public static void updateStation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String stationname = request.getParameter("stationname");
        String province = request.getParameter("province");
        String geography_type = request.getParameter("geography_type");
        String block_type = request.getParameter("block_type");
        Station station = new Station(id, stationname, province, geography_type, block_type);
        StationController.updateStation(station);
        response.sendRedirect("list");
    }

    public static void deleteStation(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        StationController.deleteStation(id);
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}