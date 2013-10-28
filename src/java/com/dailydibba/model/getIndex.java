/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.City;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class getIndex implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        List<Area> areas= objAdministrator.getAllArea();
        /*String[] areaArray = new String[areas.size()];
        Iterator it = areas.iterator();
        int i = 0;
        while(it.hasNext()){
            Area objArea = (Area) it.next();
            areaArray[i]=objArea.getAreaName();
            i++;
        }*/
        req.setAttribute("areas", areas);
        return "index.jsp";
    }
    
}
