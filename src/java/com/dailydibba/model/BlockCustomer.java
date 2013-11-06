/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;


import com.dailydibba.bean.Vendor;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class BlockCustomer implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String vendorUN = req.getParameter("vendorUN");
       
        Vendor objVendor = new Vendor();
        objVendor.setUserName(vendorUN);
        objVendor.blockCustomer(req.getParameter("customerList"));
       // req.setAttribute("cities", cities);
        //go to vendor.jsp
        req.setAttribute("blocked",objVendor );
        return "blockCustomer.jsp";
        
    }
    
}
