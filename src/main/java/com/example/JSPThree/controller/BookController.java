package com.example.JSPThree.controller;

import com.example.JSPThree.db.DBConnection;
import com.example.JSPThree.model.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookController {
    public static int addBook(Book books) throws SQLException {
        String sql = "INSERT INTO books (username, train, station, `time`) VALUES ('" + books.getUsername() + "','" + books.getTrain() + "','" + books.getStation() + "','" + books.getTime() + "')";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int deleteBook(int id) throws SQLException {
        String sql = "DELETE FROM books WHERE book_id='" + id + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int updateBook(Book books) throws SQLException {
        String sql = "UPDATE books SET username='" + books.getUsername() + "', train='" + books.getTrain() + "', station='" + books.getStation() + "', `time`='" + books.getTime() + "' WHERE book_id='" + books.getBook_id() + "'";
        System.out.println(sql);
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static Book selectBook(int id) throws SQLException {
        Book book = null;
        String sql = "SELECT book_id, username, train, station, `time` FROM books WHERE book_id='" + id + "'";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                book = new Book(rs.getInt("book_id"),rs.getString("username"), rs.getString("train"), rs.getString("station"), rs.getString("time"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return book;
    }

    public static List<Book> getBookList() {
        List<Book> bookList = new ArrayList<>();
        String sql = "SELECT * FROM books";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            Book book;
            while (rs.next()) {
                book = new Book(rs.getInt("book_id"), rs.getString("username"), rs.getString("train"), rs.getString("station"), rs.getString("time"));
                bookList.add(book);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookList;
    }
}
