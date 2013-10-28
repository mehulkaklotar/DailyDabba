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
public class getProfileDetailsCustomer implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Customer customer=new Customer();
        String uname=req.getParameter("uname");
        customer.setUserName(uname);
        customer.getProfileDetails();;
        req.setAttribute("Customer", customer);
        return "/dummyupdateProfileCustomer.jsp";
    }
    
}
