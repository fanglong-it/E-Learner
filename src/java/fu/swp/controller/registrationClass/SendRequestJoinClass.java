/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package fu.swp.controller.registrationClass;

import fu.swp.dao.RegistrationDAO;
import fu.swp.model.Account;
import fu.swp.model.RegistrationClass;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DW
 */
@WebServlet(name = "SendRequestJoinClass", urlPatterns = {"/send-request"})
public class SendRequestJoinClass extends HttpServlet {

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
            out.println("<title>Servlet SendRequestJoinClass</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendRequestJoinClass at " + request.getContextPath() + "</h1>");
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
        String url = "detail-course.jsp"; // To course Detail if success! Get Current User, Update Again the viewDetail Course
        String msg = "";
        //To Waiting the Teacher Approve!
        try {
            HttpSession session = request.getSession();
            Account account = (Account) session.getAttribute("account");
            RegistrationDAO registrationDAO = new RegistrationDAO();
            if (account != null) {
                String classId = request.getParameter("selectedClassId");
                String courseId = request.getParameter("courseId");
                if (account.getRole().getRole_name().equals("TEACHER")) {
                    url = "course-detail?courseId=" + courseId;
                    request.setAttribute("error", "You can't Send Request");
                } else {
                    long currentDate = System.currentTimeMillis();
                    if (!registrationDAO.isSendRegistration(Integer.parseInt(classId), Integer.parseInt(courseId))) {
                        RegistrationClass registrationClass
                                = registrationDAO.saveRegistrationClass(new RegistrationClass(0, new Date(currentDate), "Pending",
                                        Integer.parseInt(classId), account.getId(), account));
                        if (registrationClass != null) {
                            msg = "Send Request Success view Profile History";
                        }
                    } else {
                        msg = "Your already Send to this class, View History!";
                    }
                    url = "course-detail?courseId=" + courseId;
                    request.setAttribute("error", msg);
                }

            } else {
                url = "Login.jsp";
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
        processRequest(request, response);
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
