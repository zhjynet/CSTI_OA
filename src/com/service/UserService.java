package com.service;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.model.User;

public class UserService {
    public UserDao userDao = new UserDaoImpl();
    public User login(int studentNumber, String password){
        return userDao.login(studentNumber,password);
    }
}
