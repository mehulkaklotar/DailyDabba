/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class verify implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String code = session.getAttribute("code").toString();
        String enterredCode = req.getParameter("verificationCode");
        String user = req.getParameter("username");
        
        if(code.equals(enterredCode)){
            Administrator objAdministrator=new Administrator();
            objAdministrator.updateCustomerStatus(user);
            req.setAttribute("Message", "Succesfully registered!!!");
            req.setAttribute("from", "/DailyDibba/index.jsp");
            return "login.jsp";
        }else{
            req.setAttribute("Message", "Code you entered is incorrect");
            return "verification.jsp";
        }
    }
    
}
