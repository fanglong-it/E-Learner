/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fu.swp.controller.user;

import fu.swp.dao.AccountDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VerifyController", urlPatterns = {"/verify"})
public class VerifyController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            AccountDAO accountDao = new AccountDAO();
            String pass = request.getParameter("pass");
            String email = request.getParameter("email");
            accountDao.updateAccountStatus(email, 1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect("HomeController");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }

    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
