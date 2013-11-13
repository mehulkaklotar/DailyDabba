/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class getAllAreaByCity implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        int cityID = Integer.parseInt(req.getParameter("cityID"));
        Administrator objAdministrator = new Administrator();
        List<Area> areas = objAdministrator.getAllCityArea(cityID);
        req.setAttribute("areas", areas);
        return "areaList.jsp";
    }
    
}
