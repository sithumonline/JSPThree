package com.example.JSPThree.model;

public class Book {

    private int book_id;
    private String username;
    private String train;
    private String station;
    private String time;

    public Book(int book_id, String username, String train, String station, String time) {
        this.book_id = book_id;
        this.username = username;
        this.train = train;
        this.station = station;
        this.time = time;
    }

    public Book(String username, String train, String station, String time) {
        this.username = username;
        this.train = train;
        this.station = station;
        this.time = time;
    }

    public Book() {
    }

    public int getBook_id() {
        return book_id;
    }

    public String getUsername() {
        return username;
    }

    public String getTrain() {
        return train;
    }

    public String getStation() {
        return station;
    }

    public String getTime() {
        return time;
    }
}
