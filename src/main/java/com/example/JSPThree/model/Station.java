package com.example.JSPThree.model;

public class Station {

    private int station_id;
    private String stationname;
    private String province;
    private String geographyType;
    private String blockType;

    public Station(int station_id, String stationname, String province, String geographyType, String blockType) {
        this.station_id = station_id;
        this.stationname = stationname;
        this.province = province;
        this.geographyType = geographyType;
        this.blockType = blockType;
    }

    public Station(String stationname, String province, String geographyType, String blockType) {
        this.stationname = stationname;
        this.province = province;
        this.geographyType = geographyType;
        this.blockType = blockType;
    }

    public Station() {
    }

    public int getStation_id() {
        return station_id;
    }

    public String getStationname() {
        return stationname;
    }

    public String getProvince() {
        return province;
    }

    public String getGeographyType() {
        return geographyType;
    }

    public String getBlockType() {
        return blockType;
    }
}
