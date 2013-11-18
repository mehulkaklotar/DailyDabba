/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Tiffin;
import com.dailydibba.bean.TiffinDetails;
import com.dailydibba.bean.Visitor;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
        int curd = Integer.parseInt(req.getParameter("curd"));
        int buttermilk = Integer.parseInt(req.getParameter("buttermilk"));
        int papad = Integer.parseInt(req.getParameter("papad"));
        int pickle = Integer.parseInt(req.getParameter("pickle"));
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
                    if (Integer.parseInt(sabzi.get(i)) == objDetails.getItem().getItemID()) {
                        int q = objDetails.getQuantity() + 1;
                        objCustomer.updateOrderDetails(orderID, menuID, q);
                        tiffincost += objVisitor.getRateOfItem(objDetails.getItem().getItemID(), menuID);
                    } else {
                        objCustomer.insertOrderDetails(orderID, Integer.parseInt(sabzi.get(i)), 1);
                        tiffincost += objVisitor.getRateOfItem(objDetails.getItem().getItemID(), menuID);
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
        tiffincost += objVisitor.getRateOfItem(roti, menuID)*rotiQuantity;
        
        if (salad != 0) {
            objCustomer.insertOrderDetails(orderID, salad, 1);
            tiffincost += objVisitor.getRateOfItem(salad, menuID);
        }
        
        if (papad != 0) {
            objCustomer.insertOrderDetails(orderID, papad, 1);
            tiffincost += objVisitor.getRateOfItem(papad, menuID);
        }

        if (pickle != 0) {
            objCustomer.insertOrderDetails(orderID, pickle, 1);
            tiffincost += objVisitor.getRateOfItem(pickle, menuID);
        }
        
        if (buttermilk != 0) {
            objCustomer.insertOrderDetails(orderID, buttermilk, 1);
            tiffincost += objVisitor.getRateOfItem(buttermilk, menuID);
        }
        
        if (curd != 0) {
            objCustomer.insertOrderDetails(orderID, curd, 1);
            tiffincost += objVisitor.getRateOfItem(curd, menuID);
        }
        
        req.setAttribute("orderID", orderID);
        req.setAttribute("tiffinCost", tiffincost);
        
        objCustomer = new Customer();
        Tiffin objTiffin = new Tiffin();
        objTiffin = objCustomer.getOrder(orderID);
        
        req.setAttribute("tiffin", objTiffin);
        
        List<City> cities=new ArrayList<City>();
        Visitor visitor=new Visitor();
        cities=visitor.getCity();
        req.setAttribute("Cities", cities);

        return "placeorder.jsp";

    }
}
