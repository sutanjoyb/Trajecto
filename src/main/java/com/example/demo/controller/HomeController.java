package com.example.demo.controller;

import com.example.demo.model.Ticket;
import com.example.demo.model.User;
import com.example.demo.service.TicketService;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import java.util.List;

@Controller
@SessionAttributes("user")
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private TicketService ticketService;

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @PostMapping("/register-action")
    public String handleRegister(@RequestParam String fullName,
            @RequestParam String email,
            @RequestParam String password,
            Model model) {
        boolean success = userService.registerUser(fullName, email, password);
        if (success) {
            model.addAttribute("successMessage", "Registration successful! Please login.");
            return "login";
        } else {
            model.addAttribute("errorMessage", "Email is already registered.");
            return "login";
        }
    }

    @PostMapping("/login-action")
    public String handleLogin(@RequestParam String email,
            @RequestParam String password,
            Model model) {
        User user = userService.authenticate(email, password);
        if (user != null) {
            model.addAttribute("user", user);
            List<Ticket> tickets = ticketService.getTicketsForUser(user.getFullName());
            model.addAttribute("tickets", tickets);
            return "dashboard";
        } else {
            model.addAttribute("errorMessage", "Invalid email or password.");
            return "login";
        }
    }

    @PostMapping("/book-ticket")
    public String handleBooking(
            @RequestParam("trainName") String trainName,
            @RequestParam("travelDate") String travelDate,
            @RequestParam("passengerName") String passengerName,
            HttpSession session,
            Model model) {

        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        ticketService.bookTicket(user.getEmail(), passengerName, trainName, travelDate);

        model.addAttribute("bookingSuccess", "Ticket successfully booked!");
        model.addAttribute("tickets", ticketService.getTicketsForUser(user.getEmail()));
        model.addAttribute("user", user);

        return "dashboard";
    }

    @GetMapping("/book-ticket")
    public String bookTicketGetRedirect(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("tickets", ticketService.getTicketsForUser(user.getEmail()));
        model.addAttribute("user", user);
        return "dashboard";
    }

    @PostMapping("/delete-ticket")
    @ResponseBody
    public String deleteTicket(@RequestParam("pnr") String pnr, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "unauthorized";
        }
        ticketService.deleteTicket(user.getEmail(), pnr);
        return "success";
    }
}