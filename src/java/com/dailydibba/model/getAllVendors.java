/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Vendor;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AKYP
 */
public class getAllVendors implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
       Administrator objAdmin=new Administrator();
    
        List<Area> areas= objAdmin.getAllArea();
       //Vendor objVendor=new Vendor();
       List<Vendor> vendorList=new ArrayList<Vendor>();
       vendorList=objAdmin.getAllVendor();
       req.setAttribute("areas", areas);
       req.setAttribute("vendorList",vendorList);
       return "vendors.jsp";
    }
}
