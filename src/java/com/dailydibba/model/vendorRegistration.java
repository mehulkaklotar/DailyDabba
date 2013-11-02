/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Visitor;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AKYP
 */
public class vendorRegistration implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
       
        Visitor objVisitor = new Visitor();
        objVisitor.insertUserRoles(req.getParameter("txtUsername"),"Vendor");
        
        objVisitor.insertVendor(req.getParameter("txtUsername"),1, req.getParameter("txtVendorname"), req.getParameter("txtMobileNumber"),req.getParameter("txtEmailID"), req.getParameter("txtFlatNumber")+","+req.getParameter("txtStreetName")+","+req.getParameter("txtLandmark"), req.getParameter("txtOwnername"), req.getParameter("txtLandlineNumber"),false, false);

        // System.out.println(req.getParameter("txtuserName"));
	
	List<City> cities=new ArrayList<City>();
        Visitor visitor=new Visitor();
        cities=visitor.getCity();
        req.setAttribute("Cities", cities);

    
        //sendsms();
        return "verification.jsp";
    }
    
}
