/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.Menu;
import com.dailydibba.bean.Vendor;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PRACHI
 */
public class createUpdateMenu implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session=req.getSession();
        Vendor vendor=new Vendor();
        
        Menu listLunch = vendor.getVendorMenuLunch(session.getAttribute("UserName").toString());
        req.setAttribute("listLunch", listLunch);
        Menu listDinner = vendor.getVendorMenuDinner(session.getAttribute("UserName").toString());
        req.setAttribute("listDinner", listDinner);
        
        vendor.setUserName(session.getAttribute("UserName").toString());
        List<Item> itemlist = vendor.getItemOfType("Sabzi");
        req.setAttribute("itemlist", itemlist);

        vendor=new Vendor();
        vendor.setUserName(session.getAttribute("UserName").toString());
        List<Item> itemlistDal = vendor.getItemOfType("Dal");
        req.setAttribute("itemlistDal", itemlistDal);

        vendor=new Vendor();
        vendor.setUserName(session.getAttribute("UserName").toString());
        List<Item> itemlistRoti = vendor.getItemOfType("Roti");
        req.setAttribute("itemlistRoti", itemlistRoti);

        vendor=new Vendor();
        vendor.setUserName(session.getAttribute("UserName").toString());
        List<Item> itemlistRice = vendor.getItemOfType("Rice");
        req.setAttribute("itemlistRice", itemlistRice);
        
        Date date = new Date();
        String sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        
        req.setAttribute("date", sd);
        return "updatemenu.jsp";
    }

}
