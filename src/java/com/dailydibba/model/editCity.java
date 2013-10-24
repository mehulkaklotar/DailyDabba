/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.City;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiran
 */
public class editCity implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        int cityid = Integer.parseInt(req.getParameter("cityId"));
        City objCity = new City();
        objCity = objAdministrator.getCity(cityid);
        req.setAttribute("city", objCity);
        return "admin/addCity.jsp";
    }
    
    
    
}
