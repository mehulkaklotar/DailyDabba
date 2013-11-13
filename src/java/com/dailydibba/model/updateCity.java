/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.City;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public class updateCity implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        String txtCityName=req.getParameter("txtCityName");
        int txtCityID=Integer.parseInt(req.getParameter("txtCityID"));
        objAdministrator.updateCity(txtCityName,txtCityID);//addCity(req.getParameter("txtCityName"));
        return "AdminController?action=getAllCity";
    }
    
}
