/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Tiffin;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class getOrderHistory implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String customer = session.getAttribute("UserName").toString();
        
        Customer objCustomer = new Customer();
        List<Tiffin> orderhistory = objCustomer.getOrderHistory(customer);
        
        req.setAttribute("history", orderhistory);
        
        return "orderHistory.jsp";
    }
    
}
