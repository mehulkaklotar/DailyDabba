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
public class getTotalOrderForVendor implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String user = session.getAttribute("UserName").toString();
        Vendor objVendor = new Vendor();
        int count = objVendor.getTotalOrderForVendor(user);
        req.setAttribute("count", count);
        return "counters.jsp";
    }
    
}
