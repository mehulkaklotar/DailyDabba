/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kaklo
 */
public interface Action {
    
    String execute(HttpServletRequest req,HttpServletResponse res);
    
}
