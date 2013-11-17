/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Visitor;
import com.dailydibba.bean.City;
import com.dailydibba.bean.UserRole;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
import java.util.*;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
//import javax.mail.*;
//import javax.mail.internet.*;

/**
 *
 * @author hp
 */
public class customerRegistration implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Visitor objVisitor = new Visitor();
        objVisitor.insertUser(req.getParameter("username"), req.getParameter("password"));
        objVisitor.insertUserRoles(req.getParameter("username"), "Customer");

        String username = req.getParameter("username");
        String firstname = req.getParameter("firstname");
        String lastname = req.getParameter("lastname");
        String mobile = req.getParameter("mobileno");
        String email = req.getParameter("emailid");
        String landmark = req.getParameter("landmark");
        String streetname = req.getParameter("streetname");
        String flatnumber = req.getParameter("flatnumber");
        String lane = flatnumber + "," + streetname + "," + landmark;
        int area = Integer.parseInt(req.getParameter("area"));

        objVisitor.insertCustomer(username, area, firstname, lastname, lane, mobile, email, false);

        UUID idOne = UUID.randomUUID();
        String str = "" + idOne;
        int uid = str.hashCode();
        String filterStr = "" + uid;
        str = filterStr.replaceAll("-", "");
        String code = str;
        System.out.println(code);

        HttpSession session = req.getSession();
        session.setAttribute("code", code);

        //sms send
        SMSSender.smsSender("akypvs", "156424", "91" + mobile, "www.dailydabba.co.in \n Verification Code : " + code, "WebSMS", "0");

        //sendmail
        sendmail(code,email);
        
        return "vendorsuccess.jsp";
    }

    public void sendmail(String code,String email) {
        try {
            String host = "smtp.gmail.com";
            String from = "mehul.kaklotar@gmail.com";//your gmail account
            String pass = "gj5gk2579";//your password of gmail account
            Properties props = System.getProperties();
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.user", from);
            props.put("mail.smtp.password", pass);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");

            String[] to = {email};
            // receiver mail address can be other then gmail

            javax.mail.Session session = Session.getDefaultInstance(props, null);
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));

            InternetAddress[] toAddress = new InternetAddress[to.length];

            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            System.out.println(Message.RecipientType.TO);

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            message.setSubject("Activate Your Account");//set subject of mail
            message.setContent("www.dailydabba.co.in \n Verification Code : " + code, "text/html");//set mail content
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception ex) {
            ex.getMessage();
        }

    }
}
