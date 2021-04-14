package com.example.JSPThree.controller;

import com.example.JSPThree.db.DBConnection;
import com.example.JSPThree.model.Train;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrainController {
    public static int addTrain(Train trains) throws SQLException {
        String sql = "INSERT INTO trains (trainname, `from`, `to`, `type`) VALUES ('" + trains.getTrainname() + "','" + trains.getFrom() + "','" + trains.getTo() + "','" + trains.getType() + "')";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int deleteTrain(int id) throws SQLException {
        String sql = "DELETE FROM trains WHERE train_id='" + id + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int updateTrain(Train trains) throws SQLException {
        String sql = "UPDATE trains SET trainname='" + trains.getTrainname() + "', `from`='" + trains.getFrom() + "', `to`='" + trains.getTo() + "', `type`='" + trains.getType() + "' WHERE train_id='" + trains.getTrain_id() + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static Train selectTrain(int id) throws SQLException {
        Train train = null;
        String sql = "SELECT train_id, trainname, `from`, `to`, `type` FROM trains WHERE train_id='" + id + "'";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                train = new Train(rs.getInt("train_id"), rs.getString("trainname"), rs.getString("from"), rs.getString("to"), rs.getString("type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return train;
    }

    public static List<Train> getTrainList() {
        List<Train> trainList = new ArrayList<>();
        String sql = "SELECT * FROM trains";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            Train train;
            while (rs.next()) {
                train = new Train(rs.getInt("train_id"), rs.getString("trainname"), rs.getString("from"), rs.getString("to"), rs.getString("type"));
                trainList.add(train);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return trainList;
    }
}
