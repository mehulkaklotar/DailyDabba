/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.City;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class addArea implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        String area_name=req.getParameter("txtAreaName");
        int city_id=Integer.parseInt(req.getParameter("cityList"));
        objAdministrator.addArea(area_name, city_id);
        List<Area> areas=objAdministrator.getAllArea();
        req.setAttribute("areas", areas);
        return "area.jsp";
    }    
}
