package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
    private boolean customizableFlag;
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

            callableStatement = con.connection.prepareCall("{call UpdateVendor(?,?,?,?,?,?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setString(3, vendorName);
            callableStatement.setString(4, mobileNo);
            callableStatement.setString(5, emailID);
            callableStatement.setString(6, lane);
            callableStatement.setInt(2, area.getAreaID());
            callableStatement.setString(7, ownerName);
            callableStatement.setString(8, landlineNumber);
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

    public ArrayList<Item> getItemOfType(String typeName) {
        try {
            con = new DBConnection();
            ArrayList<Item> itemList = new ArrayList<Item>();
            callableStatement = con.connection.prepareCall("{call getItemDetailsTypeName_UserName(?,?)}");
            callableStatement.setString(1, typeName);
            callableStatement.setString(2, userName);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Item item = new Item(rs.getInt(1), rs.getString(2), new ItemType(rs.getInt(3), rs.getString(4)));
                itemList.add(item);
            }
            return itemList;
        } catch (SQLException ex) {
            return null;

        }
    }

    public Menu getVendorMenu(String vendor) {
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

    public Menu getVendorMenuLunch(String vendor) {
        try {
            con = new DBConnection();
            ArrayList<MenuItem> menuList = new ArrayList<MenuItem>();
            callableStatement = con.connection.prepareCall("{call getVendorMenuLunch(?)}");
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

    public Menu getVendorMenuDinner(String vendor) {
        try {
            con = new DBConnection();
            ArrayList<MenuItem> menuList = new ArrayList<MenuItem>();
            callableStatement = con.connection.prepareCall("{call getVendorMenuDinner(?)}");
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

    public boolean updateMenu(Menu m) {

        //Author: Prachi Deodhar
        //Date: 13-October-2013
        //For updating menu for lunch and dinner daily
        try {
            con = new DBConnection();
            callableStatement = con.connection.prepareCall("{call insertmenu(?,?,?,?)}");
            callableStatement.setString(1, userName);
            callableStatement.setDate(2, m.getUploadDateTime());
            callableStatement.setString(3, m.getTiffinName());
            callableStatement.setBoolean(4, m.isIsLunch());
            int i = callableStatement.executeUpdate();
            if (i > 0) {
                con = new DBConnection();
                callableStatement = con.connection.prepareCall("{call  getmaxmenuid()}");
                ResultSet rs = callableStatement.executeQuery();
                rs.next();
                int menuID = rs.getInt(1);
                m.setMenuID(menuID);
                for (MenuItem mi : m.getMenuItem()) {
                    con = new DBConnection();
                    callableStatement = con.connection.prepareCall("{call  insertMenuItem(?,?,?,?)}");
                    callableStatement.setInt(1, menuID);
                    int itemId = mi.getItem().getItemID();
                    callableStatement.setInt(2, itemId);
                    callableStatement.setInt(3, (int) mi.getCost());
                    callableStatement.setInt(4, mi.getQuantity());
                    i = callableStatement.executeUpdate();
                    if (i < 1) {
                        return false;
                    }
                }
            } else {
                return false;
            }
            return true;
        } catch (SQLException ex) {
            return false;
        }
    }

    public void getProfileDetails() {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call getVendor(?)}");
            callableStatement.setString(1, userName);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                vendorName = rs.getString("VendorName");
                mobileNo = rs.getString("MobileNo");
                ownerName = rs.getString("OwnerName");
                emailID = rs.getString("EmailID");
                lane = rs.getString("Lane");
                ownerName = rs.getString("OwnerName");
                landlineNumber = rs.getString("LandlineNo");
                status=rs.getBoolean("Status");
                customizableFlag=rs.getBoolean("CustomizableFlag");
                area = new Area();
                area.setAreaID(rs.getInt("AreaID"));
                area.setAreaName(rs.getString("AreaName"));
                area.setCity(new City());
                area.getCity().setCityID(rs.getInt("CityID"));
                area.getCity().setCityName(rs.getString("CityName"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Vendor.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public boolean addItem(Item it) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call getTypeID(?)}");
            callableStatement.setString(1, it.getType().getTypeName());
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                it.getType().setTypeID(rs.getInt("TypeID"));
            }
            con = new DBConnection();
            callableStatement = con.connection.prepareCall("{call insertItemDetails(?,?,?)}");
            callableStatement.setString(1, it.getItemName());
            callableStatement.setInt(2, it.getType().getTypeID());
            callableStatement.setString(3, userName);
            int i = callableStatement.executeUpdate();
            if (i >= 1) {
                return true;
            } else {
                return false;
            }

        } catch (SQLException ex) {
            return false;
        }


    }

    public ArrayList getVendorLunchList(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getVendorLunchList (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("OrderID", rs.getString("OrderID"));
                objMap.put("DeliveryAddress", rs.getString("DeliveryAddress"));
                objMap.put("MenuID", rs.getInt("MenuID"));
                objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                objMap.put("Status", rs.getInt("Status"));
                //objMap.put("ItemName", rs.getString("ItemName"));
                //objMap.put("TypeName", rs.getString("TypeName"));
                objMap.put("Vendor", rs.getString("Vendor"));
                objMap.put("Customer", rs.getString("Customer"));
                objMap.put("Total", rs.getString("Total"));
                //objMap.put("Cost", rs.getInt("Cost"));
                //objMap.put("Quantity", rs.getInt("Quantity"));
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

    public ArrayList getVendorLunchOrder(String id) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            callableStatement = con.connection.prepareCall("{call getOrderDetails (?)}");
            callableStatement.setString(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                //objMap.put("OrderID", rs.getString("OrderID"));
                //objMap.put("MenuID", rs.getInt("MenuID"));
                //objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                //objMap.put("Status", rs.getInt("Status"));
                objMap.put("ItemName", rs.getString("ItemName"));
                objMap.put("TypeName", rs.getString("TypeName"));
                //objMap.put("Vendor", rs.getString("Vendor"));
                //objMap.put("Customer", rs.getString("Customer"));
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

    public ArrayList getVendorDinnerList(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getVendorDinnerList (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("OrderID", rs.getString("OrderID"));
                objMap.put("DeliveryAddress", rs.getString("DeliveryAddress"));
                objMap.put("MenuID", rs.getInt("MenuID"));
                objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                objMap.put("Status", rs.getInt("Status"));
                //objMap.put("ItemName", rs.getString("ItemName"));
                //objMap.put("TypeName", rs.getString("TypeName"));
                objMap.put("Vendor", rs.getString("Vendor"));
                objMap.put("Customer", rs.getString("Customer"));
                objMap.put("Total", rs.getString("Total"));
                //objMap.put("Cost", rs.getInt("Cost"));
                //objMap.put("Quantity", rs.getInt("Quantity"));
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

    public ArrayList getVendorDinnerOrder(String id) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            callableStatement = con.connection.prepareCall("{call getOrderDetails (?)}");
            callableStatement.setString(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                //objMap.put("OrderID", rs.getString("OrderID"));
                //objMap.put("MenuID", rs.getInt("MenuID"));
                //objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                //objMap.put("Status", rs.getInt("Status"));
                objMap.put("ItemName", rs.getString("ItemName"));
                objMap.put("TypeName", rs.getString("TypeName"));
                //objMap.put("Vendor", rs.getString("Vendor"));
                //objMap.put("Customer", rs.getString("Customer"));
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

    public ArrayList getAllOrdersForVendor(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            callableStatement = con.connection.prepareCall("{call getAllOrdersForVendor (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("Vendor", rs.getString("Vendor"));
                objMap.put("Customer", rs.getString("Customer"));
                objMap.put("DeliveryAddress", rs.getString("DeliveryAddress"));
                //objMap.put("Status", rs.getInt("Status"));
                objMap.put("NoOfTiffin", rs.getInt("NoOfTiffin"));
                objMap.put("OrderDate", rs.getDate("OrderDate"));
                //objMap.put("Vendor", rs.getString("Vendor"));
                //objMap.put("Customer", rs.getString("Customer"));
                objMap.put("OrderID", rs.getString("OrderID"));
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

    public Vendor getVendorStatus(String username) {
        Vendor objVendor = null;
        con = new DBConnection();
        try {

            callableStatement = con.connection.prepareCall("{call getVendorStatus(?)}");
            callableStatement.setString(1, username);

            ResultSet rs = callableStatement.executeQuery();

            if (rs.next()) {
                objVendor = new Vendor();
                objVendor.setStatus(rs.getBoolean("Status"));
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {

            con.closeConnection();
        }
        return objVendor;

    }

    public ArrayList getDeliveryArea(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {
            callableStatement = con.connection.prepareCall("{call getDeliveryArea (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("AreaName", rs.getString("AreaName"));
                objMap.put("CityName", rs.getString("CityName"));
                objMap.put("AreaID", rs.getInt("AreaID"));
                objMap.put("vendor", vendor);
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

    public boolean deleteVendorArea(String vendor, int id) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call deleteVendorArea (?,?)}");
            callableStatement.setString(1, vendor);
            callableStatement.setInt(2, id);
            int row = callableStatement.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public ArrayList getAllItemsByVendor(String vendor) {
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getAllItemsByVendor (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Map objMap = new HashMap();
                objMap.put("ItemID", rs.getInt("ItemID"));
                objMap.put("ItemName", rs.getString("ItemName"));
                objMap.put("TypeID", rs.getInt("TypeID"));
                objMap.put("TypeName", rs.getString("TypeName"));
                objMap.put("UserName", rs.getString("UserName"));

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

    public boolean addDeliveryArea(String vendor, int area) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call insertVendorArea (?,?)}");
            callableStatement.setString(1, vendor);
            callableStatement.setInt(2, area);
            int row = callableStatement.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public List<MenuItem> getMenuDetails(int MenuID) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call getMenuItems(?)}");
            callableStatement.setInt(1, MenuID);
            ResultSet rs = callableStatement.executeQuery();
            List<MenuItem> list;
            list = new ArrayList<MenuItem>();
            while (rs.next()) {
                MenuItem mi = new MenuItem();
                Item it = new Item();
                it.setItemName(rs.getString("ItemName"));
                ItemType type = new ItemType();
                type.setTypeName(rs.getString("TypeName"));
                it.setType(type);
                mi.setItem(it);
                mi.setCost(rs.getDouble("Cost"));
                mi.setQuantity(rs.getInt("Quantity"));
                list.add(mi);
            }
            return list;
        } catch (SQLException exc) {
            exc.printStackTrace();
            return null;
        }
    }

    public boolean deleteMenu(int menuID) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call deleteMenu (?)}");
            callableStatement.setInt(1, menuID);
            int row = callableStatement.executeUpdate();
            if (row == 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean updateItem(Item it) {
        con = new DBConnection();
        try {
            callableStatement = con.connection.prepareCall("{call getTypeID(?)}");
            callableStatement.setString(1, it.getType().getTypeName());
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                it.getType().setTypeID(rs.getInt("TypeID"));
            }
            con = new DBConnection();
            callableStatement = con.connection.prepareCall("{call updateItemDetails(?,?,?,?)}");
            callableStatement.setString(1, it.getItemName());
            callableStatement.setInt(2, it.getType().getTypeID());
            callableStatement.setString(3, userName);
            callableStatement.setInt(4, it.getItemID());
            int i = callableStatement.executeUpdate();
            if (i >= 1) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            return false;
        }
    }

    public boolean deleteItem(int item_id) {
        con = new DBConnection();
        CallableStatement cstmt;
        try {
            cstmt = con.connection.prepareCall("{call deleteItemDetails(?)}");
            cstmt.setInt(1, item_id);
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

    public Item getItemDetails(int itemId) {
        Item objItem = null;
        CallableStatement cstmt;
        con = new DBConnection();
        try {
            cstmt = con.connection.prepareCall("{call getItemDetails(?)}");
            cstmt.setInt(1, itemId);
            ResultSet rs = cstmt.executeQuery();
            if (rs.next()) {
                objItem = new Item();
                objItem.setItemName(rs.getString("ItemName"));
                objItem.setItemID(rs.getInt("ItemID"));
                ItemType objItemType = new ItemType();
                //ct.setCityID(rs.getInt("CityID"));
                objItemType.setTypeName(rs.getString("TypeName"));
                objItem.setType(objItemType);
            }
        } catch (SQLException ex) {
            return null;
        }
        return objItem;
    }
    
    public int getTotalOrderForVendor(String vendor) {
        int count = 0;
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getTotalOrderForVendor (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TotalOrder");
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return count;
    }
    
    public int getLastMonthOrderForVendor(String vendor) {
        int count = 0;
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getLastMonthOrderForVendor (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TotalOrder");
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return count;
    }
    
    public int getLastWeekOrderForVendor(String vendor) {
        int count = 0;
        con = new DBConnection();
        ArrayList list = new ArrayList();
        try {

            callableStatement = con.connection.prepareCall("{call getLastWeekOrderForVendor (?)}");
            callableStatement.setString(1, vendor);
            ResultSet rs = callableStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt("TotalOrder");
            }
            rs.close();
        } catch (Exception ex) {
            ex.getMessage();
        } finally {
            con.closeConnection();
        }
        return count;
    }
    
}
