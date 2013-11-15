/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author akyp
 */
public class deleteFeedback implements Action {
    
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        Administrator objAdministrator = new Administrator();
        int feedback_id = Integer.parseInt(req.getParameter("id"));
        objAdministrator.deleteFeedback(feedback_id);
        return "AdminController?action=getFeedbackList";
    }
    
}
