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
 * @author HR
 */
public class getVendorLunchOrder implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        String id = req.getParameter("id");
        Vendor objVendor = new Vendor();
        ArrayList objArrayList = objVendor.getVendorLunchOrder(id);
        req.setAttribute("lunch", objArrayList);
        return "vendorLunchOrder.jsp";
    }
    
}
