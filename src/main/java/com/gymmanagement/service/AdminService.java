package com.gymmanagement.service;

import com.gymmanagement.entity.Admin;
import com.gymmanagement.entity.Users;

import java.util.List;

public interface AdminService {
    Admin authenticateAdmin(String email, String password);
    Admin registerAdmin(Admin admin);
    List<Admin> getAllAdmins();  // If you want to manage multiple admins in the future
	List<Users> getAllMembers();
	    Users addMember(Users user);
	    void deleteMember(int id);
	    void blockMember(int id);
	    void activateMember(int id);
}
