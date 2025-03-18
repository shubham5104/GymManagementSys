package com.gymmanagement.service;

import com.gymmanagement.entity.Users;

public interface UserService {
	
    void registerUser(Users user);
    boolean isEmailRegistered(String email);
    Users authenticateUser(String email, String password); // New method
}
