/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Vivek
 */
public class getVendorProfile implements Action {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String uname=req.getParameter("uname");
        Vendor vendor=new Vendor();
        vendor.setUserName(uname);
        ArrayList areas=new ArrayList();
        vendor.getProfileDetails();
        areas=vendor.getDeliveryArea(uname);
        req.setAttribute("vendor", vendor);
        req.setAttribute("areas", areas);
        return "vendorProfile.jsp";
    }
    public static void main(String args[]){
    //String uname=req.getParameter("uname");
        Vendor vendor=new Vendor();
        vendor.setUserName("Sai");
        vendor.getProfileDetails();
        System.out.println(vendor.getEmailID());
    }
}
