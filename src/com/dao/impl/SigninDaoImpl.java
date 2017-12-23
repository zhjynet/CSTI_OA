package com.dao.impl;

import com.dao.SigninDao;
import com.model.Group;
import com.model.Signin;
import com.model.User;
import com.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SigninDaoImpl implements SigninDao{

    @Override
    public Boolean insertSignin(Signin signin) {
        Boolean result;
        String sql = "insert into signin (userid,time,ip,ua) values(?,?,?,?)";
        String sqlchange = "update users set issignintoday = 1 where id = ?";
        int updateResult = JDBCUtil.executeUpdate(sql,signin.getUser().getUserID(),signin.getTime(),signin.getIp(),signin.getUa());
        if (updateResult == 0 || updateResult == -1) {
            result = false;
        } else {
            int updateResultChange = JDBCUtil.executeUpdate(sqlchange,signin.getUser().getUserID());
            result = true;
        }
        System.out.println(result);
        return result;
    }

    @Override
    public ArrayList<Signin> selectAllSignin(int page,int limit) throws SQLException {
        ArrayList<Signin> signins = new ArrayList<Signin>();
        Signin signin ;
        String sql = "select * from signin,users,groups where signin.userid = users.id and users.groupid = groups.id order by signin.id desc limit " + (page - 1) * limit + "," + limit;
        ResultSet rs = JDBCUtil.executeQuery(sql);
        try {
            while (rs.next()){
                signin = new Signin();
                User user = new User();
                Group group = new Group();
                signin.setSigninID(rs.getInt(1));
                user.setUserID(rs.getInt(2));
                signin.setTime(rs.getTimestamp(3));
                signin.setIp(rs.getString(4));
                signin.setUa(rs.getString(5));
                user.setStudentNumber(rs.getInt(7));
                user.setName(rs.getString(8));
                user.setIssignintoday(rs.getInt(11));
                user.setSmallgroup(rs.getInt(12));
                group.setGroupID(rs.getInt(10));
                group.setGroup(rs.getString(14));
                user.setGroup(group);
                signin.setUser(user);
                signins.add(signin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return signins;
        }
    }

    @Override
    public ArrayList<User> selectDoYouSignin() throws SQLException {
        ArrayList<User> users = new ArrayList<User>();
        User user;
        String sql = "select * from users,groups where users.groupid = groups.id order by users.student_number";
        ResultSet rs = JDBCUtil.executeQuery(sql);
        try {
            while (rs.next()){
                user = new User();
                Group group = new Group();
                user.setStudentNumber(rs.getInt(2));
                user.setName(rs.getString(3));
                user.setIssignintoday(rs.getInt(6));
                user.setSmallgroup(rs.getInt(7));
                group.setGroupID(rs.getInt(5));
                group.setGroup(rs.getString(9));
                user.setGroup(group);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return users;
        }
    }
}
