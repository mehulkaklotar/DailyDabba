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
   private Item item;
   private double cost;
   private int quantity;
   private int menuID;

    public MenuItem() {
    }

    public MenuItem(Item item, double cost, int quantity) {
        this.item = item;
        this.cost = cost;
        this.quantity = quantity;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getMenuID() {
        return menuID;
    }

    public void setMenuID(int menuID) {
        this.menuID = menuID;
    }
   
}
