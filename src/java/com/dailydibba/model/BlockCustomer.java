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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kiran
 */
public class BlockCustomer implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session=req.getSession();
        String vendorUN = session.getAttribute("UserName").toString();      
        Vendor objVendor = new Vendor();
        objVendor.setUserName(vendorUN);
        objVendor.blockCustomer(req.getParameter("customerUN"));
       // req.setAttribute("cities", cities);
        //go to vendor.jsp
        req.setAttribute("blocked",objVendor );
        return "AdminController?action=getCustomerList" ;
        
    }
    
}
