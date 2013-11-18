/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.bean.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dailydibba.action.Action;
import java.util.UUID;
import javax.swing.JOptionPane;

/**
 *
 * @author hp
 */
public class forgotPassword implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        String username = req.getParameter("txtUserName");

        User objUser = new User();
        String mobile = objUser.getMobileUser(username);
        UUID idOne = UUID.randomUUID();
        String str = "" + idOne;
        int uid = str.hashCode();
        String filterStr = "" + uid;
        str = filterStr.replaceAll("-", "");
        String code = str;
        System.out.println(code);
      //  HttpSession session = req.getSession();
        //session.setAttribute("code", code);
   boolean a= objUser.updatePassword(code, username);
        //sms send
        SMSSender.smsSender("akypvs", "156424", "91" + mobile, "www.dailydabba.co.in \n Username : "+username +"\n Your New Password : " + code, "WebSMS", "0");

        //sendmail
        //sendmail(email,username);
      JOptionPane.showMessageDialog(null, "Are you really OK?");

        return "login.jsp";
        //objUser.changePassword(username, username);

        //return "changePassword.jsp";
    }
}
