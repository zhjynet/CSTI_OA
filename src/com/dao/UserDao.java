package com.dao;

import com.model.User;

public interface UserDao {
    User login(int studentNumber, String password);
}
