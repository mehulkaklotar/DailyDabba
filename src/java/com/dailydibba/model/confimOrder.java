/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Customer;
import com.dailydibba.bean.Tiffin;
import com.dailydibba.bean.Vendor;
import com.dailydibba.bean.VendorArea;
import com.dailydibba.bean.Visitor;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class confimOrder implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        String orderID = req.getParameter("orderID");
        int city = Integer.parseInt(req.getParameter("city"));
        int area = Integer.parseInt(req.getParameter("area"));
        String deliveryaddress = req.getParameter("deliveryaddress");
        String vendor = req.getParameter("vendor");
        int tiffincost = Integer.parseInt(req.getParameter("tiffincost"));

        Customer objCustomer = new Customer();
        List<VendorArea> vendorarea = objCustomer.getVendorArea(vendor);

        Iterator<VendorArea> it = vendorarea.iterator();
        while (it.hasNext()) {
            VendorArea objVendorArea = it.next();
            if (objVendorArea.getArea().getAreaID() == area) {
                Administrator objAdministrator = new Administrator();
                City objCity = objAdministrator.getCity(city);
                Area objArea = objAdministrator.getArea(area);
                deliveryaddress += " Area : " + objArea.getAreaName();
                deliveryaddress += " City : " + objCity.getCityName();
                //update order & confirm order 
                objCustomer.updateOrder(orderID, deliveryaddress);

                req.setAttribute("tiffinCost", tiffincost);

                Tiffin objTiffin = objCustomer.getOrder(orderID);
                req.setAttribute("tiffin", objTiffin);

                Visitor objVisitor = new Visitor();
                Vendor objVendor = objVisitor.getVendor(vendor);
                req.setAttribute("vendor", objVendor);

                return "orderconfirm.jsp";
            } else {

                req.setAttribute("orderID", orderID);
                req.setAttribute("tiffinCost", tiffincost);

                objCustomer = new Customer();
                Tiffin objTiffin = new Tiffin();
                objTiffin = objCustomer.getOrder(orderID);

                List<City> cities = new ArrayList<City>();
                Visitor visitor = new Visitor();
                cities = visitor.getCity();
                req.setAttribute("Cities", cities);

                req.setAttribute("tiffin", objTiffin);
                req.setAttribute("Alert", "Vendor is not providing service in this area.");
                return "placeorder.jsp";
            }
        }
        req.setAttribute("orderID", orderID);
        req.setAttribute("tiffinCost", tiffincost);
        req.setAttribute("vendorUN", vendor);

        objCustomer = new Customer();
        Tiffin objTiffin = new Tiffin();
        objTiffin = objCustomer.getOrder(orderID);

        req.setAttribute("tiffin", objTiffin);
        req.setAttribute("Alert", "Vendor is not providing service in this area.");
        return "placeorder.jsp";
    }
}
