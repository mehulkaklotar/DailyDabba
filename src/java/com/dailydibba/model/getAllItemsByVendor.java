/*
 * To change this template, choose Tools | Templates
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
 * @author kaklo
 */
public class getAllItemsByVendor implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String user = session.getAttribute("UserName").toString();
        Vendor objVendor = new Vendor();
        ArrayList list = objVendor.getAllItemsByVendor(user);
        req.setAttribute("items", list);
        return "items.jsp";
    }
    
}
