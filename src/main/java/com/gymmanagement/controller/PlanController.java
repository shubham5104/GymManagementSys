package com.gymmanagement.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.gymmanagement.entity.Plan;
import com.gymmanagement.service.PlanService;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class PlanController {

    @Autowired
    private PlanService planService;

    @GetMapping("/plans")
    public String showPlansPage(Model model, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        List<Plan> plans = planService.getAllPlans();
        model.addAttribute("plans", plans);
        return "Admin-plans"; 
    }

    @PostMapping("/addPlan")
    public String addPlan(@RequestParam String name, @RequestParam double price, @RequestParam String duration) {
        Plan plan = new Plan(name, price, duration);
        planService.addPlan(plan);
        return "redirect:/admin/plans";
    }

    @PostMapping("/deletePlan")
    public String deletePlan(@RequestParam int id) {
        planService.deletePlan(id);
        return "redirect:/admin/plans";
    }
}
