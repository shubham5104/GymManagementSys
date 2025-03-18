package com.gymmanagement.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gymmanagement.entity.Admin;
import com.gymmanagement.entity.Users;
import com.gymmanagement.repository.AdminRepository;
import com.gymmanagement.repository.UserRepository;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminRepository adminRepository;

    @Autowired
    private UserRepository userRepository;

    @Override
    public Admin authenticateAdmin(String email, String password) {
        return adminRepository.findByEmailAndPassword(email, password);
    }

    @Override
    public Admin registerAdmin(Admin admin) {
        if (adminRepository.findByEmail(admin.getEmail()) != null) {
            return null; // Admin already exists
        }
        return adminRepository.save(admin);
    }

    @Override
    public List<Admin> getAllAdmins() {
        return adminRepository.findAll();
    }

    @Override
    public List<Users> getAllMembers() {
        return userRepository.findAll(); // Fetch all members from the database
    }
    @Override
    public Users addMember(Users user) {
        return userRepository.save(user);
    }

    @Override
    public void deleteMember(int id) {
        userRepository.deleteById(id);
    }

    @Override
    public void blockMember(int id) {
        Users user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setActive(false);
            userRepository.save(user);
        }
    }

    @Override
    public void activateMember(int id) {
        Users user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setActive(true);
            userRepository.save(user);
        }
    }
}
