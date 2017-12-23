package com.dao.impl;

import com.dao.UserDao;
import com.model.Group;
import com.model.User;
import com.util.JDBCUtil;

import javax.servlet.ServletContext;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.TimerTask;

public class UserDaoImpl implements UserDao {
    @Override
    //登录
    public User login(int studentNumber, String password) {
        User user = null;
        //String sql1 ="select * from users inner join groups on users.groupid = groups.id where student_number = ? and password = ?";
        String sql = "select * from users,groups where users.groupid = groups.id and student_number = ? and password = ?";
        ResultSet rs = JDBCUtil.executeQuery(sql,studentNumber,password);
        try {
            while (rs.next()){
                Group group = new Group();
                group.setGroupID(rs.getInt(5));
                group.setGroup(rs.getString(9));
                user = new User();
                user.setUserID(rs.getInt(1));
                user.setStudentNumber(rs.getInt(2));
                user.setName(rs.getString(3));
                user.setPassword(rs.getString(4));
                user.setIssignintoday(rs.getInt(6));
                user.setSmallgroup(rs.getInt(7));
                user.setGroup(group);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return user;
        }
    }



}
