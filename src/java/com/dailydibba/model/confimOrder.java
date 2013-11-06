/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class confimOrder implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        String orderID = req.getParameter("orderID");
        Customer objCustomer = new Customer();
        //boolean b = objCustomer.updateOrder(orderID);
        //if(b) 
            return "successorder.jsp";
    }
    
}
