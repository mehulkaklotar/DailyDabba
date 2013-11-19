/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.ItemType;
import com.dailydibba.bean.Vendor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class updateItem implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String user = session.getAttribute("UserName").toString();
        Item it=new Item();
        it.setItemName(req.getParameter("txtItemName"));
        it.setItemID(Integer.parseInt(req.getParameter("txtItemID")));
        ItemType type=new ItemType();
        type.setTypeName(req.getParameter("ddlType"));
        it.setType(type);
        Vendor vendor=new Vendor();
        vendor.setUserName(user);
        vendor.updateItem(it);
        return "AdminController?action=getAllItemsByVendor";
    }
    
}
