package com.gymmanagement.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gymmanagement.entity.Users;
import com.gymmanagement.service.UserService;
import com.gymmanagement.service.PlanService;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private PlanService planService;

    @GetMapping("/register")
    public String showRegistrationForm() {
        return "User-register";
    }

    @PostMapping("/register")
    public String registerUser(
            @RequestParam String name,
            @RequestParam String email,
            @RequestParam String password,
            @RequestParam String phone,
            @RequestParam String plan,
            Model model) {

        if (userService.isEmailRegistered(email)) {
            model.addAttribute("message", "Email already registered!");
            return "User-register";
        }

        userService.registerUser(new Users(name, email, password, phone, plan));
        model.addAttribute("message", "Registration successful!");
        return "User-login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "User-login";
    }

    @PostMapping("/login")
    public String loginUser(
            @RequestParam String email,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        Users user = userService.authenticateUser(email, password);
        
        if (user != null) {
            session.setAttribute("loggedInUser", user);
            return "redirect:/user/dashboard";
        }

        model.addAttribute("message", "Invalid email or password!");
        return "User-login";
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        
        if (user == null) {
            return "redirect:/user/login";
        }

        model.addAttribute("user", user);
        return "User-dashboard";
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.invalidate();
        return "redirect:/user/login?logout=true";
    }
}
