package com.funfit.models;

public class Batch {

    private int bid;
    private String name;
    private String time; 

    public Batch() {
 
    }

    public Batch(int bid, String name, String time) {
        this.bid = bid;
        this.name = name;
        this.time = time;
    }

    public int getBid() {
        return bid;
    }

    public void setBid(int bid) {
        this.bid = bid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}
