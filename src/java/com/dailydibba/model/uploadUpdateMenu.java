/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Item;
import com.dailydibba.bean.Menu;
import com.dailydibba.bean.MenuItem;
import com.dailydibba.bean.Vendor;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PRACHI
 */
public class uploadUpdateMenu implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        if(req.getParameter("btnUpdateMenulunch")!=null){
           int n=Integer.parseInt(req.getParameter("noOfSabzi"));
           Menu m=new Menu();
           MenuItem mi=new MenuItem();
           int ItemID,quantity;
           double cost;
           for(int i=1;i<=n;i++){
               ItemID=Integer.parseInt(req.getParameter("sabzi"+i));
               cost=Double.parseDouble(req.getParameter("costOfsabzi"+i));
               mi.setCost(cost);
               Item it=new Item();
               it.setItemID(ItemID);
               mi.setItem(it);
               mi.setQuantity(1);
               m.getMenuItem().add(mi);
           }
           ItemID=Integer.parseInt(req.getParameter("dal"));
           cost=Double.parseDouble(req.getParameter("costOfdal"));
           Item it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,cost,1);
           m.getMenuItem().add(mi);
           
           ItemID=Integer.parseInt(req.getParameter("roti"));
           cost=Double.parseDouble(req.getParameter("costOfroti"));
           int qty=Integer.parseInt(req.getParameter("qtyOfroti"));
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,cost,qty);
           m.getMenuItem().add(mi);
           
           ItemID=Integer.parseInt(req.getParameter("rice"));
           cost=Double.parseDouble(req.getParameter("costOfrice"));
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,cost,1);
           m.getMenuItem().add(mi);
           
           Vendor v=new Vendor();
           v.setUserName("Sai");
           
           ItemID=v.getItemOfType("Salad").get(0).getItemID();
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,0,1);
           m.getMenuItem().add(mi);
           
           ItemID=v.getItemOfType("Pickle").get(0).getItemID();
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,0,1);
           m.getMenuItem().add(mi);
           
           ItemID=v.getItemOfType("Papad").get(0).getItemID();
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,0,1);
           m.getMenuItem().add(mi);
           
           ItemID=v.getItemOfType("Buttermilk").get(0).getItemID();
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,0,1);
           m.getMenuItem().add(mi);
           
           ItemID=v.getItemOfType("Curd").get(0).getItemID();
           it=new Item();
           it.setItemID(ItemID);
           mi=new MenuItem(it,0,1);
           m.getMenuItem().add(mi);
           java.util.Date dt=new java.util.Date();
           
           //m.setUploadDateTime(new java.sql.Date(Long.parseLong(dt.toString())));
           m.setUploadDateTime(new java.sql.Date(System.currentTimeMillis()));
           String txt="needs to be done";
           m.setTiffinName(txt);
           if(v.updateMenu(m)){
               req.setAttribute("result", "Successful");
           }else{
                req.setAttribute("result", "Unsuccesful");
           }
        } else{
            req.setAttribute("result", "dinner");
        }
        return "/admin/successfulUpdationofMenu.jsp";
    }

}
