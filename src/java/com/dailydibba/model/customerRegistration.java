/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Visitor;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.mail.*;
//import javax.mail.internet.*;

/**
 *
 * @author Nidhi
 */
public class customerRegistration implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {


        Visitor objVisitor = new Visitor();
        objVisitor.insertUser(req.getParameter("txtUsername"), req.getParameter("txtPassword"), "Customer");

        objVisitor.insertCustomer(req.getParameter("txtUsername"),1, req.getParameter("txtFirstname"), req.getParameter("txtLastname"), req.getParameter("txtFlatNumber")+","+req.getParameter("txtStreetName")+","+req.getParameter("txtLandmark"), req.getParameter("txtMobileNumber"), req.getParameter("txtEmailID"), false);
        // System.out.println(req.getParameter("txtuserName"));
        Random r = new Random();
        int START = 100000;
        int END = 999999;
        int rm = r.nextInt(END - START + 1) + START;

        //sendsms();
        return "customerAuthentication.jsp";
    }
    
    
  /*  public void sendsms(){}
    
    public void sendmail()
    {
        String to = "nidpatel18@gmail.com";//change accordingly
        String from = "mehul.kaklotar@gmail.com";//change accordingly
        String host = "localhost";//or IP address

        //Get the session object
        Properties properties = System.getProperties();
        properties.setProperty("mail.smtp.host", host);
        Session session = Session.getDefaultInstance(properties);

        //compose the message
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Ping");
            message.setText("Hello, this is example of sending email  ");

            // Send message
            Transport.send(message);
            System.out.println("message sent successfully....");

        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }*/
}
