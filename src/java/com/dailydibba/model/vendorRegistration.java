/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Visitor;
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
        objVisitor.insertUser(req.getParameter("txtUsername"), req.getParameter("txtPassword"), "Vendor");
        objVisitor.insertVendor(req.getParameter("txtUsername"),1, req.getParameter("txtVendorName"), req.getParameter("txtMobileNumber"),req.getParameter("txtEmailID"), req.getParameter("txtFlatNumber")+","+req.getParameter("txtStreetName")+","+req.getParameter("txtLandmark"), req.getParameter("txtOwnerName"), req.getParameter("txtLandlineNumber"),false, false);
         
        // System.out.println(req.getParameter("txtuserName"));
        Random r = new Random();
        int START = 100000;
        int END = 999999;
        int rm = r.nextInt(END - START + 1) + START;

        //sendsms();
        return "verification.jsp";
    }
    
}
