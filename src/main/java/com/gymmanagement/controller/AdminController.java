package com.gymmanagement.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

import com.gymmanagement.entity.Admin;
import com.gymmanagement.entity.Plan;
import com.gymmanagement.entity.Users;
import com.gymmanagement.service.AdminService;
import com.gymmanagement.service.PlanService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private PlanService planService;

    @GetMapping("/login")
    public String showAdminLoginPage() {
        return "Admin-login";
    }

    @PostMapping("/login")
    public String loginAdmin(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
        Admin admin = adminService.authenticateAdmin(email, password);
        
        if (admin != null) {
            session.setAttribute("loggedInAdmin", admin);
            return "redirect:/admin/dashboard";
        }

        model.addAttribute("message", "Invalid email or password!");
        return "Admin-login";
    }

    @GetMapping("/logout")
    public String logoutAdmin(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login?logout=true";
    }

    @GetMapping("/dashboard")
    public String showAdminDashboard(HttpSession session, Model model) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        List<Plan> plans = planService.getAllPlans();
        model.addAttribute("plans", plans);

        return "Admin-dashboard";
    }

    @PostMapping("/register")
    public String registerAdmin(@RequestParam String name, @RequestParam String email, @RequestParam String password, Model model) {
        Admin admin = new Admin(name, email, password);
         
        if (adminService.registerAdmin(admin) == null) {
            model.addAttribute("message", "Admin already exists!");
            return "Admin-register";
        }
        
        model.addAttribute("success", "Admin registered successfully!");
        return "Admin-login";
    }

    @GetMapping("/register")
    public String showAdminRegisterPage() {
        return "Admin-register";
    }

    @GetMapping("/members")
    public String viewMembers(Model model, HttpSession session) {
        if (session.getAttribute("loggedInAdmin") == null) {
            return "redirect:/admin/login";
        }

        model.addAttribute("members", adminService.getAllMembers());
        model.addAttribute("plans", planService.getAllPlans());
        
        return "Admin-members";
    }

    @PostMapping("/addMember")
    public String addMember(@RequestParam String name, @RequestParam String email,
                            @RequestParam String password, @RequestParam String phone,
                            @RequestParam String plan) {
        adminService.addMember(new Users(name, email, password, phone, plan));
        return "redirect:/admin/members";
    }

    @PostMapping("/deleteMember")
    public String deleteMember(@RequestParam int id) {
        adminService.deleteMember(id);
        return "redirect:/admin/members";
    }

    @PostMapping("/blockMember")
    public String blockMember(@RequestParam int id) {
        adminService.blockMember(id);
        return "redirect:/admin/members";
    }

    @PostMapping("/activateMember")
    public String activateMember(@RequestParam int id) {
        adminService.activateMember(id);
        return "redirect:/admin/members";
    }
}
