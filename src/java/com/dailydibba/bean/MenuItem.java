/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author NIDHI
 */
public class MenuItem {
    protected int itemID;
    protected double cost;
    protected int quantity;
    protected String itemName;
    protected int typeID;

     public MenuItem(int itemID,double cost,int quantity,String itemName,int typeID)
    {
         //Author: Nidhi Patel
        //Date: 13-October-2013
        this.itemID=itemID;
        this.cost=cost;
        this.quantity=quantity;
        this.itemName=itemName;
    }

    public int getItemID() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return itemID;
    }

    public void setItemID(int itemID) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.itemID = itemID;
    }

    public double getCost() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return cost;
    }

    public void setCost(double cost) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.cost = cost;
    }

    public int getQuantity() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return quantity;
    }

    public void setQuantity(int quantity) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.quantity = quantity;
    }

    public String getItemName() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return itemName;
    }

    public void setItemName(String itemName) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.itemName = itemName;
    }

    public int getTypeID() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return typeID;
    }

    public void setTypeID(int typeID) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.typeID = typeID;

    }

    public String getItemType(String itemName)
    {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        //To get Item Type from the given Item Name
           return "Hello";


    }

    public String getItemType(int itemID)
    {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        //To get Item Type from the given ItemID
          return "Hello";


    }
}
