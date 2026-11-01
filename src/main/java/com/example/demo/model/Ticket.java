package com.example.demo.model;

public class Ticket {
    private String pnr;
    private String passengerName;
    private String trainName;
    private String travelDate;
    private String status;

    public Ticket(String pnr, String passengerName, String trainName, String travelDate, String status) {
        this.pnr = pnr;
        this.passengerName = passengerName;
        this.trainName = trainName;
        this.travelDate = travelDate;
        this.status = status;
    }

    public String getPnr() {
        return pnr;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public String getTrainName() {
        return trainName;
    }

    public String getTravelDate() {
        return travelDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}