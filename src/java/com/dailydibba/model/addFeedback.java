/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import java.util.Date;
import com.dailydibba.action.Action;
import com.dailydibba.bean.Feedback;
import com.dailydibba.bean.Menu;
import com.dailydibba.bean.Vendor;
import com.dailydibba.bean.Visitor;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HR
 */
public class addFeedback implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        String message = req.getParameter("message");
        String vendorUN = req.getParameter("vendorUN");
        int rating = Integer.parseInt(req.getParameter("rating"));
        Timestamp date = new Timestamp(new Date().getTime());
        
        Feedback objFeedback = new Feedback(); //creating feedback object
        objFeedback.insertFeedback("Hiren",vendorUN,date,message,rating); // calling method and inserting data
        
        Visitor objVisitor = new Visitor();
        Vendor objVendor = objVisitor.getVendor(vendorUN);
        
        rating = objVisitor.getRatings(vendorUN);
        
        //Vendor menu
        Menu objMenu = objVendor.getVendorMenu(vendorUN);
        objMenu.setVendorUserName(vendorUN);
        
        // Get the details of feedback of that vendor
        List<Feedback> feedbackList = objVisitor.getFeedbackForVendor(vendorUN);
        req.setAttribute("feedback", feedbackList);
        req.setAttribute("vendor", objVendor);
        req.setAttribute("rating", rating);
        req.setAttribute("menu", objMenu);
        // Go to vendor.jsp
        return "vendor.jsp";
    }
    
}
