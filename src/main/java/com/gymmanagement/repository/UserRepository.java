package com.gymmanagement.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.gymmanagement.entity.Users;

public interface UserRepository extends JpaRepository<Users, Integer> {

	Users findByEmail(String email);
	List<Users> findByIsActive(boolean isActive);
}
