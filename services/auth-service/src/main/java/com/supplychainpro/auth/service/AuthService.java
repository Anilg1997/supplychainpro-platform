package com.supplychainpro.auth.service;

import com.supplychainpro.auth.dto.AuthResponse;
import com.supplychainpro.auth.dto.LoginRequest;
import com.supplychainpro.auth.dto.RegisterRequest;

public interface AuthService {

    AuthResponse register(RegisterRequest request);

    AuthResponse login(LoginRequest request);

    AuthResponse refreshToken(String refreshToken);

    void logout(String refreshToken);

    AuthResponse getCurrentUser(String userId);
}
