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

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

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

        Users user = new Users(name, email, password, phone, plan);
        userService.registerUser(user);
        
        model.addAttribute("message", "Registration successful!");
        return "User-login"; // Redirect to login page after registration
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
            session.setAttribute("loggedInUser", user); // Store user in session
            return "redirect:/user/dashboard"; // Redirect to dashboard after login
        } else {
            model.addAttribute("message", "Invalid email or password!");
            return "User-login"; // Stay on login page with error message
        }
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpSession session, Model model) {
        Users user = (Users) session.getAttribute("loggedInUser");
        
        if (user == null) {
            return "redirect:/user/login"; // Redirect if not logged in
        }
        
        model.addAttribute("user", user);
        return "User-dashboard"; // Show the dashboard
    }

    @GetMapping("/logout")
    public String logoutUser(HttpSession session) {
        session.invalidate(); // Destroy session
        return "redirect:/user/login?logout=true"; // Redirect to login page
    }
}
