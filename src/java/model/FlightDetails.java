/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 *
 */
public class FlightDetails implements Serializable {

    private String name;
    private int capacity;

    private String aircraftType;

    private String baggageInfo;

    private String crewInfo;

    private String airlineCode;

    private String airline;

    /**
     * Get the value of airline
     *
     * @return the value of airline
     */
    public String getAirline() {
        return airline;
    }

    /**
     * Set the value of airline
     *
     * @param airline new value of airline
     */
    public void setAirline(String airline) {
        this.airline = airline;
    }

    /**
     * Get the value of airlineCode
     *
     * @return the value of airlineCode
     */
    public String getAirlineCode() {
        return airlineCode;
    }

    /**
     * Set the value of airlineCode
     *
     * @param airlineCode new value of airlineCode
     */
    public void setAirlineCode(String airlineCode) {
        this.airlineCode = airlineCode;
    }

    /**
     * Get the value of crewInfo
     *
     * @return the value of crewInfo
     */
    public String getCrewInfo() {
        return crewInfo;
    }

    /**
     * Set the value of crewInfo
     *
     * @param crewInfo new value of crewInfo
     */
    public void setCrewInfo(String crewInfo) {
        this.crewInfo = crewInfo;
    }

    /**
     * Get the value of baggageInfo
     *
     * @return the value of baggageInfo
     */
    public String getBaggageInfo() {
        return baggageInfo;
    }

    /**
     * Set the value of baggageInfo
     *
     * @param baggageInfo new value of baggageInfo
     */
    public void setBaggageInfo(String baggageInfo) {
        this.baggageInfo = baggageInfo;
    }

    /**
     * Get the value of aircraftType
     *
     * @return the value of aircraftType
     */
    public String getAircraftType() {
        return aircraftType;
    }

    /**
     * Set the value of aircraftType
     *
     * @param aircraftType new value of aircraftType
     */
    public void setAircraftType(String aircraftType) {
        this.aircraftType = aircraftType;
    }

    public FlightDetails() {
    }

    /**
     * Get the value of capacity
     *
     * @return the value of capacity
     */
    public int getCapacity() {
        return capacity;
    }

    /**
     * Set the value of capacity
     *
     * @param capacity new value of capacity
     */
    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    /**
     * Get the value of name
     *
     * @return the value of name
     */
    public String getName() {
        return name;
    }

    /**
     * Set the value of name
     *
     * @param name new value of name
     */
    public void setName(String name) {
        this.name = name;
    }

}
