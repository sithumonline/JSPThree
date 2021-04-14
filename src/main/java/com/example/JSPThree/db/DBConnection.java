package com.example.JSPThree.db;

import java.sql.*;

public class DBConnection {
    private Connection conn;
    private static DBConnection dbConnection;

    private DBConnection() {
        String dbURL = "jdbc:mysql://j00m1j6dxadx6k85:yokek3gbz6dgeuih@klbcedmmqp7w17ik.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/qef640yn8wl5y9su";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL);
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public Connection getConnection() {
        return conn;
    }

    public Statement getCreateStatement() throws SQLException {
        return conn.createStatement();
    }

    public static DBConnection getDBConnection() {
        if (dbConnection == null) {
            dbConnection = new DBConnection();
        }
        return dbConnection;
    }
}