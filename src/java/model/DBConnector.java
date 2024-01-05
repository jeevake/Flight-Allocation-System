/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * 
 */
public class DBConnector implements Serializable{

    private String url;
    private String username;
    private String password;
    private String driver;
    private Connection con;

    /**
     * Get the value of con
     *
     * @return the value of con
     */
    public Connection getCon() throws Exception{
        Class.forName(driver);
        con = DriverManager.getConnection(url, username, password);
        return con;
    }

    /**
     * Set the value of con
     *
     * @param con new value of con
     */
    public void setCon(Connection con) {
        this.con = con;
    }

    /**
     * Get the value of driver
     *
     * @return the value of driver
     */
    public String getDriver() {
        return driver;
    }

    /**
     * Set the value of driver
     *
     * @param driver new value of driver
     */
    public void setDriver(String driver) {
        this.driver = driver;
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
        this.password = password;
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
     * Get the value of url
     *
     * @return the value of url
     */
    public String getUrl() {
        return url;
    }

    /**
     * Set the value of url
     *
     * @param url new value of url
     */
    public void setUrl(String url) {
        this.url = url;
    }

    public DBConnector() {
    }

}
