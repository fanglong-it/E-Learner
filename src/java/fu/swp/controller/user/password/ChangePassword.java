/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.user.password;

import fu.swp.dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import fu.swp.dto.ChangePasswordValidator;
import fu.swp.model.Account;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DW
 */
@WebServlet(name = "ChangePassword", urlPatterns = {"/change-password"})
public class ChangePassword extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ChangePassword</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ChangePassword at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        String url = "changePassword.jsp";
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            if (account != null) {
                request.setAttribute("account", account);
            } else {
                url = "login.jsp";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        String url = "changePassword.jsp";
        try {
            HttpSession session = request.getSession();
            Account users = (Account) session.getAttribute("account");
            if (users != null) {

                String currentPassword = request.getParameter("currentPassword");
                String newPassword = request.getParameter("newPassword");
                String reNewPassword = request.getParameter("reNewPassword");
                ChangePasswordValidator changePasswordValidator = new ChangePasswordValidator();
                boolean check = true;
                if (!users.getPassword().equals(currentPassword)) {
                    changePasswordValidator.setPassword("Your Password Not Match!");
                    check = false;
                }else{
                    changePasswordValidator.setPassword("");
                }
                if (!newPassword.equals(reNewPassword)) {
                    changePasswordValidator.setNewPassword("Your New Password and RePassword much match!");
                    check = false;
                }else{
                    changePasswordValidator.setNewPassword("");
                }
                String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
                if (!newPassword.matches(passwordRegex)) {
                    changePasswordValidator.setRePassword("Your Password Need At least 1 Uppercase char, 1 Lowercase char, 1 number, 1 Special Char, Length must be > 8");
                    check = false;
                }else{
                    changePasswordValidator.setRePassword("");
                }
                
                if (check) {
                    AccountDAO userDAO = new AccountDAO();
                    userDAO.changePassword(users.getId(), newPassword);
                    url = "profile?accountId=" + users.getId();
                } else {
                    //create message here
                    request.setAttribute("PasswordValidator", changePasswordValidator);
                }
            } else {
                url = "login.jsp";
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
