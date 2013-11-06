/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Tiffin;
import com.dailydibba.bean.TiffinDetails;
import com.dailydibba.bean.Visitor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class preplaceorder implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        String customer = session.getAttribute("UserName").toString();

        String sabziarray = req.getParameter("sabzi");
        List<String> sabzi = Arrays.asList(sabziarray.split(","));
        int roti = Integer.parseInt(req.getParameter("roti"));
        int rotiQuantity = Integer.parseInt(req.getParameter("rotiQuantity"));
        int rice = Integer.parseInt(req.getParameter("rice"));
        int dal = Integer.parseInt(req.getParameter("dal"));
        int salad = Integer.parseInt(req.getParameter("salad"));
        int menuID = Integer.parseInt(req.getParameter("menuID"));
        int tiffin = Integer.parseInt(req.getParameter("tiffin"));
        int tiffincost = 0;

        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();

        UUID idOne = UUID.randomUUID();
        String str = "" + idOne;
        int uid = str.hashCode();
        String filterStr = "" + uid;
        str = filterStr.replaceAll("-", "");
        String orderID = str;
        
        Visitor objVisitor = new Visitor();

        Customer objCustomer = new Customer();
        objCustomer.insertOrder(customer, "", tiffin, menuID, false, dateFormat.format(date), orderID);

        List<TiffinDetails> tiffindetails;

        TiffinDetails objDetails;

        for (int i = 0; i < sabzi.size(); i++) {

            tiffindetails = objCustomer.getOrderDetails(orderID);

            if (tiffindetails.size() > 0) {
                Iterator it = tiffindetails.iterator();
                while (it.hasNext()) {
                    objDetails = (TiffinDetails) it.next();
                    if (Integer.parseInt(sabzi.get(i)) == objDetails.getItemID()) {
                        int q = objDetails.getQuantity() + 1;
                        objCustomer.updateOrderDetails(orderID, menuID, q);
                        tiffincost += objVisitor.getRateOfItem(objDetails.getItemID(), menuID);
                    } else {
                        objCustomer.insertOrderDetails(orderID, Integer.parseInt(sabzi.get(i)), 1);
                        tiffincost += objVisitor.getRateOfItem(objDetails.getItemID(), menuID);
                    }
                }
            } else {
                objCustomer.insertOrderDetails(orderID, Integer.parseInt(sabzi.get(i)), 1);
                tiffincost += objVisitor.getRateOfItem(Integer.parseInt(sabzi.get(i)), menuID);
            }
        }

        objCustomer.insertOrderDetails(orderID, rice, 1);
        tiffincost += objVisitor.getRateOfItem(rice, menuID);
        
        objCustomer.insertOrderDetails(orderID, dal, 1);
        tiffincost += objVisitor.getRateOfItem(dal, menuID);
        
        objCustomer.insertOrderDetails(orderID, roti, rotiQuantity);
        tiffincost += objVisitor.getRateOfItem(roti, menuID);
        
        if (salad != 0) {
            objCustomer.insertOrderDetails(orderID, salad, 1);
            tiffincost += objVisitor.getRateOfItem(salad, menuID);
        }

        String vendor = req.getParameter("vendorUN");
        
        req.setAttribute("orderID", orderID);
        req.setAttribute("tiffinCost", tiffincost);
        req.setAttribute("vendorUN", vendor);
        
        objCustomer = new Customer();
        Tiffin objTiffin = new Tiffin();
        objTiffin = objCustomer.getOrder(orderID);
        
        tiffindetails = objCustomer.getOrderDetails(orderID);
        
        req.setAttribute("tiffin", objTiffin);
        req.setAttribute("tiffindetails", tiffindetails);

        return "placeorder.jsp";

    }
}
