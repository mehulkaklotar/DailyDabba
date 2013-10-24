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
public class Rating {
    
    private Vendor userNameVendor;
    private int currentRating;
    private Customer userNamecustomer;

    public Rating()
    {
       
    }

    public Vendor getUserNameVendor() {
        return userNameVendor;
    }

    public void setUserNameVendor(Vendor userNameVendor) {
        this.userNameVendor = userNameVendor;
    }

    public int getCurrentRating()
    {
        return currentRating;
    }

    public void setCurrentRating(int currentrating)
    {
        this.currentRating=currentrating;
    }

    public Customer getUserNamecustomer() {
        return userNamecustomer;
    }

    public void setUserNamecustomer(Customer userNamecustomer) {
        this.userNamecustomer = userNamecustomer;
    }

    
}

