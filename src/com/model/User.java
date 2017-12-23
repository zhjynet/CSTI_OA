package com.model;

public class User {
    private int userID;
    private int studentNumber;
    private String name;
    private String password;
    private Group group;
    private int issignintoday;
    private int smallgroup;

    public int getSmallgroup() {
        return smallgroup;
    }

    public void setSmallgroup(int smallgroup) {
        this.smallgroup = smallgroup;
    }

    public int getIssignintoday() {
        return issignintoday;
    }

    public void setIssignintoday(int issignintoday) {
        this.issignintoday = issignintoday;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getStudentNumber() {
        return studentNumber;
    }

    public void setStudentNumber(int studentNumber) {
        this.studentNumber = studentNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }
}
