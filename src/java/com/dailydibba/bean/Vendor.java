package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Vendor extends User {

    private String vendorName;
    private String mobileNo;
    private String emailID;
    private String lane;
    private Area area;
    private String ownerName;
    private String landlineNumber;
    private boolean flag;
    private boolean status;
    private int rating;
    private List<Area> areas;
    DBConnection con;
    CallableStatement callableStatement = null;

    public Vendor() {
    }

    public Vendor(String userName, String password, String vendorName, String mobileNo, String emailID, String lane, Area area, String ownerName, String landlineNumber, boolean flag) {
        this.vendorName = vendorName;
        this.mobileNo = mobileNo;
        this.emailID = emailID;
        this.lane = lane;
        this.area = area;
        this.ownerName = ownerName;
        this.landlineNumber = landlineNumber;
        this.flag = flag;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }
    
    

    public List<Area> getAreas() {
        return areas;
    }

    public void setAreas(List<Area> areas) {
        this.areas = areas;
    }

    public String getVendorName() {
        return vendorName;
    }

    public void setVendorName(String vendorName) {
        this.vendorName = vendorName;
    }

    public String getMobileNo() {
        return mobileNo;
    }

    public void setMobileNo(String mobileNo) {
        this.mobileNo = mobileNo;
    }

    public String getEmailID() {
        return emailID;
    }

    public void setEmailID(String emailID) {
        this.emailID = emailID;
    }

    public String getLane() {
        return lane;
    }

    public void setLane(String lane) {
        this.lane = lane;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getLandlineNumber() {
        return landlineNumber;
    }

    public void setLandlineNumber(String landlineNumber) {
        this.landlineNumber = landlineNumber;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public ArrayList<Tiffin> getAllOrderForVendor(String vendor) {
        try {
            con = new DBConnection();


            ArrayList<Tiffin> tiffinList = new ArrayList<Tiffin>();
            callableStatement = con.connection.prepareCall("{call getAllOrderForVendor(?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Tiffin objTiffin = new Tiffin();
                objTiffin.setDeliveryAddress(rs.getString("DeliveryAddress"));
                objTiffin.setNumberOfTiffin(rs.getInt("NoOfTiffin"));
                objTiffin.setOrderDate(rs.getDate("OrderDate"));
                objTiffin.setUserNameCustomer(rs.getString("UserName"));

                tiffinList.add(objTiffin);
            }
            return tiffinList;
        } catch (SQLException ex) {
            return null;

        }
    }

    public boolean updateProfile() {
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getUpdateProfile(?,?,?,?,?,?,?,?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setString(2, password);
            callableStatement.setString(3, vendorName);
            callableStatement.setString(4, mobileNo);
            callableStatement.setString(5, emailID);
            callableStatement.setString(6, lane);
            callableStatement.setInt(7, area.getAreaID());
            callableStatement.setString(8, ownerName);
            callableStatement.setString(9, landlineNumber);
            callableStatement.setBoolean(0, flag);
            callableStatement.registerOutParameter(2, java.sql.Types.INTEGER);
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


    public boolean blockCustomer(String username) {
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getBlockCustomer(?)}");
            callableStatement.setString(1, userName);
            callableStatement.registerOutParameter(2, java.sql.Types.INTEGER);
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

     public ArrayList<Item> getItemOfType(String typeName){
         try {
            con = new DBConnection();
            ArrayList<Item> itemList = new ArrayList<Item>();
            callableStatement = con.connection.prepareCall("{call getItemDetailsTypeName_UserName(?,?)}");
            callableStatement.setString(1, typeName);
            callableStatement.setString(2,userName);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Item item=new Item(rs.getInt(1), rs.getString(2), new ItemType(rs.getInt(3), rs.getString(4)));
                itemList.add(item);
            }
            return itemList;
        } catch (SQLException ex) {
            return null;

        }
    }
     
     public Menu getVendorMenu(String vendor){
         try {
            con = new DBConnection();
            ArrayList<MenuItem> menuList = new ArrayList<MenuItem>();
            callableStatement = con.connection.prepareCall("{call getVendorMenu(?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            Menu objMenu = new Menu();
            
            while (rs.next()) {
                objMenu.setMenuID(rs.getInt("MenuID"));
                objMenu.setTiffinName(rs.getString("TiffinDescription"));
                MenuItem objMenuItem = new MenuItem();
                
                Item objItem = new Item();
                objItem.setItemID(rs.getInt("ItemID"));
                objItem.setItemName(rs.getString("ItemName"));
                
                ItemType objItemType = new ItemType();
                objItemType.setTypeName(rs.getString("TypeName"));
                objItem.setType(objItemType);
                
                objMenuItem.setItem(objItem);
                objMenuItem.setCost(rs.getDouble("Cost"));
                objMenuItem.setQuantity(rs.getInt("Quantity"));
                menuList.add(objMenuItem);
            }
            objMenu.setMenuItem(menuList);
            return objMenu;
        } catch (SQLException ex) {
            return null;

        }
    }
    
     
     public boolean updateMenu(Menu m){
    
        //Author: Prachi Deodhar
        //Date: 13-October-2013
        //For updating menu for lunch and dinner daily
        try{
            con=new DBConnection();
            callableStatement=con.connection.prepareCall("{call insertmenu(?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setDate(2, m.getUploadDateTime());
            callableStatement.setString(3,m.getTiffinName());
            int i=callableStatement.executeUpdate();
            if(i>0){
                con=new DBConnection();
                callableStatement=con.connection.prepareCall("{call  getmaxmenuid()}");
                ResultSet rs=callableStatement.executeQuery();
                rs.next();
                int menuID=rs.getInt(1);

                for (MenuItem mi : m.getMenuItem()){
                    con=new DBConnection();
                    callableStatement=con.connection.prepareCall("{call  insertMenuItem(?,?,?,?)}");
                    callableStatement.setInt(1, menuID);
                    int itemId=mi.getItem().getItemID();
                    callableStatement.setInt(2, itemId);
                    callableStatement.setInt(3, (int)mi.getCost());
                    callableStatement.setInt(4, mi.getQuantity());
                    i=callableStatement.executeUpdate();
                    if(i<1){
                        return false;
                    }
                }  
         }else{
                return false;
            }
            return true;
        }catch(SQLException ex){
        return false;
        }
    }
     
       public void getProfileDetails(){
        con=new DBConnection();
        try {
            callableStatement=con.connection.prepareCall("{call getVendor(?)}");
            callableStatement.setString(1, userName);
            ResultSet rs=callableStatement.executeQuery();
            if(rs.next()){
                vendorName=rs.getString("VendorName");
                mobileNo=rs.getString("MobileNo");
                ownerName=rs.getString("OwnerName");
                emailID=rs.getString("EmailID");
                lane=rs.getString("Lane");
                ownerName=rs.getString("OwnerName");
                landlineNumber=rs.getString("LandlineNo");
                area=new Area();
                area.setAreaID(rs.getInt("AreaID"));
                area.setAreaName(rs.getString("AreaName"));
                area.setCity(new City());
                area.getCity().setCityID(rs.getInt("CityID"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
   public boolean addItem(Item it){
         con=new DBConnection();
        try {
            callableStatement=con.connection.prepareCall("{call getTypeID(?)}");
            callableStatement.setString(1,it.getType().getTypeName());
            ResultSet rs=callableStatement.executeQuery();
            if(rs.next())
                it.getType().setTypeID(rs.getInt("TypeID"));
            con=new DBConnection();
            callableStatement=con.connection.prepareCall("{call insertItemDetails(?,?,?)}");
            callableStatement.setString(1, it.getItemName());
            callableStatement.setInt(2, it.getType().getTypeID());
            callableStatement.setString(3, userName);
            int i=callableStatement.executeUpdate();
            if(i>=1)
                return true;
            else
                return false;
            
        } catch (SQLException ex) {
            return false;
        }
         
        
     }

}
