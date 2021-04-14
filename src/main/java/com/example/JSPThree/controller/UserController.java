package com.example.JSPThree.controller;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import com.example.JSPThree.model.User;

import com.example.JSPThree.db.DBConnection;

public class UserController {
    public static int addUser(User users) throws SQLException {
        String sql = "INSERT INTO users (username, password, fullname, email) VALUES ('" + users.getUsername() + "','" + users.getPassword() + "','" + users.getFullname() + "','" + users.getEmail() + "')";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int deleteUser(int id) throws SQLException {
        String sql = "DELETE FROM users WHERE user_id='" + id + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int updateUser(User users) throws SQLException {
        String sql = "UPDATE users SET username='" + users.getUsername() + "', password='" + users.getPassword() + "', fullname='" + users.getFullname() + "', email='" + users.getEmail() + "' WHERE user_id='" + users.getUser_id() + "'";
        System.out.println(sql);
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static User selectUser(int id) throws SQLException {
        User user = null;
        String sql = "SELECT user_id, username, password, fullname, email FROM users WHERE user_id='" + id + "'";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                user = new User(rs.getInt("user_id"),rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static List<User> getUserList() {
        List<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            User user;
            while (rs.next()) {
                user = new User(rs.getInt("user_id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"), rs.getString("email"));
                userList.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return userList;
    }
}
