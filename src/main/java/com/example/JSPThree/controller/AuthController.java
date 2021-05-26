package com.example.JSPThree.controller;

import com.example.JSPThree.db.DBConnection;
import com.example.JSPThree.model.User;

import java.sql.*;

public class AuthController {
    public static boolean logIn(String username, String userpass) throws SQLException {
        User user = null;
        String sql = "SELECT password FROM users WHERE username='" + username + "'";
        Statement st;
        ResultSet rs;
        String password;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                password = (rs.getString("password"));
                if (password.isEmpty()) {
                    return false;
                } else {
                    if (password.equals(userpass)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
