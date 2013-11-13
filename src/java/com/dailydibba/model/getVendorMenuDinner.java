/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HR
 */
public class getVendorMenuDinner implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String vendor = req.getParameter("id");
        Administrator objAdministrator = new Administrator();
        ArrayList objArrayList =  objAdministrator.getVendorMenuDinner(vendor);
        req.setAttribute("menu", objArrayList);
        return "vendorMenuDinner.jsp";
    }
    
}
