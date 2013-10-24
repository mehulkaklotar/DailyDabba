/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.City;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class getAllCity implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();

        List<City> cities=objAdministrator.getAllCity();
        req.setAttribute("cities", cities);
        return "admin/city.jsp";
    }
    
}
