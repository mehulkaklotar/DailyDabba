/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HR
 */
public class getAllOrder implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        Administrator objAdministraotr = new Administrator();
        ArrayList objArrayList = objAdministraotr.getAllOrders();
        req.setAttribute("orders", objArrayList);
        return "viewOrders.jsp";
    }
    
}
