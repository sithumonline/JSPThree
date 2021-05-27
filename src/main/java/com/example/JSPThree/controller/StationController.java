package com.example.JSPThree.controller;

import com.example.JSPThree.db.DBConnection;
import com.example.JSPThree.model.Station;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StationController {
    public static int addStation(Station stations) throws SQLException {
        String sql = "INSERT INTO stations (stationname, province, geography_type, block_type) VALUES ('" + stations.getStationname() + "','" + stations.getProvince() + "','" + stations.getBbb() + "','" + stations.getBlockType() + "')";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int deleteStation(int id) throws SQLException {
        String sql = "DELETE FROM stations WHERE station_id='" + id + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static int updateStation(Station stations) throws SQLException {
        String sql = "UPDATE stations SET stationname='" + stations.getStationname() + "', province='" + stations.getProvince() + "', geography_type='" + stations.getBbb() + "', block_type='" + stations.getBlockType() + "' WHERE station_id='" + stations.getStation_id() + "'";
        DBConnection conn = DBConnection.getDBConnection();
        Connection stm = conn.getConnection();
        PreparedStatement runSql = stm.prepareStatement(sql);
        return runSql.executeUpdate();
    }

    public static Station selectStation(int id) throws SQLException {
        Station station = null;
        String sql = "SELECT station_id, stationname, province, geography_type, block_type FROM stations WHERE station_id='" + id + "'";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            while (rs.next()) {
                station = new Station(rs.getInt("station_id"), rs.getString("stationname"), rs.getString("province"), rs.getString("geography_type"), rs.getString("block_type"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return station;
    }

    public static List<Station> getStationList() {
        List<Station> stationList = new ArrayList<>();
        String sql = "SELECT * FROM stations";
        Statement st;
        ResultSet rs;

        try {
            st = DBConnection.getDBConnection().getCreateStatement();
            rs = st.executeQuery(sql);
            Station station;
            while (rs.next()) {
                station = new Station(rs.getInt("station_id"), rs.getString("stationname"), rs.getString("province"), rs.getString("geography_type"), rs.getString("block_type"));
                stationList.add(station);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return stationList;
    }
}
