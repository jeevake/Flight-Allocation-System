/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Airline implements Cloneable {

    private List<String> defaultAirlineList;
    private String defaultAirline;

    public String getDefaultFlight() {
        return defaultAirline;
    }
    public void setDefaultAirline(String defaultAirline) {
        this.defaultAirline = defaultAirline;
    }
    
    public Airline() {
        this.defaultAirlineList = new ArrayList<String>();
    }
    public Airline(List<String> list) {
        this.defaultAirlineList = list;
    }
    
    public void setDefaultAirlineList(List<String> defaultAirlineList) {
        this.defaultAirlineList = defaultAirlineList;
    }
    
    public void loadDefaultAirlineList() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prototype", "root", "");
        String sql = "SELECT * FROM defaultflights";
        PreparedStatement pstmt = con.prepareStatement(sql);
        ResultSet r = pstmt.executeQuery();

        while (r.next()) {
            String defaultAirline = r.getString("name");
            defaultAirlineList.add(defaultAirline);
        }
    }
    
    public List<String> getDefaultAirlineList() {
        return defaultAirlineList;
    }
    
    @Override
    public Object clone() throws CloneNotSupportedException {
        List<String> temp = new ArrayList<String>();
        for (String s : this.getDefaultAirlineList()) {
            temp.add(s);
        }
        return new Airline(temp);
    }
}
