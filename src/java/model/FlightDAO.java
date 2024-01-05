/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * 
 */
public class FlightDAO {
     public boolean RegisterFlight(DBConnector dao, FlightDetails fd) throws Exception {
        Connection con = dao.getCon();

        String query = "INSERT INTO flightdetails(name,capacity,aircraftType,baggageInformation,crewInformation,airlineCode,airline) VALUES (?,?,?,?,?,?,?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, fd.getName());
        pstmt.setInt(2, fd.getCapacity());
        pstmt.setString(3, fd.getAircraftType());
        pstmt.setString(4, fd.getBaggageInfo());
        pstmt.setString(5, fd.getCrewInfo());
        pstmt.setString(6, fd.getAirlineCode());
        pstmt.setString(7, fd.getAirline());

        int a = pstmt.executeUpdate();

        return (a > 0);
    }
     
       public boolean DeleteFlightDetails(DBConnector dao, String flightName) throws Exception {
        
        Connection con = dao.getCon();

        String query = "DELETE FROM flightdetails WHERE name = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, flightName);
        int a = pstmt.executeUpdate();
        
        return (a > 0);
    }
}
