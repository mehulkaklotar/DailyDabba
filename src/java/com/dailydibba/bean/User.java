/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PRACHI
 */
public class User {

    protected String userName;
    protected String password;
    protected String usertype;
    DBConnection con;
    CallableStatement stmt;

    public User() {
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getPassword() {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Returns password set for object
        return password;
    }

    public void setPassword(String password) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Sets password for the object
        this.password = password;
    }

    public String getUserName() {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Returns user name set for object
        return userName;
    }

    public void setUserName(String userName) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Sets user name for the object
        this.userName = userName;
    }

    public static User login(String UserName, String Password) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Sets user name for the object
        DBConnection conStatic = new DBConnection();
        CallableStatement stmtStatic = null;
        try {
            stmtStatic = conStatic.connection.prepareCall("{call login(?,?)}");
            stmtStatic.setString(1, UserName);
            stmtStatic.setString(2, Password);
            ResultSet rs = stmtStatic.executeQuery();
            if (rs.next()) {
                User objUser =new User();
                objUser.setUserName(rs.getString("UserName"));
                return objUser;
            } else {
                return null;
            }
        } catch (SQLException ex) {
            return null;
        }
    }

    public boolean logout(String UserName) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //According to me this functionality will be implemented in  view itself
        return true;
    }

    public boolean changePassword(String username, String newPassword) {

        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Changing Password for this user

        con = new DBConnection();
        try {
            stmt = con.connection.prepareCall("{call updateUser(?,?)}");
            stmt.setString(1, username);
            stmt.setString(2, password);
            int res = stmt.executeUpdate();
            if (res == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }

    }
    /*public void forgotPassword(String eMail){
     //Author: Prachi Deodhar
     //Date: 12-October-2013
     //will fetch the value in password variable.
     try{
     stmt=con.connection.prepareCall("{call getuserusername(?)}");
     stmt.setString(1, userName);
     ResultSet rs=stmt.executeQuery();
     if(rs.next()){
             
     }
     }catch(SQLException ex){
     ex.printStackTrace();
     }
        
     }*/

    public ArrayList<Feedback> getFeedback() {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Admin Panel view of feedback
        try {
            ArrayList<Feedback> feedback = new ArrayList<Feedback>();
            stmt = con.connection.prepareCall("{call getFeedback()}");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback objFeedback = new Feedback();

                Customer objCustomer = new Customer();
                objCustomer.setUserName(rs.getString("CustomerUN"));
                objFeedback.setCustomer(objCustomer);
                objFeedback.setFeedbackDate(rs.getDate("Date"));
                objFeedback.setMessage(rs.getString("Message"));
                feedback.add(objFeedback);
            }
            return feedback;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ArrayList<Feedback> getFeedbackForVendor(String vendorName) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //Vendor specific feedback
        try {
            ArrayList<Feedback> feedback = new ArrayList<Feedback>();
            stmt = con.connection.prepareCall("{call getFeedbackForVendor(?)}");
            stmt.setString(1, vendorName);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Feedback objFeedback = new Feedback();

                Customer objCustomer = new Customer();
                objCustomer.setUserName(rs.getString("CustomerUN"));
                objFeedback.setCustomer(objCustomer);
                objFeedback.setFeedbackDate(rs.getDate("Date"));
                objFeedback.setMessage(rs.getString("Message"));
                feedback.add(objFeedback);
            }
            return feedback;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ArrayList<Suggestion> getSuggestion() {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //View Suggstions from visitors
        try {
            ArrayList<Suggestion> suggestion = new ArrayList<Suggestion>();
            stmt = con.connection.prepareCall("{call getSuggestion()}");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Suggestion objSuggestion = new Suggestion();
                objSuggestion.setSuggestion(rs.getString("Suggestion"));
                objSuggestion.setSuggestionDateTime(rs.getDate("DateOfSuggestion"));
                objSuggestion.setSuggestionID(rs.getInt("SuggestionID"));
                suggestion.add(objSuggestion);
            }
            return suggestion;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public ArrayList<Rating> getRating(String vendor) {
        //Author: Prachi Deodhar
        //Date: 12-October-2013
        //View Ratings from visitors

        try {
            ArrayList<Rating> rating = new ArrayList<Rating>();
            stmt = con.connection.prepareCall("{call getRating(?)}");
            stmt.setString(1, vendor);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Rating objRating = new Rating();
                
                Vendor objVendor = new Vendor();
                objVendor.setUserName(rs.getString("UserName"));
                objRating.setUserNameVendor(objVendor);
                
                Customer objCustomer = new Customer();
                objCustomer.setUserName(rs.getString("CustomerUN"));
                objRating.setUserNamecustomer(objCustomer);
                objRating.setCurrentRating(rs.getInt("CurrentRating"));
                rating.add(objRating);
            }
            return rating;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
    }

    
}
