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
public class insertSuggestion implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        Visitor objVisitor = new Visitor();
        objVisitor.insertSuggestion(req.getParameter("message"), req.getParameter("email"), req.getParameter("name"), 1);
        
        req.setAttribute("Message", "Thanks for your suggestion. We will try to improve.");
        return "contact.jsp";
    }
    
}
