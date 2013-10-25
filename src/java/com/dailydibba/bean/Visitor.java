package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Visitor {

    DBConnection con;
    CallableStatement callableStatement = null;
    String currentlocation;

    public String getCurrentlocation() {
        return currentlocation;
    }

    public void setCurrentlocation(String currentlocation) {
        this.currentlocation = currentlocation;
    }

    public String getLocation() {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        return "";
    }

    public List<Vendor> searchVendor(String city, String area) {
        //Author: Hiren Savalia & Mehul
        //Description: searchVendor called on searching
        List<Vendor> vendorList = new ArrayList<Vendor>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call searchVendor(?,?)}");
            callableStatement.setString(1, city);
            callableStatement.setString(2, area);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                Vendor objVendor = new Vendor(); // Vendor object created and all properties set
                objVendor.setVendorName(rs.getString("VendorName"));
                objVendor.setUserName(rs.getString("UserName"));

                Area objArea = new Area();
                objArea.setAreaName(rs.getString("AreaName"));
                objVendor.setArea(objArea);

                Visitor objVisitor = new Visitor();
                int rating = objVisitor.getRatings(rs.getString("UserName"));
                objVendor.setRating(rating);

                vendorList.add(objVendor);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return vendorList; // returned vendorList
    }

    public boolean insertSuggestion(String suggestion, Date DateOfSuggestion) {
        //Author: Hiren Savalia & Mehul Kaklotar
        //Description: insertSuggestion called when user wants to insert any suggestion
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertSuggestion(?,?)}"); // procedure called
            callableStatement.setString(1, suggestion);
            callableStatement.setDate(2, DateOfSuggestion);
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

    public boolean signUp(String username, int areaID, String firstname, String lastname, String lane, String mobileno, String emailID, boolean status) {
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertSuggestion(?,?,?,?,?,?,?,?)}");
            callableStatement.setString(1, username);
            callableStatement.setInt(2, areaID);
            callableStatement.setString(3, firstname);
            callableStatement.setString(4, lastname);
            callableStatement.setString(5, lane);
            callableStatement.setString(6, mobileno);
            callableStatement.setString(7, emailID);
            callableStatement.setBoolean(8, status);
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

    public List<Feedback> getFeedbackForVendor(String vendor) {
        //Author: Hiren Savalia
        //Description: fatching all feedback of a vendor
        List<Feedback> feedbackList = new ArrayList<Feedback>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getFeedbackForVendor(?)}"); // procedure called
            callableStatement.setString(1, vendor); // parameters are set
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                Feedback objFeedback = new Feedback();

                Customer objCustomer = new Customer();
                objCustomer.setFirstName(rs.getString("FirstName"));
                objCustomer.setLastName(rs.getString("LastName"));
                objFeedback.setCustomer(objCustomer);
                objFeedback.setMessage(rs.getString("Message"));
                objFeedback.setFeedbackDate(rs.getDate("Date"));

                feedbackList.add(objFeedback);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return feedbackList;
    }

    public List<Suggestion> getSuggestions() {
        List<Suggestion> suggestionList = new ArrayList<Suggestion>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getSuggestions(?)}");

            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {
                Suggestion objSuggestion = new Suggestion();

                objSuggestion.setSuggestion(rs.getString("suggestion"));
                objSuggestion.setSuggestionDateTime(rs.getDate("DateOfSuggestion"));
                objSuggestion.setSuggestionID(rs.getInt("SuggestionID"));

                suggestionList.add(objSuggestion);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return suggestionList;

    }

    public int getRatings(String vendor) {
        //Author: Hiren Savalia & Mehul Kaklotar
        //Description: getRatings will calculate the rating of a given vendor
        int rating = 0;
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getRatings(?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();

            if (rs.next()) {
                rating = rs.getInt("Rating");
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return rating;
    }

    public Vendor getVendor(String vendor) {
        //Author: Hiren Savalia & Mehul Kaklotar
        //Description: getVendor will get all the values of a given vendor
        Vendor objVendor = new Vendor();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getVendor(?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                objVendor.setUserName(rs.getString("UserName"));
                objVendor.setVendorName(rs.getString("VendorName")); //setting vendorname
                Area objArea = new Area(); // Creating area object
                objArea.setAreaName(rs.getString("AreaName")); //setting areaname of vendor

                City objCity = new City();
                objCity.setCityName(rs.getString("CityName")); //setting cityname
                objArea.setCity(objCity);

                objVendor.setArea(objArea);
                //setting all other fields
                objVendor.setMobileNo(rs.getString("MobileNo"));
                objVendor.setEmailID(rs.getString("EmailID"));
                objVendor.setLane(rs.getString("Lane"));
                objVendor.setOwnerName(rs.getString("OwnerName"));
                objVendor.setLandlineNumber(rs.getString("LandlineNo"));

                //Creating another procedure to get all areas of the vendor
                callableStatement = con.connection.prepareCall("{call getVendorArea(?)}");
                callableStatement.setString(1, vendor);
                ResultSet rsArea = callableStatement.executeQuery();
                List<Area> areas = new ArrayList<Area>();
                while (rsArea.next()) {
                    Area tempArea = new Area();
                    tempArea.setAreaName(rsArea.getString("AreaName"));
                    areas.add(tempArea);
                }
                objVendor.setAreas(areas);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return objVendor;
    }

    public List<Area> getAreaCityList() {
        List<Area> areaCity = new ArrayList<Area>();
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call getAreaCityList()}");
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Area objArea = new Area();
                objArea.setAreaName(rs.getString("AreaName"));
                City objCity = new City();
                objCity.setCityName(rs.getString("CityName"));
                objArea.setCity(objCity);
                areaCity.add(objArea);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return areaCity;
    }

    // Integration : Nidhi : insertCustomer, insertUser Method
    public boolean insertCustomer(String userName, int area, String firstName, String lastName, String lane, String mobileNo, String emailID, boolean status) {
        con = new DBConnection();

        try {

            callableStatement = con.connection.prepareCall("{call insertCustomer(?,?,?,?,?,?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setInt(2, area);
            callableStatement.setString(3, firstName);
            callableStatement.setString(4, lastName);
            callableStatement.setString(5, lane);
            callableStatement.setString(6, mobileNo);
            callableStatement.setString(7, emailID);
            callableStatement.setBoolean(8, status);

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

    public boolean insertUser(String userName, String password, String usertype) {
        con = new DBConnection();

        try {

            callableStatement = con.connection.prepareCall("{call insertUser(?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setString(2, password);
            callableStatement.setString(3, usertype);
            int row = callableStatement.executeUpdate();
            System.out.println("N" + row);
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
