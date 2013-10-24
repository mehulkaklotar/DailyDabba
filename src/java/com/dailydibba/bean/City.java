/*
 * 
 */
package com.dailydibba.bean;

import java.util.ArrayList;

public class City {

    private int cityID;
    private String cityName;
    private ArrayList<Area> areas = new ArrayList<Area>();

    public City() {
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
