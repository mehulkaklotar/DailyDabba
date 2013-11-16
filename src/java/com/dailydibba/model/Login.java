/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dailydibba.model;

import com.dailydibba.action.Action;
import com.dailydibba.bean.Administrator;
import com.dailydibba.bean.Area;
import com.dailydibba.bean.Feedback;
import com.dailydibba.bean.Menu;
import com.dailydibba.bean.User;
import com.dailydibba.bean.Vendor;
import com.dailydibba.bean.Visitor;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author kaklo
 */
public class Login implements Action {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Visitor objVisitor = new Visitor();
        User objUser = objVisitor.login(username);
        if (objUser != null) {
            if (objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Customer")) {
                String fromPage = "";
                fromPage = req.getParameter("from").substring(12, req.getParameter("from").length());
                req.setAttribute("Message", "Successfully Logged in!!");
                session.setAttribute("UserName", username);
                session.setAttribute("Role", objUser.getUsertype().getRole());


                if (fromPage.equals("vendor.jsp")) {
                    String vendorUN = req.getParameter("vendorUN");
                    objVisitor = new Visitor();
                    Vendor objVendor = objVisitor.getVendor(vendorUN);

                    int rating = objVisitor.getRatings(vendorUN);

                    //Vendor menu
                    Menu objMenuLunch = objVendor.getVendorMenuLunch(vendorUN);
                    Menu objMenuDinner = objVendor.getVendorMenuDinner(vendorUN);

                    // Get the details of feedback of that vendor
                    List<Feedback> feedbackList = objVisitor.getFeedbackForVendor(vendorUN);
                    req.setAttribute("feedback", feedbackList);
                    req.setAttribute("vendor", objVendor);
                    req.setAttribute("rating", rating);
                    req.setAttribute("menuLunch", objMenuLunch);
                    req.setAttribute("menuDinner", objMenuDinner);
                }
                if (fromPage.equals("index.jsp")) {
                    Administrator objAdministrator = new Administrator();
                    List<Area> areas = objAdministrator.getAllArea();
                    req.setAttribute("areas", areas);
                }
                return fromPage;
            } else if (objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Vendor")) {
                req.setAttribute("Message", "Successfully Logged in!!");
                session.setAttribute("UserName", username);
                session.setAttribute("Role", objUser.getUsertype().getRole());
                return "admin/dummyindex.jsp";
                //return "admin/AdminController?action=getAdminIndex";
            } else if (objUser.getPassword().equals(password) && objUser.getUsertype().getRole().equals("Admin")) {
                req.setAttribute("Message", "Successfully Logged in!!");
                session.setAttribute("UserName", username);
                session.setAttribute("Role", objUser.getUsertype().getRole());
                return "admin/dummyindex.jsp";
            } else {
                req.setAttribute("Message", "Error Login!!");
                return "login.jsp";
            }
        } else {
            req.setAttribute("Message", "Username invalid");
                return "login.jsp";
        }
    }
}
