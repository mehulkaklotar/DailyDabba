/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.Vendor;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class editItem implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        //Administrator objAdministrator = new Administrator();
        Vendor objVendor=new Vendor();
        int itemid = Integer.parseInt(req.getParameter("itemId"));
        Item objItem = new Item();
        //ArrayList<Item> itemList = new ArrayList<Item>(); 
        objItem = objVendor.getItemDetails(itemid);
        req.setAttribute("itemList", objItem);
        return "addItem.jsp";
    }
}
