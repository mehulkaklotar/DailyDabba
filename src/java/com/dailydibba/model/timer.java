/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import java.sql.*;
import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 *
 * @author tony
 */
public class timer implements ServletContextListener {

    Connection con;
    Statement st;

    public timer() throws Exception {
        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);
        // Create a connection to the database
        String url = "jdbc:mysql://localhost/tiffinserviceportaldb";
        String username = "root";
        String password = "";
        con = DriverManager.getConnection(url, username, password);
        st = con.createStatement();
    }
    private Timer timer;

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        System.out.println("ServletContextListener destroyed");
        timer.cancel();
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        //timer = new Timer("blkunblk");
        //if (Calendar.getInstance().get(Calendar.HOUR) == 11) {
        // run
        // }
        //timer.schedule(timertask, 0, 1000 * 60 * 60 * 24);
        //        System.out.println("ServletContextListener started");        


        new Timer().scheduleAtFixedRate(new TimerTask() {
            public void run() {
                if (Calendar.getInstance().get(Calendar.HOUR) == 11) {
                    try {
                        //System.out.println(objsql);
                        //objsql.persist("declare begin salin; end;");
                        String sql = "select  count(o.orderid) as count,m.UserName , v.mobileno from `order` o,menu m,vendor v where o.menuid = m.menuid and m.UserName = v.UserName and Date(o.OrderDate) = CURDATE() and o.Status = '1'";
                        ResultSet rs = st.executeQuery(sql);
                        while (rs.next()) {
                            if (rs.getInt("count") > 0) {
                                SMSSender.smsSender("akypvs", "156424", "91" + rs.getString("mobileno"), "Daily Dabba \n You have received orders \n Total Orders :  " + rs.getInt("count"), "WebSMS", "0");
                            }
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
        }, new Date(System.currentTimeMillis() / (3600 * 1000) * (3600 * 1000)), (3600 * 1000));

    }
}
