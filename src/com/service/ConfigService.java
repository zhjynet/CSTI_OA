package com.service;

import com.dao.ConfigDao;
import com.dao.impl.ConfigDaoImpl;
import com.model.Config;
import com.model.Signin;

import java.sql.SQLException;
import java.util.ArrayList;

public class ConfigService {
    public ConfigDao configDao = new ConfigDaoImpl();
    public ArrayList<Config> selectAllConfig() throws SQLException {
        return configDao.selectAllConfig();
    }
}
