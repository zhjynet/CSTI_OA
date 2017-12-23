package com.dao;

import com.model.Signin;
import com.model.User;

import java.sql.SQLException;
import java.util.ArrayList;

public interface SigninDao {
    Boolean insertSignin(Signin signin);
    ArrayList<Signin> selectAllSignin(int page,int limit) throws SQLException;
    ArrayList<User> selectDoYouSignin() throws SQLException;
}
