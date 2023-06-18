/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.controller.user;

import fu.swp.base.Base;
import fu.swp.dao.AccountDAO;
import fu.swp.model.Account;
import fu.swp.model.Role;
import fu.swp.utils.MailSender;
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

    private static final String LOGIN_PAGE = "Login.jsp";
    private static final String REGIS_PAGE = "Signup.jsp";

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
//            String user = request.getParameter("username");
        String url = LOGIN_PAGE;
        String msg = "";
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String re_pass = request.getParameter("rePassword");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        try {
            AccountDAO accountDAO = new AccountDAO();
            if (!pass.equals(re_pass)) {
                msg = "Password not match!";
                url = REGIS_PAGE;
            } else {
                Account ac = accountDAO.getAccountByEmail(email);
                if (ac == null) {
                    String subject = "Verify your account form E-Learner";
                    
                    String link = Base.LINK_VERIFY + "?email=" + email + "&password=" + pass;
                    String message = "<!DOCTYPE html>\n"
                            + "<html lang=\"en\">\n"
                            + "<head>\n"
                            + "</head>\n"
                            + "<body style=\"color:#000;\">\n"
                            + "    <h3>Welcome to join E-learning</h3>\n"
                            + "    <p>Please click <a href=\"" + link + "\">here</a> to verify your account</p>\n"
                            + "    <h4>Thank you very much</h4>\n"
                            + "</body>\n"
                            + "</html>";
                    Account account = accountDAO.saveAccount(new Account(0, email, pass, 0, email, phone, fullname, "", "", new Role(3, Base.ROLE_STUDENT)));
                    if (account != null) {
                        MailSender.send(subject, message, email);
                        msg = "Please Check your mail Box!";
                        url = LOGIN_PAGE;
                    }
                } else {
                    msg = "Your Account already Exist!";
                    url = LOGIN_PAGE;
                }
            }
            request.setAttribute("ERROR", msg);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
