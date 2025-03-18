package com.gymmanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gymmanagement.entity.Users;
import com.gymmanagement.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public void registerUser(Users user) {
        userRepository.save(user);
    }

    @Override
    public boolean isEmailRegistered(String email) {
        return userRepository.findByEmail(email) != null;
    }

    @Override
    public Users authenticateUser(String email, String password) {
        Users user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user; // Successful login
        }
        return null; // Login failed
    }
}
