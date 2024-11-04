package com.book.service;

import jakarta.servlet.http.HttpSession;

public interface UserService {
    boolean auth(String username, String password, String role, HttpSession session);
}
