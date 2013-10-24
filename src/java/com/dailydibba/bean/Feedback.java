/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Ranu Bohra(201212076)
 * 15/10/2013
 */
public class Feedback {

    private Customer customer;
    private Vendor vendor;
    private String message;
    private Date feedbackDate;
    private int rating;
    DBConnection con;
    CallableStatement callableStatement = null;

    public Feedback() {
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Vendor getVendor() {
        return vendor;
    }

    public void setVendor(Vendor vendor) {
        this.vendor = vendor;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getFeedbackDate() {
        return feedbackDate;
    }

    public void setFeedbackDate(Date feedbackDate) {
        this.feedbackDate = feedbackDate;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    

    public boolean insertFeedback(String customer, String vendorUN, Timestamp date, String message,int rating) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call insertFeedback(?,?,?,?,?)}");
            callableStatement.setString(1, customer);
            callableStatement.setString(2, vendorUN);
            callableStatement.setTimestamp(3, date);
            callableStatement.setString(4, message);
            callableStatement.setInt(5, rating);
            int row = callableStatement.executeUpdate();

            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception ex) {
            return false;
        } finally {
            con.closeConnection();
        }
    }
}
