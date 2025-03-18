package com.gymmanagement.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.gymmanagement.entity.Plan;
import com.gymmanagement.repository.PlanRepository;

@Service
public class PlanService {

    @Autowired
    private PlanRepository planRepository;

//    public List<Plan> getAllPlans() {
//        return planRepository.findAll();
//    }

    public Plan addPlan(Plan plan) {
        return planRepository.save(plan);
    }

    public void deletePlan(int id) {
        planRepository.deleteById(id);
    }
    public List<Plan> getAllPlans() {
        List<Plan> plans = planRepository.findAll();
        return plans != null ? plans : new ArrayList<>();
    }

}
