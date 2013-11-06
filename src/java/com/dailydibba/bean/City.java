/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author Ranu(201212076)
 * 15/10/2013
 */
public class City {
    private int cityID;
    private String cityName;
    ArrayList<Area> areas= new ArrayList<Area>();

    public City(int cityID,String cityName)
    {
        this.cityID=cityID;
        this.cityName=cityName;

    }

    public City() {
        //default constructor
    }

    public int getCityID() {
        return cityID;
    }

    public void setCityID(int cityID) {
        this.cityID = cityID;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public ArrayList<Area> getAreas() {
        return areas;
    }

    public void setAreas(ArrayList<Area> areas) {
        this.areas = areas;
    }

    
    
}



