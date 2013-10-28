/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

/**
 *
 * @author Ranu Bohra(201212076)
 * 15/10/2013
 */
public class Area {
    private int areaID;
    private String areaName;
    private City city;

    public Area()
    {
     
    }

    public Area(int areaID, String areaName) {
        this.areaID = areaID;
        this.areaName = areaName;
    }

   

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

    public int getAreaID()
    {
        return areaID;
    }

    public void setAreaID(int areaID)
    {
        this.areaID=areaID;
    }

    public String getAreaName()
    {
        return areaName;
    }

    public void setAreaName(String areaName)
    {
        this.areaName=areaName;
    }

}
