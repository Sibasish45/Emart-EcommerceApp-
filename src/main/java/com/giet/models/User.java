package com.giet.models;   // <-- make sure this matches your package

public class User {
    private int id;
    private String name;
    private String email;
    private String passwordHash;  // must match your DAO
    private String phone;         // <-- add this
    private String role;          // optional if needed

    // getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getPhone() { return phone; }        // <-- add this
    public void setPhone(String phone) { this.phone = phone; }  // <-- add this

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
}