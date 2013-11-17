/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.City;
import com.dailydibba.bean.Visitor;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class selectCustomer implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        List<City> cities=new ArrayList<City>();
        Visitor visitor=new Visitor();
        cities=visitor.getCity();
        req.setAttribute("Cities", cities);
        return "customerRegistration.jsp";
    }
    
    
    
}
