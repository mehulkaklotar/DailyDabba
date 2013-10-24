/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Vendor;
import com.dailydibba.bean.Visitor;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        String[] searchString = req.getParameter("searchString").split(","); //split string to get city and area
        String area = searchString[0]; 
        String city = searchString[1];
        Visitor objVisitor = new Visitor(); //creating visitor object to call searchVendor method
        List<Vendor> vendorList = new ArrayList<Vendor>(); //creating list to handle vendor list returned from database
        vendorList = objVisitor.searchVendor(city, area); //calling funcation and getting result
        req.setAttribute("vendorList",vendorList); //setting request object and passing vendorList
        return "getVendorList.jsp"; //passing request to Contoller with request and response object
    }
    
}
