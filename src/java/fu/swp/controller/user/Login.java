/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.controller.user;

import fu.swp.dao.AccountDAO;
import fu.swp.model.Account;
import java.io.IOException;
import java.time.Year;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Cookie[] cookies = request.getCookies();
            String username = null;
            String password = null;
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("username")) {
                    username = cooky.getValue();
                }
                if (cooky.getName().equals("password")) {
                    password = cooky.getValue();
                }
                if (username != null && password != null) {
                    break;
                }
            }

            if (username != null && password != null) {
                Account account = new AccountDAO().checkLogin(username, password);
                if (account != null) { //cookie hợp lệ
                    request.getSession().setAttribute("account", account);
                    if (account.getRole().getRole_name().equalsIgnoreCase("ADMIN")) {
//                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        request.getRequestDispatcher("HomeController").forward(request, response);
                    }
                }
            }
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            String username = request.getParameter("user");
            String password = request.getParameter("pass");
            String remember = request.getParameter("remember");

            // check username, password
            Account account = new AccountDAO().checkLogin(username, password);

            if (account != null) { //hợp lệ -> lưu lên session
                //remember
                if (remember != null) {
                    Cookie usernameCookie = new Cookie("username", username);
                    usernameCookie.setMaxAge(60 * 60 * 24 * 2);
                    Cookie passwordCookie = new Cookie("password", password);
                    passwordCookie.setMaxAge(60 * 60 * 24 * 2);
                    response.addCookie(usernameCookie);
                    response.addCookie(passwordCookie);
                }
                request.getSession().setAttribute("account", account);
                if (account.getRole().getRole_name().equalsIgnoreCase("ADMIN")) {
                    
                } else {
                    request.getRequestDispatcher("HomeController").forward(request, response);
                }

                //không remember
            } else {//Không hợp lệ -> trả về lỗi
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
