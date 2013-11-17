/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

/**
 *
 * @author kaklo
 */
// File Name SendHTMLEmail.java
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendHTMLEmail {

    public static void main(String[] args) {

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

            String[] to = {"nidpatel18@gmail.com"};
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
            message.setContent("<a href='http://localhost:8080/WorkflowAutomationJSF/faces/abc.xhtml?user=hello' >Click here</a> to activate your account.", "text/html");//set mail content
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        } catch (Exception ex) {
            ex.getMessage();
        }

    }
}
