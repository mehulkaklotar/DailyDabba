/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Visitor;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AKYP
 */
public class vendorRegistration implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
       
        Visitor objVisitor = new Visitor();
        objVisitor.insertUser(req.getParameter("username"), req.getParameter("password"));
        objVisitor.insertUserRoles(req.getParameter("username"),"Vendor");
        
        objVisitor.insertVendor(req.getParameter("username"), Integer.parseInt(req.getParameter("area")), req.getParameter("vendorname"), req.getParameter("mobileno"),req.getParameter("emailID"), req.getParameter("flat")+","+req.getParameter("street")+","+req.getParameter("landmark"), req.getParameter("ownername"), req.getParameter("landlineno"),false, false);
        
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
        SMSSender.smsSender("akypvs", "156424", "91"+req.getParameter("mobileno"),"www.dailydabba.co.in \n Verification Code : "+code, "WebSMS", "0");
        
        //send mail
        sendmail(code,req.getParameter("emailID"));
        
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
