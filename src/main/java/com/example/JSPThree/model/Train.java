package com.example.JSPThree.model;

public class Train {

    private int train_id;
    private String trainname;
    private String from;
    private String to;
    private String type;

    public Train(int train_id, String trainname, String from, String to, String type) {
        this.train_id = train_id;
        this.trainname = trainname;
        this.from = from;
        this.to = to;
        this.type = type;
    }

    public Train(String trainname, String from, String to, String type) {
        this.trainname = trainname;
        this.from = from;
        this.to = to;
        this.type = type;
    }

    public Train() {
    }

    public int getTrain_id() {
        return train_id;
    }

    public String getTrainname() {
        return trainname;
    }

    public String getFrom() {
        return from;
    }

    public String getTo() {
        return to;
    }

    public String getType() {
        return type;
    }
}
