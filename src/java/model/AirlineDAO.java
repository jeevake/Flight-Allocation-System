/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * 
 */
public class AirlineDAO {

    public boolean RegisterAvailableAirlines(DBConnector dao, Airline f) throws Exception {
        Connection con = dao.getCon();

        String query = "INSERT INTO defaultflights(name) VALUES (?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, f.getDefaultFlight());

        int a = pstmt.executeUpdate();

        return (a > 0);
    }


    public ResultSet Retrieve() throws Exception {
        Connection con = new DBConnector().getCon();
        String query = "SELECT * FROM everydayFlights";
        PreparedStatement pstmt = con.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();

        return rs;
    }


    public boolean Delete(DBConnector dao, Airline f) throws Exception {

        Connection con = dao.getCon();

        String query = "DELETE FROM defaultflights WHERE name = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, f.getDefaultFlight());
        int a = pstmt.executeUpdate();
       
        String query2 = "DELETE FROM countryflights WHERE airlines = ?";
        PreparedStatement pstmt2 = con.prepareStatement(query2);
        pstmt2.setString(1, f.getDefaultFlight());
        int b = pstmt2.executeUpdate();
               
        return (a > 0);
    }
    
      public boolean DeleteCountryAirlines(DBConnector dao, String country) throws Exception {
        
        Connection con = dao.getCon();

        String query = "DELETE FROM countryflights WHERE country = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, country);
        int a = pstmt.executeUpdate();
        
        return (a > 0);
    }

    
}
