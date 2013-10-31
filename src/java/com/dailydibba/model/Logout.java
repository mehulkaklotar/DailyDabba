/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class Logout implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {

        HttpSession session = req.getSession();
        if (session != null) {
            session.invalidate();
        }
        return "Controller?action=getIndex";
    }
}
