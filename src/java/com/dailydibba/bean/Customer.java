package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Customer extends User {

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

    public boolean insertOrder(String customer, String deliveryaddress, int nooftiffin, int menuID, boolean status, String orderdate, String orderID) {
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertOrder(?,?,?,?,?,?,?)}");
            callableStatement.setString(1, customer);
            callableStatement.setString(2, deliveryaddress);
            callableStatement.setInt(3, nooftiffin);
            callableStatement.setInt(4, menuID);
            callableStatement.setBoolean(5, status);
            callableStatement.setString(6, orderdate);
            callableStatement.setString(7, orderID);
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

    public boolean insertOrderDetails(String orderID, int itemID, int qunatity) {
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call insertOrderDetails(?,?,?)}");
            callableStatement.setString(1, orderID);
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

    public List<TiffinDetails> getOrderDetails(String orderID) {
        List<TiffinDetails> tiffindetails = new ArrayList<TiffinDetails>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getOrderDetails(?)}");
            callableStatement.setString(1, orderID);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {

                TiffinDetails objDetails = new TiffinDetails();
                Tiffin objTiffin = new Tiffin();
                objTiffin.setOrderID(rs.getString("OrderID"));
                objDetails.setOrder(objTiffin);
                Item objItem = new Item();
                objItem.setItemID(rs.getInt("ItemID"));
                objItem.setItemName(rs.getString("ItemName"));
                objDetails.setItem(objItem);
                objDetails.setQuantity(rs.getInt("Quantity"));
                objDetails.setCost(rs.getInt("Cost"));

                tiffindetails.add(objDetails);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return tiffindetails;
    }

    public Tiffin getOrder(String orderID) {
        Tiffin objTiffin = null;
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getOrder(?)}");
            callableStatement.setString(1, orderID);
            ResultSet rs = callableStatement.executeQuery();

            if (rs.next()) {
                objTiffin = new Tiffin();
                objTiffin.setOrderID(rs.getString("OrderID"));
                objTiffin.setOrderDate(rs.getDate("Orderdate"));
                objTiffin.setDeliveryAddress(rs.getString("DeliveryAddress"));
                objTiffin.setNumberOfTiffin(rs.getInt("NoOfTiffin"));
                objTiffin.setStatus(rs.getBoolean("Status"));
                objTiffin.setUserNameCustomer(rs.getString("Customer"));
                Menu objMenu = new Menu();
                Vendor objVendor = new Vendor();
                objVendor.setUserName(rs.getString("Vendor"));
                objMenu.setVendor(objVendor);
                objMenu.setIsLunch(rs.getBoolean("IsLunch"));
                objTiffin.setMenu(objMenu);

                List<TiffinDetails> tiffindetails = new ArrayList<TiffinDetails>();

                callableStatement = con.connection.prepareCall("{call getOrderDetails(?)}");
                callableStatement.setString(1, orderID);
                ResultSet rsdetails = callableStatement.executeQuery();
                while (rsdetails.next()) {
                    TiffinDetails objDetails = new TiffinDetails();
                    objDetails.setOrder(objTiffin);
                    Item objItem = new Item();
                    objItem.setItemName(rsdetails.getString("ItemName"));
                    objItem.setItemID(rsdetails.getInt("ItemID"));
                    ItemType objItemType = new ItemType();
                    objItemType.setTypeName(rsdetails.getString("TypeName"));
                    objItem.setType(objItemType);
                    objDetails.setItem(objItem);
                    objDetails.setCost(rsdetails.getInt("Cost"));
                    objDetails.setQuantity(rsdetails.getInt("Quantity"));

                    tiffindetails.add(objDetails);
                }

                objTiffin.setTiffindetails(tiffindetails);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return objTiffin;
    }

    public List<Tiffin> getOrderHistory(String customer) {
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
                objTiffin.setOrderID(rs.getString("OrderID"));
                objTiffin.setOrderDate(rs.getDate("Orderdate"));
                objTiffin.setDeliveryAddress(rs.getString("DeliveryAddress"));
                objTiffin.setNumberOfTiffin(rs.getInt("NoOfTiffin"));
                objTiffin.setStatus(rs.getBoolean("Status"));
                objTiffin.setTotalcost(rs.getInt("Total"));
                Menu objMenu = new Menu();
                Vendor objVendor = new Vendor();
                objVendor.setVendorName(rs.getString("VendorName"));
                objVendor.setUserName(rs.getString("Vendor"));
                objMenu.setVendor(objVendor);
                objTiffin.setMenu(objMenu);

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

    public boolean insertFeedback(String customer, String vendor, Date date, String message, int rating) {
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
    public boolean updateCustomerProfile() {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Called when user wants to update profile
        con = new DBConnection(); // connection created
        try {

            callableStatement = con.connection.prepareCall("{call updateCustomerProfile(?,?,?,?,?,?,?)}"); // procedure called
            callableStatement.setString(1, userName); //setting all the perameters
            callableStatement.setInt(2, area.getAreaID());
            callableStatement.setString(3, firstName);
            callableStatement.setString(4, lastName);
            callableStatement.setString(5, lane);
            callableStatement.setString(6, mobileNo);
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

    public boolean updateOrderDetails(String orderID, int itemID, int quantity) {
        //Author: Hiren Savalia
        //Date :  10-19-2013
        //Changed method's name to updateOrderDetails from modifyTiffin
        //Called when user modifies the menu
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call updateOrderDetails(?,?,?)}");
            callableStatement.setString(1, orderID);
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

    public boolean deleteOrder(String orderID) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call deleteOrder(?)}");
            callableStatement.setString(1, orderID);
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

    public boolean updateOrder(String orderID, String deliveryaddress) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call updateOrder(?,?)}");
            callableStatement.setString(1, orderID);
            callableStatement.setString(2, deliveryaddress);
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

    public void getProfileDetails() {
        try {
            con = new DBConnection();
            callableStatement = con.connection.prepareCall("{call getCustomer(?)}");
            callableStatement.setString(1, userName);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                int areaID = rs.getInt("AreaID");
                String areaName = rs.getString("AreaName");
                int cityid = rs.getInt("cityid");
                String cityname = rs.getString("cityname");
                area = new Area();
                area.setAreaID(areaID);
                area.setAreaName(areaName);
                City city = new City();
                city.setCityID(cityid);
                city.setCityName(cityname);
                area.setCity(city);
                firstName = rs.getString("FirstName");
                lastName = rs.getString("LastName");
                lane = rs.getString("Lane");
                mobileNo = rs.getString("MobileNo");
                emailID = rs.getString("EmailID");
                status = rs.getBoolean("Status");
            }
        } catch (SQLException exc) {
            System.out.println(exc.toString());
        }
    }

    public List<VendorArea> getVendorArea(String vendor) {
        //Author: Prachi Deodhar
        //Date:13- October-2013
        //Report on the current month's order
        List<VendorArea> vendorarea = new ArrayList<VendorArea>();
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getVendorArea(?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();

            while (rs.next()) {

                VendorArea objVendorArea = new VendorArea();
                Vendor objVendor = new Vendor();
                objVendor.setUserName(rs.getString("UserName"));
                Area objArea = new Area();
                objArea.setAreaID(rs.getInt("AreaID"));
                objVendorArea.setVendor(objVendor);
                objVendorArea.setArea(objArea);

                vendorarea.add(objVendorArea);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return vendorarea;
    }

    public Customer getCustomerStatus(String username) {
        Customer objCustomer = null;
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getCustomerStatus(?)}");
            callableStatement.setString(1, username);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                objCustomer = new Customer();
                objCustomer.setStatus(rs.getBoolean("Status"));
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return objCustomer;

    }

    public boolean increaseBlockVendorHits(String vendorname) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call updateVendorBlockHits(?)}");
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
}
