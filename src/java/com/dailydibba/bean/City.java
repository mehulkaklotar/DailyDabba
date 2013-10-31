package com.dailydibba.bean;
import com.dailydibba.bean.Area;
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
     public City() {
    }

    public City(int cityID,String cityName)
    {
        this.cityID=cityID;
        this.cityName=cityName;

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



