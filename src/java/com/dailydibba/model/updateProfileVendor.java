/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class updateProfileVendor implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Vendor v=new Vendor();
        v.setUserName(req.getParameter("txtUsername"));
        v.setVendorName(req.getParameter("txtVendorname"));
        v.setOwnerName(req.getParameter("txtOwnername"));
        v.setMobileNo(req.getParameter("txtMobileNumber"));
        v.setEmailID(req.getParameter("txtEmailID"));
        Area ar=new Area();
        ar.setAreaID(Integer.parseInt(req.getParameter("ddlArea")));
        v.setArea(ar);
        v.setLane(req.getParameter("txtAddressVendor"));
        v.setLandlineNumber(req.getParameter("txtLandlineNumber"));
        v.updateProfile();
        return "AdminController?action=getProfileDetailsVendor";
    }
    
}
