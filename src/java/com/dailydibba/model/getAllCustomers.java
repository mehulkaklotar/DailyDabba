/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Customer;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class getAllCustomers implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
       
        Administrator objAdministrator=new Administrator();
        List<Customer> customers=objAdministrator.getAllCustomer();
        
        req.setAttribute("Customers", customers);
        return "blockCustomer.jsp";  
        
    }
    
    
}
