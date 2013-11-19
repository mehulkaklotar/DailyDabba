/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class getTotalVendors implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        int count = objAdministrator.getTotalVendors();
        req.setAttribute("count", count);
        return "counters.jsp";
    }
    
}
