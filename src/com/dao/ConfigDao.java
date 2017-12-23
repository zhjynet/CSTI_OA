package com.dao;

import com.model.Config;
import com.model.Signin;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ConfigDao {
    ArrayList<Config> selectAllConfig() throws SQLException;

}
