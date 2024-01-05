/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * 
 */
public class User implements Serializable {

    private String firstname;
    private String lastname;
    private String username;
    private String password;
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    /**
     * Get the value of password
     *
     * @return the value of password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Set the value of password
     *
     * @param password new value of password
     */
    public void setPassword(String password) {
        this.password = MD5.getMd5(password);
    }

    /**
     * Get the value of username
     *
     * @return the value of username
     */
    public String getUsername() {
        return username;
    }

    /**
     * Set the value of username
     *
     * @param username new value of username
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * Get the value of lastname
     *
     * @return the value of lastname
     */
    public String getLastname() {
        return lastname;
    }

    /**
     * Set the value of lastname
     *
     * @param lastname new value of lastname
     */
    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    /**
     * Get the value of firstname
     *
     * @return the value of firstname
     */
    public String getFirstname() {
        return firstname;
    }

    /**
     * Set the value of firstname
     *
     * @param firstname new value of firstname
     */
    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public User() {
    }

    public boolean Register(DBConnector dao) throws Exception {
        String query;
        Connection con;
        PreparedStatement pstmt;

        con = dao.getCon();
        query = "INSERT INTO user(firstname, lastname, username, password, role) VALUES(?,?,?,?,?)";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, firstname);
        pstmt.setString(2, lastname);
        pstmt.setString(3, username);
        pstmt.setString(4, password);
        pstmt.setString(5, "user");
        int a = pstmt.executeUpdate();
        return (a > 0);

    }

    public boolean Authenticate(DBConnector dao) throws Exception {
        boolean valid_user;
        String query;
        Connection con;
        PreparedStatement pstmt;

        con = dao.getCon();
        query = "SELECT * FROM user WHERE username=?";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, username);

        ResultSet rs = pstmt.executeQuery();
        if (rs.next()) {
            if (rs.getString("password").equals(password)) {
                valid_user = true;
                firstname = rs.getString("firstname");
                lastname = rs.getString("lastname");
                role = rs.getString("role");
            } else {
                valid_user = false;
            }

        } else {
            valid_user = false;
        }

        return valid_user;

    }
}
