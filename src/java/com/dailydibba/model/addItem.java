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

/**
 *
 * @author PRACHI
 */
public class addItem implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Item it=new Item();
        it.setItemName(req.getParameter("txtItemName"));
        ItemType type=new ItemType();
        type.setTypeName(req.getParameter("ddlType"));
        it.setType(type);
        Vendor vendor=new Vendor();
        vendor.setUserName(req.getParameter("UserName"));
        vendor.addItem(it);
        req.setAttribute("result", "successful");
        return "successfulUpdationofMenu.jsp";
    }
    
}
