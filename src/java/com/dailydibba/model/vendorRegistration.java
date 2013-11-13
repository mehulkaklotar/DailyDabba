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
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AKYP
 */
public class vendorRegistration implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
       
        Visitor objVisitor = new Visitor();
        objVisitor.insertUser(req.getParameter("username"), req.getParameter("password"));
        objVisitor.insertUserRoles(req.getParameter("username"),"Vendor");
        
        objVisitor.insertVendor(req.getParameter("username"), Integer.parseInt(req.getParameter("area")), req.getParameter("vendorname"), req.getParameter("mobileno"),req.getParameter("emailID"), req.getParameter("flat")+","+req.getParameter("street")+","+req.getParameter("landmark"), req.getParameter("ownername"), req.getParameter("landlineno"),false, false);
        
        UUID idOne = UUID.randomUUID();
        String str = "" + idOne;
        int uid = str.hashCode();
        String filterStr = "" + uid;
        str = filterStr.replaceAll("-", "");
        String code = str;
        System.out.println(code);
        
        HttpSession session = req.getSession();
        session.setAttribute("code", code);
        
        //sms send
        SMSSender.smsSender("akypvs", "156424", "918866464643","www.dailydabba.co.in \n Verification Code : "+code, "WebSMS", "0");
        
        return "vendorsuccess.jsp";
    }
    
}
