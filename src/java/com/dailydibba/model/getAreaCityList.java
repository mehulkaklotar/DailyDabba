/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Visitor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HR
 */
public class getAreaCityList implements Action {

    public String execute(HttpServletRequest req, HttpServletResponse res) {
        
        Visitor objVisitor = new Visitor();
        List<Area> areaCity = objVisitor.getAreaCityList();
        req.setAttribute("areaCity", areaCity);
        return "index.jsp";
    }
    
}
