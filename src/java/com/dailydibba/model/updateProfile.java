/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Customer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class updateProfile implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Customer cust=new Customer();
        cust.setUserName(req.getParameter("txtUsername"));
        cust.setFirstName(req.getParameter("txtFirstname"));
        cust.setLastName(req.getParameter("txtLastname"));
        cust.setMobileNo(req.getParameter("txtMobileNumber"));
        cust.setEmailID(req.getParameter("txtEmailID"));
        Area ar=new Area();
        int areaID=Integer.parseInt(req.getParameter("ddlArea"));
        ar.setAreaID(areaID);
        cust.setArea(ar);
        cust.setLane(req.getParameter("txtAddress"));
        cust.updateCustomerProfile();
        return "Successful.jsp";
    }
    
}
