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
import javax.servlet.http.HttpSession;

/**
 *
 * @author HR
 */
public class getDeliveryArea implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        HttpSession session = req.getSession();
        String vendor = session.getAttribute("UserName").toString();
        Vendor objVendor = new Vendor();
        ArrayList objArrayList = objVendor.getDeliveryArea(vendor);
        req.setAttribute("areas", objArrayList);
        return "deliveryArea.jsp";
    }
    
}
