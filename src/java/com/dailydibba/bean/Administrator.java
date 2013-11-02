package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author AKYP
 */
public class Administrator extends User {

    DBConnection con;
    CallableStatement cstmt;
    
    public List<Area> getAllArea()
    {
        List<Area> areaList = new ArrayList<Area>();
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getAllArea()}");
            ResultSet rs = cstmt.executeQuery();
            
            while (rs.next()) {
                
                Area objArea= new Area();
                objArea.setAreaID(rs.getInt("AreaID"));
                objArea.setAreaName(rs.getString("AreaName"));
                
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
    
    public List<City> getAllCity()
    {
        List<City> cityList = new ArrayList<City>();
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getAllCity()}");
            ResultSet rs = cstmt.executeQuery();
            
            while (rs.next()) {
                
                City objCity= new City();
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
    
    public City getCity(int city_id)
    {
        City objCity = null;
        con = new DBConnection();
        try {

            cstmt = con.connection.prepareCall("{call getCity(?)}");
            cstmt.setInt(1, city_id);
            ResultSet rs = cstmt.executeQuery();
            
            if (rs.next()) {
                
                objCity= new City();
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

    public boolean deleteCity(int city_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:
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

    public boolean deleteArea(int area_id) {
        //Author: Vivek Shukla
        //Date: 14-October-2013
        //Description:

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
     try{
     cstmt=con.connection.prepareCall("{call getVendor(?)}");
     cstmt.setString(1,user_name);
      
//      callstmt = con.connection.prepareCall("{call getRatings(?)}");
     ResultSet rs=cstmt.executeQuery();          
                while(rs.next()){
                String UserName=rs.getString("UserName");
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
      }catch(SQLException ex){
            ex.getMessage();
        }
     finally {
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
   
}
