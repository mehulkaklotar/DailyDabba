/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class deleteItem implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Vendor objVendor = new Vendor();
        int item_id = Integer.parseInt(req.getParameter("itemId"));
        objVendor.deleteItem(item_id);
        return "AdminController?action=getAllItemsByVendor";        
    }   
}
