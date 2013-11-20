/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author PRACHI
 */
public class areaScript {
    
public static void main(String[] args) {
        // TODO code application logic here
        String username = "root";
        String password = "";
        String url = "jdbc:mysql://localhost/tiffinserviceportaldb";
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement = null;
        CallableStatement callableStatement = null;
         try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(url, username, password);
                BufferedReader br = null;
 
		try {
 
			String sCurrentLine;
 
//			br = new BufferedReader(new FileReader("areaAhmedabad.txt"));
//                        
//			while ((sCurrentLine = br.readLine()) != null) {
//                            callableStatement=connection.prepareCall("{call getCityID(?)}");
//                            callableStatement.setString(1, "Ahmedabad");
//                            resultSet=callableStatement.executeQuery();
//                            int cityID = 0;
//                            if(resultSet.next()){
//                                cityID=resultSet.getInt(1);
//                            }
//                            callableStatement=connection.prepareCall("{call addArea(?,?)}");
//                            callableStatement.setString(1, sCurrentLine);
//                            callableStatement.setInt(2, cityID);
//                            callableStatement.executeUpdate();
//                            System.out.println(sCurrentLine);
//			}
//                        
//                        br = new BufferedReader(new FileReader("areaVadodara.txt"));
//                        
//			while ((sCurrentLine = br.readLine()) != null) {
//                            callableStatement=connection.prepareCall("{call getCityID(?)}");
//                            callableStatement.setString(1, "Vadodara");
//                            resultSet=callableStatement.executeQuery();
//                            int cityID = 0;
//                            if(resultSet.next()){
//                                cityID=resultSet.getInt(1);
//                            }
//                            callableStatement=connection.prepareCall("{call addArea(?,?)}");
//                            callableStatement.setString(1, sCurrentLine);
//                            callableStatement.setInt(2, cityID);
//                            callableStatement.executeUpdate();
//                            System.out.println(sCurrentLine);
//			}
                        
                        br = new BufferedReader(new FileReader("areaSurat.txt"));
                        
			while ((sCurrentLine = br.readLine()) != null) {
                            callableStatement=connection.prepareCall("{call getCityID(?)}");
                            callableStatement.setString(1, "Surat");
                            resultSet=callableStatement.executeQuery();
                            int cityID = 0;
                            if(resultSet.next()){
                                cityID=resultSet.getInt(1);
                            }
                            callableStatement=connection.prepareCall("{call addArea(?,?)}");
                            callableStatement.setString(1, sCurrentLine);
                            callableStatement.setInt(2, cityID);
                            callableStatement.executeUpdate();
                            System.out.println(sCurrentLine);
			}
                        
                        br = new BufferedReader(new FileReader("areaGandhinagar.txt"));
                        
			while ((sCurrentLine = br.readLine()) != null) {
                            callableStatement=connection.prepareCall("{call getCityID(?)}");
                            callableStatement.setString(1, "Gandhinagar");
                            resultSet=callableStatement.executeQuery();
                            int cityID = 0;
                            if(resultSet.next()){
                                cityID=resultSet.getInt(1);
                            }
                            callableStatement=connection.prepareCall("{call addArea(?,?)}");
                            callableStatement.setString(1, sCurrentLine);
                            callableStatement.setInt(2, cityID);
                            callableStatement.executeUpdate();
                            System.out.println(sCurrentLine);
			}
 
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null)br.close();
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
 

            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    
}

