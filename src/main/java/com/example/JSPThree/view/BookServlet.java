package com.example.JSPThree.view;

import com.example.JSPThree.controller.BookController;
import com.example.JSPThree.model.Book;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/book/*")
public class BookServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Book bookDAO;

    public void init() {
        bookDAO = new Book();
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
                    insertBook(request, response);
                    break;
                case "/delete":
                    deleteBook(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateBook(request, response);
                    break;
                default:
                    listBook(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    public static void listBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Book> listBook = BookController.getBookList();
        request.setAttribute("listBook", listBook);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../book-list.jsp");
        dispatcher.forward(request, response);
    }

    public static void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("../book-form.jsp");
        dispatcher.forward(request, response);
    }

    public static void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("Edit " + id);
        Book existingBook = BookController.selectBook(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("../book-form.jsp");
        request.setAttribute("book", existingBook);
        dispatcher.forward(request, response);
    }

    public static void insertBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String username = request.getParameter("username");
        String train = request.getParameter("train");
        String station = request.getParameter("station");
        String time = request.getParameter("time");
        Book newBook = new Book(username, train, station, time);
        BookController.addBook(newBook);
        response.sendRedirect("list");
    }

    public static void updateBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println("upd " + id);
        String username = request.getParameter("username");
        String train = request.getParameter("train");
        String station = request.getParameter("station");
        String time = request.getParameter("time");
        Book book = new Book(id, username, train, station, time);
        BookController.updateBook(book);
        response.sendRedirect("list");
    }

    public static void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        BookController.deleteBook(id);
        response.sendRedirect("list");
    }

    public void destroy() {
    }
}