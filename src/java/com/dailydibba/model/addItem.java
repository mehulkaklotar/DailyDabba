/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.ItemType;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PRACHI
 */
public class addItem implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String user = session.getAttribute("UserName").toString();
        Item it=new Item();
        it.setItemName(req.getParameter("txtItemName"));
        ItemType type=new ItemType();
        type.setTypeName(req.getParameter("ddlType"));
        it.setType(type);
        Vendor vendor=new Vendor();
        vendor.setUserName(user);
        vendor.addItem(it);
        return "AdminController?action=getAllItemsByVendor";
    }
    
}
