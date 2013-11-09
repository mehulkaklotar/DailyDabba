/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NIDHI
 */
public class Tiffin {
    
    private String orderID;
    private String userNameCustomer;
    private String deliveryAddress;
    private int numberOfTiffin;
    private Menu menu;
    private boolean status;
    private Date orderDate;
    private int totalcost;
    private ArrayList<MenuItem> menuItem = new ArrayList<MenuItem>();
    private List<TiffinDetails> tiffindetails = new ArrayList<TiffinDetails>();


     public Tiffin()
    {
        //Author: Nidhi Patel
        //Date: 13-October-2013
    }

    public int getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(int totalcost) {
        this.totalcost = totalcost;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
     
    public String getOrderID() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return orderID;
    }

    public void setOrderID(String orderID) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.orderID = orderID;
    }

    public String getUserNameCustomer() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return userNameCustomer;
    }

    public void setUserNameCustomer(String userNameCustomer) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.userNameCustomer = userNameCustomer;
    }

    public String getDeliveryAddress() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.deliveryAddress = deliveryAddress;
    }

    public int getNumberOfTiffin() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return numberOfTiffin;
    }

    public void setNumberOfTiffin(int numberOfTiffin) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.numberOfTiffin = numberOfTiffin;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }


    public ArrayList<MenuItem> getMenuItem() {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        return menuItem;
    }

    public void setMenuItem(ArrayList<MenuItem> menuItem) {
        //Author: Nidhi Patel
        //Date: 13-October-2013
        this.menuItem = menuItem;
    }


    public ArrayList<MenuItem> getMenuItem(int menuID){
        //Author: Nidhi Patel
        //Date: 13-October-2013
        //To get menu items from given menu ID

       return menuItem;
    }

    public List<TiffinDetails> getTiffindetails() {
        return tiffindetails;
    }

    public void setTiffindetails(List<TiffinDetails> tiffindetails) {
        this.tiffindetails = tiffindetails;
    }
    
    

}
