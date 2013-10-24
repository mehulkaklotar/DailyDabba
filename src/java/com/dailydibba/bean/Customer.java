/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PRACHI
 */
public class Customer extends User{
    //Author: Prachi Deohar
    //Date: 13-October-2013
    //Will deal with the functionalities of Customer

    private String firstName;
    private String lastName;
    private String lane;
    private Area area;
    private String mobileNo;
    private String emailID;
    private boolean status;
    
    DBConnection con;
    CallableStatement callableStatement = null;

    public Customer() {
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
    public Area getArea() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of area
        return area;
    }

    public void setArea(Area area) {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of area
        this.area = area;
    }

    public String getEmailID() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of email id
        return emailID;
    }

    public void setEmailID(String emailID) {
         //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of email id
        this.emailID = emailID;
    }

    public String getFirstName() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of first name
        return firstName;
    }

    public void setFirstName(String firstName) {
         //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of first name
        this.firstName = firstName;
    }

    public String getLane() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of lane
        return lane;
    }

    public void setLane(String lane) {
         //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of lane
        this.lane = lane;
    }

    public String getLastName() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of last name
        return lastName;
    }

    public void setLastName(String lastName) {
         //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of last name
        this.lastName = lastName;
    }

    public String getMobileNo() {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //To get value of mobile number
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
         //Author: Prachi Deodhar
        //Date:13- October-2013
        //To set value of mobile no.
        this.mobileNo = mobileNo;
    }

    public List<Vendor> searchVendor(String city, String area) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        List<Vendor> vendorList = new ArrayList<Vendor>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call searchVendor(?,?)}");
            callableStatement.setString(1, city);
            callableStatement.setString(2, area);
            ResultSet rs = callableStatement.executeQuery();
            
            while (rs.next()) {
                Vendor objVendor = new Vendor();
                objVendor.setVendorName(rs.getString("VendorName"));
                objVendor.setUserName("UserName");
                
                Area objArea = new Area();
                objArea.setAreaName(rs.getString("AreaName"));
                objVendor.setArea(objArea);
                
                vendorList.add(objVendor);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return vendorList;
    }

    public boolean insertOrder(String customer, String deliveryaddress, int nooftiffin,int menuID, boolean status, Date orderdate){
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //Called when user places order
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertOrder(?,?,?,?,?,?)}");
            callableStatement.setString(1, customer);
            callableStatement.setString(2, deliveryaddress);
            callableStatement.setInt(3, nooftiffin);
            callableStatement.setInt(4, menuID);
            callableStatement.setBoolean(5, status);
            callableStatement.setDate(6, orderdate);
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
    
    public boolean insertOrderDetails(int orderID,int itemID,int qunatity){
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //Called when user places order
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertOrderDetails(?,?,?)}");
            callableStatement.setInt(1, orderID);
            callableStatement.setInt(2, itemID);
            callableStatement.setInt(3, qunatity);
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
    
    public List<Tiffin> getOrderHistory(String customer){
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //Report on the current month's order
        List<Tiffin> tiffinList = new ArrayList<Tiffin>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getOrderHistory(?)}");
            callableStatement.setString(1, customer);
            ResultSet rs = callableStatement.executeQuery();
            
            while (rs.next()) {
                Tiffin objTiffin = new Tiffin();
                objTiffin.setOrderID(rs.getInt("OrderID"));
                objTiffin.setOrderDate(rs.getDate("Orderdate"));
                objTiffin.setDeliveryAddress(rs.getString("DeliveryAddress"));
                objTiffin.setNumberOfTiffin(rs.getInt("NoOfTiffin"));
                objTiffin.setStatus(rs.getBoolean("Status"));
                
                tiffinList.add(objTiffin);
                
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return tiffinList;
    }
    public boolean insertFeedback(String customer,String vendor,Date date,String message,int rating){
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //Called when user gives feedback
         con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertFeedback(?,?,?,?,?)}");
            callableStatement.setString(1, customer);
            callableStatement.setString(2, vendor);
            callableStatement.setString(3, message);
            callableStatement.setDate(4, date);
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
    
      // Methods' prtotype by Prachi and body by Hiren
    public boolean updateCustomerProfile(String username, int areaID, String firstname, String lastname, String lane, String mobileno, String emailID) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Called when user wants to update profile
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call updateCustomerProfile(?,?,?,?,?,?,?)}");
            callableStatement.setString(1, username);
            callableStatement.setInt(2, areaID);
            callableStatement.setString(3, firstname);
            callableStatement.setString(4, lastname);
            callableStatement.setString(5, lane);
            callableStatement.setString(6, mobileno);
            callableStatement.setString(7, emailID);
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

    public boolean blockVendor(String vendorname) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Called when customer wants to block vendor
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call blockVendor(?)}");
            callableStatement.setString(1, vendorname);
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

    public boolean cancelOrder(int orderID) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Called when cusomer cancels the order
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call cancelOrder(?)}");
            callableStatement.setInt(1, orderID);
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

    public boolean updateOrderDetails(int orderID, int itemID, int quantity) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Changed method's name to updateOrderDetails from modifyTiffin
        //Called when user modifies the menu
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call updateOrderDetails(?,?,?)}");
            callableStatement.setInt(1, orderID);
            callableStatement.setInt(2, itemID);
            callableStatement.setInt(3, quantity);
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
    
    
    

    /*public MenuItem getVendorMenu(String vendor) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Will fetch menu for a particular vendor
        //Changed method's name to getVendorMenu from getMenuForVendor
        MenuItem mi = new MenuItem();
        con = new DBConnection();
        callableStatement = con.connection.prepareCall("{call getVendorMenu(?)}");
        try {
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while(rs.next()){
                mi.setCost(rs.getString("Cost"));
                mi.setQuantity(rs.getString("Quantity"));
                mi.setItemID(itemID);
                mi.setItemName(userName);
                mi.se
                
            }
            
        } catch (Exception ex) {
            return false;
        } finally {
            con.closeConnection();
        }

        ResultSet rs = null;
        return rs;
    }*/
}
