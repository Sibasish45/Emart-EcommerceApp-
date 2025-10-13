package com.giet.dao;

import com.giet.models.User;
import com.giet.utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

    // Register user
    public boolean registerUser(User user) {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO users(name,email,password_hash,phone) VALUES (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPasswordHash());
            ps.setString(4, user.getPhone());
            

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.out.println("❌ Registration error: " + e.getMessage());
            e.printStackTrace();
            System.out.println("Registering: " + user.getName() + ", " + user.getEmail() + ", " + user.getPhone() + ", " + user.getRole());

        }
        return false;
    }

    // Login user
    public User login(String email, String password) {
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "SELECT * FROM users WHERE email=? AND password_hash=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setEmail(rs.getString("email"));
                u.setPasswordHash(rs.getString("password_hash"));
                u.setPhone(rs.getString("phone"));
                return u;
            }
        } catch (Exception e) {
            System.out.println("❌ Login error: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}