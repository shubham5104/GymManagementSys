package com.gymmanagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.gymmanagement.entity.Plan;

public interface PlanRepository extends JpaRepository<Plan, Integer> {
    Plan findByName(String name);
}
