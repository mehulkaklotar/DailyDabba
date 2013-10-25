/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
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

           req.setAttribute("result", "lunch");
        } else{
            req.setAttribute("result", "dinner");
        }
        return "/admin/successfulUpdationofMenu.jsp";
    }

}
