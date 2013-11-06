/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Tiffin;
import com.dailydibba.bean.TiffinDetails;
import com.dailydibba.bean.Visitor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class postplaceorder implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        String orderID = req.getParameter("orderID");
        String vendor = req.getParameter("vendorUN");
        String tiffinCost = req.getParameter("tiffinCost");
        
        Customer objCustomer = new Customer();
        Tiffin objTiffin = new Tiffin();
        objTiffin = objCustomer.getOrder(orderID);
        
        List<TiffinDetails> tiffindetails = objCustomer.getOrderDetails(orderID);
        
        req.setAttribute("tiffin", objTiffin);
        req.setAttribute("tiffindetails", tiffindetails);
        req.setAttribute("tiffinCost",tiffinCost);
        req.setAttribute("vendorUN",vendor);
        
        return "placeorder.jsp";
    }
    
}
