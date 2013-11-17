package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author AKYP
 */
public class Administrator extends User {

    DBConnection con;
    CallableStatement cstmt;

    public boolean updateCity(String city_name, int city_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateCity(?,?)}");
            cstmt.setString(1, city_name);
            cstmt.setInt(2, city_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean deleteCity(int city_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call deleteCity(?)}");
            cstmt.setInt(1, city_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean updateArea(String area_name, int area_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateArea(?,?)}");
            cstmt.setString(1, area_name);
            cstmt.setInt(2, area_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean deleteArea(int area_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call deleteArea(?)}");
            cstmt.setInt(1, area_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public List<Area> getAllArea() {
        List<Area> areaList = new ArrayList<Area>();
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getAllArea()}");
            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {

                Area objArea = new Area();
                objArea.setAreaID(rs.getInt("AreaID"));
                objArea.setAreaName(rs.getString("AreaName"));
                City c = new City();
                c.setCityName(rs.getString("CityName"));
                objArea.setCity(c);

                areaList.add(objArea);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return areaList;
    }

    public List<City> getAllCity() {
        List<City> cityList = new ArrayList<City>();
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getAllCity()}");
            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {

                City objCity = new City();
                objCity.setCityName(rs.getString("CityName"));
                objCity.setCityID(rs.getInt("CityID"));

                cityList.add(objCity);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return cityList;
    }

    public Area getArea(int area_id) {
        Area objArea = null;
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call getArea(?)}");
            cstmt.setInt(1, area_id);
            ResultSet rs = cstmt.executeQuery();
            if (rs.next()) {
                objArea = new Area();
                objArea.setAreaName(rs.getString("AreaName"));
                objArea.setAreaID(rs.getInt("AreaID"));
                City ct = new City();
                //ct.setCityID(rs.getInt("CityID"));
                ct.setCityName(rs.getString("CityName"));
                objArea.setCity(ct);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return objArea;
    }

    public City getCity(int city_id) {
        City objCity = null;
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getCity(?)}");
            cstmt.setInt(1, city_id);
            ResultSet rs = cstmt.executeQuery();

            if (rs.next()) {

                objCity = new City();
                objCity.setCityName(rs.getString("CityName"));
                objCity.setCityID(rs.getInt("CityID"));

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return objCity;
    }

    public boolean blockVendor(String username) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {

            cstmt = con.connection.prepareCall("{call blockVendor(?)}");
            cstmt.setString(1, username);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {

            return false;
        }
    }

    public boolean blockCustomer(String username) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            cstmt = con.connection.prepareCall("{call blockCustomer(?)}");
            cstmt.setString(1, username);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public ArrayList<Tiffin> viewOrderReport() {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        ArrayList<Tiffin> orders = new ArrayList<Tiffin>();
        try {
            cstmt = con.connection.prepareCall("{call viewOrderReport()}");
            ResultSet rs = cstmt.executeQuery();
            return orders;
        } catch (SQLException ex) {
            return null;
        }
    }

    public boolean addCity(String city_name) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call addCity(?)}");
            cstmt.setString(1, city_name);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }

    }

    public boolean updateCity(String old_name, String new_name) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:

        try {
            cstmt = con.connection.prepareCall("{call updateCity(?,?)}");
            cstmt.setString(1, old_name);
            cstmt.setString(2, new_name);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean addArea(String area_name, int city_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:

        DBConnection con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call addArea(?,?)}");
            cstmt.setString(1, area_name);
            cstmt.setInt(2, city_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean updateArea(String area_name, int city_id, int area_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            cstmt = con.connection.prepareCall("{call updateArea(?,?,?)}");
            cstmt.setString(1, area_name);
            cstmt.setInt(2, city_id);
            cstmt.setInt(3, area_id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }
    }

    public ArrayList<Customer> viewCustomerReport() {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            ArrayList<Customer> customers = new ArrayList<Customer>();
            cstmt = con.connection.prepareCall("{call viewCustomerReport()}");
            //cstmt.setString(1,user_name);
            ResultSet rs = cstmt.executeQuery();
            return customers;
        } catch (SQLException ex) {
            return null;
        }
    }

    public ArrayList<Vendor> viewVendorReport() {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            ArrayList<Vendor> vendors = new ArrayList<Vendor>();
            cstmt = con.connection.prepareCall("{call viewVendorReport()}");
            //cstmt.setString(1,user_name);
            ResultSet rs = cstmt.executeQuery();
            return vendors;
        } catch (SQLException ex) {
            return null;
        }
    }

    public List<Customer> viewCustomerProfile(String user_name) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        List<Customer> customerList = new ArrayList<Customer>();
        try {
            cstmt = con.connection.prepareCall("{call viewCustomerProfile(?)}");
            cstmt.setString(1, user_name);
            ResultSet rs = cstmt.executeQuery();
            if (rs.next()) {
                Customer objCustomer = new Customer();
                objCustomer.setUserName(rs.getString("UserName"));
                objCustomer.setPassword(rs.getString("Password"));
                objCustomer.setFirstName(rs.getString("FirstName"));
                objCustomer.setLane(rs.getString("Lane"));
                objCustomer.setLastName(rs.getString("LastName"));

                Area objArea = new Area();
                objArea.setAreaName(rs.getString("AreaName"));
                objCustomer.setArea(objArea);

                objCustomer.setMobileNo(rs.getString("MobileNo"));
                objCustomer.setEmailID(rs.getString("EmailID"));

                customerList.add(objCustomer);
            } else {
                return null;
            }
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return customerList;
    }

    public Vendor viewVendorProfile(String user_name) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        Vendor objVendor = new Vendor();
        CallableStatement callstmt;
        try {
            cstmt = con.connection.prepareCall("{call getVendor(?)}");
            cstmt.setString(1, user_name);

//      callstmt = con.connection.prepareCall("{call getRatings(?)}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                String UserName = rs.getString("UserName");
                objVendor.setVendorName(rs.getString("VendorName"));
//                objVendor.setEmailID(rs.getString("EmailID"));
//                objVendor.setMobileNo("MobileNo");
//                objVendor.setOwnerName("OwnerName");
//                objVendor.setStatus(rs.getBoolean("Status"));
                objVendor.setUserName(UserName);
//                callstmt.setString(1, UserName);
//                ResultSet rs_rating = callstmt.executeQuery();
//                while(rs_rating.next()){
//                objVendor.setRating(rs_rating.getInt("Rating")); 
//                } 

            }
            rs.close();
        } catch (SQLException ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return objVendor;
    }

    public ArrayList<Customer> searchCustomer(String criteria, String value) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            ArrayList<Customer> customers = new ArrayList<Customer>();
            cstmt = con.connection.prepareCall("{call searchCustomer(?)}");
            //cstmt.setString(1,user_name);
            ResultSet rs = cstmt.executeQuery();

            return customers;
        } catch (SQLException ex) {
            return null;
        }

    }

    public ArrayList<Vendor> searchVendor(String criteria, String value) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
        try {
            ArrayList<Vendor> vendors = new ArrayList<Vendor>();
            cstmt = con.connection.prepareCall("{call searchVendor(?)}");
            //cstmt.setString(1,user_name);
            ResultSet rs = cstmt.executeQuery();
            return vendors;
        } catch (SQLException ex) {
            return null;
        }

    }

    public ArrayList<Area> getAllCityArea(int cityid) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call getAreaCityID(?)}");
            cstmt.setInt(1, cityid);
            ArrayList<Area> areas = new ArrayList<Area>();
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Area objArea = new Area();
                objArea.setAreaID(rs.getInt("AreaID"));
                objArea.setAreaName(rs.getString("AreaName"));
                areas.add(objArea);
            }
            return areas;
        } catch (SQLException ex) {
            return null;
        }

    }

    public ArrayList<Vendor> getAllVendors() {
        con = new DBConnection();
        ArrayList<Vendor> vendors = new ArrayList<Vendor>();
        try {
            cstmt = con.connection.prepareCall("{call getAllVendors ()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Vendor objVendor = new Vendor();
                objVendor.setUserName(rs.getString("UserName"));
                objVendor.setVendorName(rs.getString("VendorName"));
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
                objVendor.setStatus(rs.getBoolean("Status"));
                vendors.add(objVendor);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return vendors;
    }

    public List<Customer> getAllCustomer() {
        List<Customer> customerList = new ArrayList<Customer>() {
        };
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getAllCustomer()}");
            //cstmt.setString(1, UserName);

            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {
                Customer objCustomer = new Customer();
                objCustomer.setUserName(rs.getString("UserName"));
                objCustomer.setFirstName(rs.getString("FirstName"));
                objCustomer.setLastName(rs.getString("LastName"));


                customerList.add(objCustomer);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return customerList;

    }

    // Reports
    public ArrayList<Customer> getAllCustomers() {
        con = new DBConnection();
        ArrayList<Customer> customers = new ArrayList<Customer>();
        try {
            cstmt = con.connection.prepareCall("{call getAllCustomer()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Customer objCustomer = new Customer();
                Area objArea = new Area();
                objCustomer.setFirstName(rs.getString("FirstName"));
                objCustomer.setLastName(rs.getString("LastName"));
                objArea.setAreaName(rs.getString("AreaName"));
                objCustomer.setArea(objArea);
                objCustomer.setUserName(rs.getString("UserName"));
                objCustomer.setLane(rs.getString("Lane"));
                objCustomer.setMobileNo(rs.getString("MobileNo"));
                objCustomer.setEmailID(rs.getString("EmailID"));
                objCustomer.setStatus(rs.getBoolean("Status"));
                customers.add(objCustomer);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return customers;
    }

    public ArrayList getAllOrders() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getAllOrders ()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("Vendor", rs.getString("Vendor"));
                objMap.put("Customer", rs.getNString("Customer"));
                objMap.put("DeliveryAddress", rs.getString("DeliveryAddress"));
                objMap.put("Status", rs.getBoolean("Status"));
                objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                objMap.put("OrderDate", rs.getDate("OrderDate"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return list;
    }

    public ArrayList getAllFeedback() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getAllFeedback ()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("Customer", rs.getString("Customer"));
                objMap.put("Vendor", rs.getString("Vendor"));
                objMap.put("Message", rs.getString("Message"));
                objMap.put("Date", rs.getDate("Date"));
                objMap.put("Rating", rs.getString("Rating"));
                objMap.put("ID", rs.getInt("FeedbackID"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return list;
    }

    public ArrayList getTodayAllLunch() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getTodayAllLunch ()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("UserName", rs.getString("UserName"));
                objMap.put("MenuID", rs.getString("MenuID"));
                objMap.put("UploadDateTime", rs.getDate("UploadDateTime"));
                objMap.put("TiffinDescription", rs.getString("TiffinDescription"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return list;
    }

    public ArrayList getTodayAllDinner() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getTodayAllDinner ()}");
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("UserName", rs.getString("UserName"));
                objMap.put("MenuID", rs.getString("MenuID"));
                objMap.put("UploadDateTime", rs.getDate("UploadDateTime"));
                objMap.put("TiffinDescription", rs.getString("TiffinDescription"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return list;
    }

    public ArrayList getVendorMenuLunch(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getVendorMenuLunch (?)}");
            cstmt.setString(1, vendor);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("MenuID", rs.getInt("MenuID"));
                objMap.put("UploadDateTime", rs.getDate("UploadDateTime"));
                objMap.put("TiffinDescription", rs.getString("TiffinDescription"));
                objMap.put("ItemID", rs.getInt("ItemID"));
                objMap.put("ItemName", rs.getString("ItemName"));
                objMap.put("TypeName", rs.getString("TypeName"));
                objMap.put("Cost", rs.getInt("Cost"));
                objMap.put("Quantity", rs.getInt("Quantity"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return list;
    }

    public ArrayList getVendorMenuDinner(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            cstmt = con.connection.prepareCall("{call getVendorMenuDinner (?)}");
            cstmt.setString(1, vendor);
            ResultSet rs = cstmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("MenuID", rs.getInt("MenuID"));
                objMap.put("UploadDateTime", rs.getDate("UploadDateTime"));
                objMap.put("TiffinDescription", rs.getString("TiffinDescription"));
                objMap.put("ItemID", rs.getInt("ItemID"));
                objMap.put("ItemName", rs.getString("ItemName"));
                objMap.put("TypeName", rs.getString("TypeName"));
                objMap.put("Cost", rs.getInt("Cost"));
                objMap.put("Quantity", rs.getInt("Quantity"));
                list.add(objMap);
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return list;
    }

    public ArrayList getSuggestion() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            stmt = con.connection.prepareCall("{call getSuggestions()}");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {

                Map objMap = new HashMap();
                objMap.put("Suggestion", rs.getString("Suggestion"));
                objMap.put("DateOfSuggestion", rs.getDate("DateOfSuggestion"));
                objMap.put("emailID", rs.getString("emailID"));
                objMap.put("name", rs.getString("name"));
                list.add(objMap);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        return list;
    }

    public int getUnreadSuggestionCount() {
        con = new DBConnection();
        int count = 0;
        ArrayList list = new ArrayList();
        try {
            stmt = con.connection.prepareCall("{call getUnreadSuggestionCount()}");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return count;
    }

    public boolean deleteFeedback(int id) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call deleteFeedback(?)}");
            cstmt.setInt(1, id);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }

    }

    public boolean updateSuggestionStatus() {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateSuggestionStatus()}");
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }

    }

    public boolean changePassword(String username, String password) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call changePassword(?,?)}");
            cstmt.setString(1, username);
            cstmt.setString(2, password);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }

    }

    public User getUser(String username) {
        con = new DBConnection();
        User objUser = null;
        try {

            cstmt = con.connection.prepareCall("{call getUser(?)}");
            cstmt.setString(1, username);
            ResultSet rsUser = cstmt.executeQuery();

            if (rsUser.next()) {
                objUser = new User();
                objUser.setUserName(rsUser.getString("UserName"));
                objUser.setPassword(rsUser.getString("Password"));
                UserRole objUserRole = new UserRole();
                objUserRole.setRole(rsUser.getString("Role"));
                objUser.setUsertype(objUserRole);
            }

        } catch (Exception e) {
            e.getMessage();
        } finally {
            con.closeConnection();
        }
        return objUser;
    }

    public ArrayList getAllBlockHits() {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            stmt = con.connection.prepareCall("{call getAllBlockHits ()}");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("UserName", rs.getString("UserName"));
                objMap.put("VendorName", rs.getString("VendorName"));
                objMap.put("NoOfHits", rs.getString("NoOfHits"));
                objMap.put("Status", rs.getString("Status"));
                list.add(objMap);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        }
        return list;
    }

    public boolean blockHitVendor(String vendor) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateVendorStatusBlock(?)}");
            cstmt.setString(1, vendor);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean unblockHitVendor(String vendor) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateVendorStatusUnblock(?)}");
            cstmt.setString(1, vendor);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }
    }
    
    public List<ItemType> getAllItemType() {
        List<ItemType> typeList = new ArrayList<ItemType>();
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call  getAllItemType()}");
            ResultSet rs = cstmt.executeQuery();

            while (rs.next()) {

                ItemType objItemType = new ItemType();
                objItemType.setTypeName(rs.getString("TypeName"));
                objItemType.setTypeID(rs.getInt("TypeID"));

                typeList.add(objItemType);

            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return typeList;
    }

    public boolean updateCustomerStatus(String username) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call updateCustomerStatus(?)}");
            cstmt.setString(1, username);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }
    }
    
    public boolean updateVendorStatus(String username) {
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call  updateVendorStatusUnblock(?)}");
            cstmt.setString(1, username);
            int row = cstmt.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }
    }
}
