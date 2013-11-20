/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class blockVendor implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String uname=req.getParameter("UserName");
        Customer objCustomer=new Customer();
        objCustomer.increaseBlockVendorHits(uname);
        return "Controller?action=getIndex";
    }
    
}
