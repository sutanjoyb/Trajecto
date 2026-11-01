package com.example.demo.service;

import com.example.demo.model.User;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;

@Service
public class UserService {
    private List<User> userDatabase = new ArrayList<>();

    public boolean registerUser(String fullName, String email, String password) {
        for (User u : userDatabase) {
            if (u.getEmail().equalsIgnoreCase(email)) {
                return false;
            }
        }
        userDatabase.add(new User(fullName, email, password));
        return true;
    }

    public User authenticate(String email, String password) {
        for (User u : userDatabase) {
            if (u.getEmail().equalsIgnoreCase(email) && u.getPassword().equals(password)) {
                return u;
            }
        }
        return null;
    }
}