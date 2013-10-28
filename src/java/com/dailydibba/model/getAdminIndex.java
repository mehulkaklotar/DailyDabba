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
 * @author kaklo
 */
public class getAdminIndex implements Action{

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        return "index.jsp";
    }
    
}
