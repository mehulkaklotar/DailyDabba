/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class deleteMenu implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Vendor objVendor = new Vendor();
        int menuID = Integer.parseInt(req.getParameter("menuID"));
        objVendor.deleteMenu(menuID);
        return "AdminController?action=createUpdateMenuPage";
    }
    
}
