/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Vendor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vivek
 */
public class getCustomerProfile implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        Customer customer=new Customer();
        String uname=req.getParameter("uname");
        customer.setUserName(uname);
        customer.getProfileDetails();
        req.setAttribute("customer", customer);
        
        List<City> cities;
        Administrator admin=new Administrator();
        cities=admin.getAllCity();
        req.setAttribute("Cities", cities);
        
        List<Area> area;
        area=admin.getAllCityArea(customer.getArea().getCity().getCityID());
        req.setAttribute("Areas", area);
       
        return "customerProfile.jsp";
    }
    public static void main(String args[]){
    //String uname=req.getParameter("uname");
       Customer customer=new Customer();
        //String uname=req.getParameter("uname");
        customer.setUserName("Hiren");
        customer.getProfileDetails();
        System.out.println(customer.getFirstName());
       // req.setAttribute("Customer", customer);
    }
}
