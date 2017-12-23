package com.dao.impl;

import com.dao.ConfigDao;
import com.model.Config;
import com.model.Signin;
import com.util.JDBCUtil;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConfigDaoImpl implements ConfigDao{
    @Override
    public ArrayList<Config> selectAllConfig() throws SQLException {
        ArrayList<Config> configs = new ArrayList<Config>();
        Config config;
        String sql = "select * from configs";
        ResultSet rs = JDBCUtil.executeQuery(sql);
        try {
            while (rs.next()){
                config = new Config();
                config.setId(rs.getInt(1));
                config.setName(rs.getString(2));
                config.setValue(rs.getString(3));
                configs.add(config);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            return configs;
        }
    }
}
