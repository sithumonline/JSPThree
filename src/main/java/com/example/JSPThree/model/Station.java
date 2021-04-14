package com.example.JSPThree.model;

public class Station {

    private int station_id;
    private String stationname;
    private String aaa;
    private String bbbb;
    private String ccc;

    public Station(int station_id, String stationname, String aaa, String bbbb, String ccc) {
        this.station_id = station_id;
        this.stationname = stationname;
        this.aaa = aaa;
        this.bbbb = bbbb;
        this.ccc = ccc;
    }

    public Station(String stationname, String aaa, String bbbb, String ccc) {
        this.stationname = stationname;
        this.aaa = aaa;
        this.bbbb = bbbb;
        this.ccc = ccc;
    }

    public Station() {
    }

    public int getStation_id() {
        return station_id;
    }

    public String getStationname() {
        return stationname;
    }

    public String getAaa() {
        return aaa;
    }

    public String getBbb() {
        return bbbb;
    }

    public String getCcc() {
        return ccc;
    }
}
