package com.model;

import java.sql.Timestamp;

public class Signin {
    private int signinID;
    private Timestamp time;
    private String ip;
    private String ua;
    private User user;

    public int getSigninID() {
        return signinID;
    }

    public void setSigninID(int signinID) {
        this.signinID = signinID;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getUa() {
        return ua;
    }

    public void setUa(String ua) {
        this.ua = ua;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
