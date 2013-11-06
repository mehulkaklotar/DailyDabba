/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class getProfileDetailsVendor implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String uname=req.getParameter("uname");
        Vendor vendor=new Vendor();
        vendor.setUserName(uname);
        vendor.getProfileDetails();
        req.setAttribute("Vendor", vendor);
        
//        List<City> cities;
//        Administrator admin=new Administrator();
//        cities=admin.getAllCity();
//        req.setAttribute("Cities", cities);
//        
//        List<Area> area;
//        area=admin.getAllCityArea(vendor.getArea().getCity().getCityID());
//        req.setAttribute("Areas", area);
       
        return "dummyupdateProfileVendor.jsp";
    }
    
}
