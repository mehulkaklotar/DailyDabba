/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Visitor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class checkUsername implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        String username = req.getParameter("username");
        
        Visitor objVisitor = new Visitor();
        boolean b = objVisitor.checkUsername(username);
        
        if(b) req.setAttribute("Response", "Available");
        else req.setAttribute("Response", "Unavailable");
        
        return "checkusername.jsp";
    }
    
}
