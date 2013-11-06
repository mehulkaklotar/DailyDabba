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
        objVisitor.insertUser(req.getParameter("txtUsername"), req.getParameter("txtPassword"));
        objVisitor.insertUserRoles(req.getParameter("txtUsername"), "Customer");

        objVisitor.insertCustomer(req.getParameter("txtUsername"), Integer.parseInt(req.getParameter("listArea")), req.getParameter("txtFirstname"), req.getParameter("txtLastname"), req.getParameter("txtFlatNumber") + "," + req.getParameter("txtStreetName") + "," + req.getParameter("txtLandmark"), req.getParameter("txtMobileNumber"), req.getParameter("txtEmailID"), false);
        // System.out.println(req.getParameter("txtuserName"));
        List<City> cities;
        Visitor visitor=new Visitor();
        cities=visitor.getCity();
        req.setAttribute("Cities", cities);

        //sendsms();
        return "customerRegistration.jsp";
    }

    public void sendsms() {
    }

//    public void sendmail() {
//        String to = "nidpatel18@gmail.com";//change accordingly
//        String from = "mehul.kaklotar@gmail.com";//change accordingly
//        String host = "localhost";//or IP address
//
//        //Get the session object
//        Properties properties = System.getProperties();
//        properties.setProperty("mail.smtp.host", host);
//        Session session = Session.getDefaultInstance(properties);
//
//        //compose the message
//        try {
//            MimeMessage message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(from));
//            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
//            message.setSubject("Ping");
//            message.setText("Hello, this is example of sending email  ");
//
//            // Send message
//            Transport.send(message);
//            System.out.println("message sent successfully....");
//
//        } catch (MessagingException mex) {
//            mex.printStackTrace();
//        }
//
//    }
}
