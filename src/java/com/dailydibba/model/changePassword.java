/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class changePassword implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        String username = session.getAttribute("UserName").toString();

        Administrator objAdministrator = new Administrator();
        User objUser = objAdministrator.getUser(username);


        if (req.getParameter("txtOldPassword").equals(objUser.getPassword()) && objUser != null) {
            objAdministrator.changePassword(username, req.getParameter("txtNewPassword"));
            req.setAttribute("error", "Updated");
        }else{
            req.setAttribute("error", "Old password doesn't match");
        }

        return "changePassword.jsp";
    }
}
