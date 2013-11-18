/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class addDeliveryArea implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String username = session.getAttribute("UserName").toString();
        int area = Integer.parseInt(req.getParameter("ddlArea"));
        Vendor objVendor = new Vendor();
        objVendor.addDeliveryArea(username, area);
        return "AdminController?action=getDeliveryArea";
    }
    
}
