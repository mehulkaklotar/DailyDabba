/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.sql.*;
import java.util.ArrayList;
import java.sql.Date;
/**
 *
 * @author NIDHI
 */
public class Menu {
    protected int menuID;
    protected Vendor vendor;
    protected Date uploadDateTime;
    protected String tiffinName;
    ArrayList<MenuItem> menuItem = new ArrayList<MenuItem>();

    public Menu() {
    }



    public Menu(int menuID,Vendor vendor,Date uploadDateTime,String tiffinName)
    {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.menuID=menuID;
        this.vendor=vendor;
        this.uploadDateTime=uploadDateTime;
        this.tiffinName=tiffinName;
    }

    public ArrayList<MenuItem> getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(ArrayList<MenuItem> menuItem) {
        this.menuItem = menuItem;
    }

    public int getMenuID() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return menuID;
    }

    public void setMenuID(int menuID) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.menuID = menuID;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    public Date getUploadDateTime() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return uploadDateTime;
    }

    public void setUploadDateTime(Date uploadDateTime) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.uploadDateTime = uploadDateTime;
    }

    public String getTiffinName() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return tiffinName;
    }

    public void setTiffinName(String tiffinName) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.tiffinName = tiffinName;
    }

     public ArrayList<MenuItem> getMenuItem(int menuID){
        //Author: Nidhi Patel
        //Date: 13-October-2013
        //To get menu items from given menu ID

                return menuItem;

    }



}
