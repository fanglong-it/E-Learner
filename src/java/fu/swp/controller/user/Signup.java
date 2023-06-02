/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.controller.user;

import fu.swp.dao.AccountDAO;
import fu.swp.model.Account;
import fu.swp.model.Role;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author thuong
 */
@WebServlet(name = "Signup", urlPatterns = {"/Signup"})
public class Signup extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
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
        processRequest(request, response);
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
            AccountDAO dao = new AccountDAO();
            String user = request.getParameter("username");
            String pass = request.getParameter("pass");
            String re_pass = request.getParameter("repass");
            String email = request.getParameter("email");
            if (!pass.equals(re_pass)) {
                response.sendRedirect("Login.jsp");
            } else {
                Account ac = null;
                if (ac == null) {
                    // dc tao tk
                    // dao.singup(user, pass, email, 0, avatar, address, gender, avatar);
//                String subject = "Verify your account";
//                String message = "String message = \"<!DOCTYPE html>\\n\"\n"
//                        + "                    + \"<html lang=\\\"en\\\">\\n\"\n"
//                        + "                    + \"<head></head>\\n\"\n"
//                        + "                    + \"<body style=\\\"color:#000;\\\">\\n\"\n"
//                        + "                    + \"    <h3>Welcome to join E-learning</h3>\\n\"\n"
//                        + "                    + \"    <p>Please click here to verify your account</p>\\n\"\n"
//                        + "                    + \"    \\n\"\n"
//                        + "                    + \"    <form id=\\\"myForm\\\" method=\\\"POST\\\" action=\" + Base.LINK_VERIFY + \">\\n\"\n"
//                        + "                    + \"        <input type=\\\"hidden\\\" value=\" + email + \" id=\\\"email\\\" name=\\\"email\\\">\\n\"\n"
//                        + "                    + \"        <input type=\\\"hidden\\\" value=\" + pass + \" id=\\\"password\\\" name=\\\"password\\\">\\n\"\n"
//                        + "                    + \"        <input type=\\\"submit\\\" value=\\\"Verify\\\" \\n\"\n"
//                        + "                    + \"            style=\\\"padding: 10px 15px;color: #fff;background-color: rgb(0, 149, 255);border-radius: 10px;border:none\\\"\\n\"\n"
//                        + "                    + \"        >\\n\"\n"
//                        + "                    + \"    </form>\\n\"\n"
//                        + "                    + \"\\n\"\n"
//                        + "                    + \"    <h4>Thank you very much</h4>\\n\"\n"
//                        + "                    + \"</body>\\n\"\n"
//                        + "                    + \"</html>\";";
//
//                SendEmail.sendMail(email, subject, message, Base.USERNAME_EMAIL, Base.PASSWORD_EMAIL);
//                request.setAttribute("success", "Verification link has been sent to your email");
//                System.out.println("user: " + user);
                    new AccountDAO().saveAccount(new Account(0, user, pass, 1, user, "", "", "", "", new Role(1, "USER")));
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                } else {
                    // day ve login
                    response.sendRedirect("Signup.jsp");

                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
