/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.User;
import com.dailydibba.bean.Visitor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class Login implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        Visitor objVisitor = new Visitor();
        User objUser= objVisitor.login(username);
        if(objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Customer")){
            req.setAttribute("Message", "Successfully Logged in!!");
            session.setAttribute("UserName", username);
            return "login.jsp";
        }
        else if(objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Vendor")){
            req.setAttribute("Message", "Successfully Logged in!!");
            session.setAttribute("UserName", username);
            return "AdminController?action=getAdminIndex";
        }
        else if(objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Admin")){
            req.setAttribute("Message", "Successfully Logged in!!");
            session.setAttribute("UserName", username);
            return "AdminController?action=getAdminIndex";
        }
        else{
            req.setAttribute("Message", "Error Login!!");
            return "login.jsp";
        }
    }
    
}
