package com.service;

import com.dao.SigninDao;
import com.dao.impl.SigninDaoImpl;
import com.model.Signin;
import com.model.User;

import java.sql.SQLException;
import java.util.ArrayList;

public class SigninService {
    private SigninDao signinDao = new SigninDaoImpl();
    public boolean insertSignin (Signin signin) {
        return signinDao.insertSignin(signin);
    }
    public ArrayList<Signin> selectAllSignin(int page,int limit) throws SQLException {
        return signinDao.selectAllSignin(page,limit);
    }
    public ArrayList<User> selectDoYouSignin() throws SQLException {
        return signinDao.selectDoYouSignin();
    }
}
