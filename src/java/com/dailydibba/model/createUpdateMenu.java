/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.Vendor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class createUpdateMenu implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        Vendor vendor=new Vendor();
        vendor.setUserName("Sai");
        List<Item> itemlist = vendor.getItemOfType("Sabzi");
        req.setAttribute("itemlist", itemlist);

        vendor=new Vendor();
        vendor.setUserName("Sai");
        List<Item> itemlistDal = vendor.getItemOfType("Dal");
        req.setAttribute("itemlistDal", itemlistDal);

        vendor=new Vendor();
        vendor.setUserName("Sai");
        List<Item> itemlistRoti = vendor.getItemOfType("Roti");
        req.setAttribute("itemlistRoti", itemlistRoti);

        vendor=new Vendor();
        vendor.setUserName("Sai");
        List<Item> itemlistRice = vendor.getItemOfType("Rice");
        req.setAttribute("itemlistRice", itemlistRice);
        return "/admin/dummyupdatemenu.jsp";
    }

}
