/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Feedback;
import com.dailydibba.bean.Menu;
import com.dailydibba.bean.Vendor;
import com.dailydibba.bean.Visitor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class cancelOrder implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String orderID = req.getParameter("orderID");


        Customer objCustomer = new Customer();
        objCustomer.deleteOrder(orderID);

        String vendorUN = req.getParameter("vendorUN");
        Visitor objVisitor = new Visitor();
        Vendor objVendor = objVisitor.getVendor(vendorUN);

        int rating = objVisitor.getRatings(vendorUN);

        //Vendor menu
        Menu objMenuLunch = objVendor.getVendorMenuLunch(vendorUN);
        Menu objMenuDinner = objVendor.getVendorMenuDinner(vendorUN);
        
        // Get the details of feedback of that vendor
        List<Feedback> feedbackList = objVisitor.getFeedbackForVendor(vendorUN);
        req.setAttribute("feedback", feedbackList);
        req.setAttribute("vendor", objVendor);
        req.setAttribute("rating", rating);
        req.setAttribute("menuLunch", objMenuLunch);
        req.setAttribute("menuDinner", objMenuDinner);

        return "vendor.jsp";
    }
}
