/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.bean;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PRACHI
 */
public class DBConnection {

    //Author: Mehul Kaklotar
    //Date and Time: 09-October-2013
    //Purpose: Data Layer Class to establish connection and execute //queries and procedures
    String username = "root";
    String password = "root";
    String url = "jdbc:mysql://localhost/tiffinserviceportaldb";
    Connection connection = null;
    ResultSet resultSet = null;
    Statement statement = null;
    CallableStatement callableStatement = null;

    public DBConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            connection = DriverManager.getConnection(url, username, password);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void closeConnection() {
        try {
            this.connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
